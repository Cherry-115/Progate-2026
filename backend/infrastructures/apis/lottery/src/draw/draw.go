package main

import (
"context"
"encoding/json"
"log"
"math/rand"
"os"
"time"

"github.com/aws/aws-lambda-go/events"
"github.com/aws/aws-lambda-go/lambda"
"github.com/aws/aws-sdk-go-v2/aws"
"github.com/aws/aws-sdk-go-v2/config"
"github.com/aws/aws-sdk-go-v2/feature/dynamodb/attributevalue"
"github.com/aws/aws-sdk-go-v2/service/dynamodb"
"github.com/aws/aws-sdk-go-v2/service/dynamodb/types"
"github.com/google/uuid"
)

var (
dynamoClient          *dynamodb.Client
lotteryResultsTable   = os.Getenv("LOTTERYRESULTS_TABLE_NAME")
inventoriesTable      = os.Getenv("INVENTORIES_TABLE_NAME")
)

func init() {
if lotteryResultsTable == "" {
lotteryResultsTable = "LotteryResults"
}
if inventoriesTable == "" {
inventoriesTable = "Inventories"
}
cfg, err := config.LoadDefaultConfig(context.TODO())
if err != nil {
log.Fatalf("unable to load SDK config, %v", err)
}
dynamoClient = dynamodb.NewFromConfig(cfg)
rand.Seed(time.Now().UnixNano())
}

type DrawRequest struct {
StoreID        string `json:"storeId"`
IdempotencyKey string `json:"idempotencyKey"`
}

type DrawResponse struct {
ResultID   string `json:"resultId"`
PrizeGrade string `json:"prizeGrade"`
Status     string `json:"status"`
}

type ErrorResponse struct {
Error string `json:"error"`
}

type LotteryResult struct {
ResultID       string `dynamodbav:"result_id"`
UserID         string `dynamodbav:"userId"`
StoreID        string `dynamodbav:"storeId"`
PrizeGrade     string `dynamodbav:"prizeGrade"`
Status         string `dynamodbav:"status"`
PaymentID      string `dynamodbav:"paymentId"`
CreatedAt      string `dynamodbav:"createdAt"`
IdempotencyKey string `dynamodbav:"idempotencyKey"`
}

type Inventory struct {
StoreID        string `dynamodbav:"store_id"`
PrizeGrade     string `dynamodbav:"prizeGrade"`
PrizeName      string `dynamodbav:"prizeName"`
TotalCount     int    `dynamodbav:"totalCount"`
RemainingCount int    `dynamodbav:"remainingCount"`
Version        int    `dynamodbav:"version"`
}

func handler(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
var userId string
if request.RequestContext.Authorizer != nil {
if claims, ok := request.RequestContext.Authorizer["claims"].(map[string]interface{}); ok {
if sub, ok := claims["sub"].(string); ok {
userId = sub
}
}
}
if userId == "" {
userId = "UNKNOWN_USER"
}

var reqBody DrawRequest
err := json.Unmarshal([]byte(request.Body), &reqBody)
if err != nil || reqBody.StoreID == "" || reqBody.IdempotencyKey == "" {
return clientError(400, "Invalid request body", err)
}

inventories, err := getInventoriesByStore(ctx, reqBody.StoreID)
if err != nil {
return clientError(500, "Failed to get store inventories", err)
}
if len(inventories) == 0 {
return clientError(404, "No inventory found for store", nil)
}

totalRemaining := 0
for _, inv := range inventories {
totalRemaining += inv.RemainingCount
}
if totalRemaining <= 0 {
return clientError(400, "All prizes are sold out", nil)
}

winningInv := selectPrize(inventories, totalRemaining)

err = updateInventoryTransaction(ctx, winningInv)
if err != nil {
return clientError(409, "Collision or out of stock, please retry", err)
}

resultID := uuid.New().String()
res := LotteryResult{
ResultID:       resultID,
UserID:         userId,
StoreID:        reqBody.StoreID,
PrizeGrade:     winningInv.PrizeGrade,
Status:         "WON",
CreatedAt:      time.Now().UTC().Format(time.RFC3339),
IdempotencyKey: reqBody.IdempotencyKey,
}

err = saveResult(ctx, res)
if err != nil {
return clientError(500, "Failed to record result", err)
}

resp := DrawResponse{
ResultID:   resultID,
PrizeGrade: winningInv.PrizeGrade,
Status:     "WON",
}
respJson, _ := json.Marshal(resp)

return events.APIGatewayProxyResponse{
StatusCode: 200,
Headers: map[string]string{
"Content-Type": "application/json",
"Access-Control-Allow-Origin": "*",
},
Body: string(respJson),
}, nil
}

func getInventoriesByStore(ctx context.Context, storeId string) ([]Inventory, error) {
expr, err := attributevalue.Marshal(storeId)
if err != nil {
return nil, err
}

queryInput := &dynamodb.QueryInput{
TableName:              aws.String(inventoriesTable),
KeyConditionExpression: aws.String("store_id = :s"),
ExpressionAttributeValues: map[string]types.AttributeValue{
":s": expr,
},
}

result, err := dynamoClient.Query(ctx, queryInput)
if err != nil {
return nil, err
}

var items []Inventory
err = attributevalue.UnmarshalListOfMaps(result.Items, &items)
return items, err
}

func selectPrize(inventories []Inventory, total int) Inventory {
r := rand.Intn(total)
cumulative := 0
for _, inv := range inventories {
cumulative += inv.RemainingCount
if r < cumulative {
return inv
}
}
return inventories[len(inventories)-1]
}

func updateInventoryTransaction(ctx context.Context, inv Inventory) error {
pkStoreId, _ := attributevalue.Marshal(inv.StoreID)
skPrizeGrade, _ := attributevalue.Marshal(inv.PrizeGrade)
currentVersion, _ := attributevalue.Marshal(inv.Version)

newRemaining := inv.RemainingCount - 1
newVersion := inv.Version + 1
valRemaining, _ := attributevalue.Marshal(newRemaining)
valVersion, _ := attributevalue.Marshal(newVersion)

input := &dynamodb.UpdateItemInput{
TableName: aws.String(inventoriesTable),
Key: map[string]types.AttributeValue{
"store_id":   pkStoreId,
"prizeGrade": skPrizeGrade,
},
ConditionExpression: aws.String("remainingCount > :zero AND version = :cv"),
UpdateExpression:    aws.String("SET remainingCount = :nr, version = :nv"),
ExpressionAttributeValues: map[string]types.AttributeValue{
":zero": &types.AttributeValueMemberN{Value: "0"},
":cv":   currentVersion,
":nr":   valRemaining,
":nv":   valVersion,
},
}

_, err := dynamoClient.UpdateItem(ctx, input)
return err
}

func saveResult(ctx context.Context, res LotteryResult) error {
item, err := attributevalue.MarshalMap(res)
if err != nil {
return err
}

input := &dynamodb.PutItemInput{
TableName: aws.String(lotteryResultsTable),
Item:      item,
}
_, err = dynamoClient.PutItem(ctx, input)
return err
}

func clientError(status int, message string, err error) (events.APIGatewayProxyResponse, error) {
if err != nil {
	log.Printf("Client error %d: %s, err: %v\n", status, message, err)
} else {
	log.Printf("Client error %d: %s\n", status, message)
}
resp := ErrorResponse{Error: message}
b, _ := json.Marshal(resp)
return events.APIGatewayProxyResponse{
StatusCode: status,
Headers: map[string]string{
"Content-Type": "application/json",
"Access-Control-Allow-Origin": "*",
},
Body: string(b),
}, nil
}

func loggingHandler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	log.Printf("Request: %+v\n", req)
	resp, err := handler(ctx, req)
	if err != nil {
		log.Printf("Error: %v\n", err)
	}
	log.Printf("Response: %+v\n", resp)
	return resp, err
}

func main() {
	lambda.Start(loggingHandler)
}
