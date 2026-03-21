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

type LotteryResult struct {
	ResultID   string `json:"resultId" dynamodbav:"result_id"`
	UserID     string `json:"userId" dynamodbav:"userId"`
	StoreID    string `json:"storeId" dynamodbav:"storeId"`
	PrizeGrade string `json:"prizeGrade" dynamodbav:"prizeGrade"`
	Status     string `json:"status" dynamodbav:"status"`
	PaymentID  string `json:"paymentId" dynamodbav:"paymentId"`
	CreatedAt  string `json:"createdAt" dynamodbav:"createdAt"`
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	userId := ""
	if req.RequestContext.Authorizer != nil {
		if claims, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{}); ok {
			if sub, ok := claims["sub"].(string); ok {
				userId = sub
			}
		}
	}
	if userId == "" {
		userId = "UNKNOWN_USER"
	}

	out, err := dynamoClient.Scan(ctx, &dynamodb.ScanInput{
		TableName:        aws.String(lotteryResultsTbl),
		FilterExpression: aws.String("userId = :u"),
		ExpressionAttributeValues: map[string]types.AttributeValue{
			":u": &types.AttributeValueMemberS{Value: userId},
		},
	})
	if err != nil {
		log.Printf("Error scanning lottery results: %v\n", err)
		return events.APIGatewayProxyResponse{
			StatusCode: 500,
			Body:       `{"code":"INTERNAL_ERROR","message":"Failed to scan results"}`,
		}, nil
	}

	var items []LotteryResult
	attributevalue.UnmarshalListOfMaps(out.Items, &items)
	if items == nil {
		items = []LotteryResult{}
	}

	respBody, _ := json.Marshal(map[string]interface{}{
		"items": items,
	})

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