package main

import (
	"context"
	"encoding/json"
	"log"
	"os"
	"strings"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/feature/dynamodb/attributevalue"
	"github.com/aws/aws-sdk-go-v2/service/dynamodb"
	"github.com/aws/aws-sdk-go-v2/service/dynamodb/types"
)

var (
	dynamoClient     *dynamodb.Client
	inventoriesTable = os.Getenv("INVENTORIES_TABLE_NAME")
)

func init() {
	if inventoriesTable == "" {
		inventoriesTable = "Inventories"
	}
	cfg, err := config.LoadDefaultConfig(context.TODO())
	if err == nil {
		dynamoClient = dynamodb.NewFromConfig(cfg)
	}
}

type Inventory struct {
	StoreID        string `json:"store_id" dynamodbav:"store_id"`
	PrizeGrade     string `json:"prizeGrade" dynamodbav:"prize_grade"`
	PrizeName      string `json:"prizeName" dynamodbav:"prizeName"`
	TotalCount     int    `json:"totalCount" dynamodbav:"totalCount"`
	RemainingCount int    `json:"remainingCount" dynamodbav:"remainingCount"`
	Version        int    `json:"version" dynamodbav:"version"`
}

func extractStoreIDFromPath(path string) (string, bool) {
	parts := strings.Split(strings.Trim(path, "/"), "/")
	for i := 0; i+2 < len(parts); i++ {
		if parts[i] == "store" && parts[i+2] == "inventorie" && parts[i+1] != "" {
			return parts[i+1], true
		}
	}
	return "", false
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	storeId, ok := extractStoreIDFromPath(req.Path)
	if !ok {
		return events.APIGatewayProxyResponse{StatusCode: 400}, nil
	}

	av, _ := attributevalue.Marshal(storeId)
	out, err := dynamoClient.Query(ctx, &dynamodb.QueryInput{
		TableName:              aws.String(inventoriesTable),
		KeyConditionExpression: aws.String("store_id = :s"),
		ExpressionAttributeValues: map[string]types.AttributeValue{
			":s": av,
		},
	})
	if err != nil {
		log.Printf("Error fetching inventories: %v\n", err)
		return events.APIGatewayProxyResponse{
			StatusCode: 500,
			Body:       `{"code":"INTERNAL_ERROR","message":"Failed to fetch inventories"}`,
			Headers:    map[string]string{"Content-Type": "application/json", "Access-Control-Allow-Origin": "*"},
		}, nil
	}

	var items []Inventory
	attributevalue.UnmarshalListOfMaps(out.Items, &items)
	if items == nil {
		items = []Inventory{}
	}

	res := map[string]interface{}{
		"store_id": storeId,
		"items":    items,
	}

	respBody, _ := json.Marshal(res)
	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Headers: map[string]string{
			"Content-Type":                "application/json",
			"Access-Control-Allow-Origin": "*",
		},
		Body: string(respBody),
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
