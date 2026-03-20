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
	dynamoClient      *dynamodb.Client
	lotteryResultsTbl = os.Getenv("LOTTERYRESULTS_TABLE_NAME")
)

func init() {
	if lotteryResultsTbl == "" {
		lotteryResultsTbl = "LotteryResults"
	}
	cfg, err := config.LoadDefaultConfig(context.TODO())
	if err == nil {
		dynamoClient = dynamodb.NewFromConfig(cfg)
	}
}

type LotteryResultDetail struct {
	ResultID       string `json:"resultId" dynamodbav:"result_id"`
	UserID         string `json:"userId" dynamodbav:"userId"`
	StoreID        string `json:"storeId" dynamodbav:"storeId"`
	PrizeGrade     string `json:"prizeGrade" dynamodbav:"prizeGrade"`
	Status         string `json:"status" dynamodbav:"status"`
	PaymentID      string `json:"paymentId" dynamodbav:"paymentId"`
	CreatedAt      string `json:"createdAt" dynamodbav:"createdAt"`
	PrizeName      string `json:"prizeName" dynamodbav:"prizeName"`
	IdempotencyKey string `json:"idempotencyKey" dynamodbav:"idempotencyKey"`
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	resultId := req.PathParameters["resultId"]
	if resultId == "" {
		return events.APIGatewayProxyResponse{StatusCode: 400}, nil
	}

	av, _ := attributevalue.Marshal(resultId)
	out, err := dynamoClient.GetItem(ctx, &dynamodb.GetItemInput{
		TableName: aws.String(lotteryResultsTbl),
		Key:       map[string]types.AttributeValue{"result_id": av},
	})

	if err != nil || out.Item == nil {
		if err != nil {
			log.Printf("Error getting lottery result: %v\n", err)
		}
		return events.APIGatewayProxyResponse{
			StatusCode: 404,
			Body:       `{"code":"NOT_FOUND","message":"Result not found"}`,
			Headers:    map[string]string{"Content-Type": "application/json", "Access-Control-Allow-Origin": "*"},
		}, nil
	}

	var detail LotteryResultDetail
	attributevalue.UnmarshalMap(out.Item, &detail)

	respBody, _ := json.Marshal(detail)
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