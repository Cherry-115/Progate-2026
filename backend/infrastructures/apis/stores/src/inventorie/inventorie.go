package main

import (
	"context"
	"encoding/json"
	"os"

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
	StoreID        string `json:"storeId" dynamodbav:"store_id"`
	PrizeGrade     string `json:"prizeGrade" dynamodbav:"prizeGrade"`
	PrizeName      string `json:"prizeName" dynamodbav:"prizeName"`
	TotalCount     int    `json:"totalCount" dynamodbav:"totalCount"`
	RemainingCount int    `json:"remainingCount" dynamodbav:"remainingCount"`
	Version        int    `json:"version" dynamodbav:"version"`
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	storeId := req.PathParameters["storeId"]
	if storeId == "" {
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
		return events.APIGatewayProxyResponse{
			StatusCode: 500,
			Body: `{"code":"INTERNAL_ERROR","message":"Failed to fetch inventories"}`,
			Headers: map[string]string{"Content-Type": "application/json", "Access-Control-Allow-Origin": "*"},
		}, nil
	}

	var items []Inventory
	attributevalue.UnmarshalListOfMaps(out.Items, &items)
	if items == nil {
		items = []Inventory{}
	}

	res := map[string]interface{}{
		"storeId": storeId,
		"items":   items,
	}

	respBody, _ := json.Marshal(res)
	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Headers: map[string]string{
			"Content-Type": "application/json",
			"Access-Control-Allow-Origin": "*",
		},
		Body: string(respBody),
	}, nil
}

func main() {
	lambda.Start(handler)
}