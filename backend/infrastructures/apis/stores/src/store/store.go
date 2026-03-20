package main

import (
	"context"
	"encoding/json"
	"log"
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
	dynamoClient *dynamodb.Client
	storesTable  = os.Getenv("STORES_TABLE_NAME")
)

func init() {
	if storesTable == "" {
		storesTable = "Stores"
	}
	cfg, err := config.LoadDefaultConfig(context.TODO())
	if err == nil {
		dynamoClient = dynamodb.NewFromConfig(cfg)
	}
}

type Store struct {
	StoreID   string  `json:"storeId" dynamodbav:"store_id"`
	StoreName string  `json:"storeName" dynamodbav:"storeName"`
	Address   string  `json:"address" dynamodbav:"address"`
	Latitude  float64 `json:"latitude" dynamodbav:"latitude"`
	Longitude float64 `json:"longitude" dynamodbav:"longitude"`
	Geohash   string  `json:"geohash" dynamodbav:"geohash"`
	IsActive  bool    `json:"isActive" dynamodbav:"isActive"`
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	storeId := req.PathParameters["storeId"]
	if storeId == "" {
		return events.APIGatewayProxyResponse{StatusCode: 400}, nil
	}

	av, _ := attributevalue.Marshal(storeId)
	out, err := dynamoClient.GetItem(ctx, &dynamodb.GetItemInput{
		TableName: aws.String(storesTable),
		Key: map[string]types.AttributeValue{"store_id": av},
	})
	if err != nil || out.Item == nil {
		if err != nil {
			log.Printf("Error getting store: %v\n", err)
		}
		return events.APIGatewayProxyResponse{
			StatusCode: 404,
			Body: `{"code":"NOT_FOUND","message":"Store not found"}`,
			Headers: map[string]string{"Content-Type": "application/json", "Access-Control-Allow-Origin": "*"},
		}, nil
	}

	var store Store
	attributevalue.UnmarshalMap(out.Item, &store)

	respBody, _ := json.Marshal(store)
	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Headers: map[string]string{
			"Content-Type": "application/json",
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