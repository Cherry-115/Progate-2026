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
	dynamoClient *dynamodb.Client
	usersTable   = os.Getenv("USERS_TABLE_NAME")
)

func init() {
	if usersTable == "" {
		usersTable = "Users"
	}
	cfg, err := config.LoadDefaultConfig(context.TODO())
	if err == nil {
		dynamoClient = dynamodb.NewFromConfig(cfg)
	}
}

type User struct {
	UserID      string `json:"userId" dynamodbav:"user_id"`
	DisplayName string `json:"displayName" dynamodbav:"displayName"`
	Email       string `json:"email" dynamodbav:"email"`
	CreatedAt   string `json:"createdAt" dynamodbav:"createdAt"`
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	var userId string
	if req.RequestContext.Authorizer != nil {
		if claims, ok := req.RequestContext.Authorizer["claims"].(map[string]interface{}); ok {
			if sub, ok := claims["sub"].(string); ok {
				userId = sub
			}
		}
	}
	if userId == "" {
		return events.APIGatewayProxyResponse{
			StatusCode: 401,
			Body: `{"code":"UNAUTHORIZED","message":"Missing or invalid token."}`,
			Headers: map[string]string{"Content-Type": "application/json", "Access-Control-Allow-Origin": "*"},
		}, nil
	}

	av, _ := attributevalue.Marshal(userId)
	out, err := dynamoClient.GetItem(ctx, &dynamodb.GetItemInput{
		TableName: aws.String(usersTable),
		Key: map[string]types.AttributeValue{"user_id": av},
	})
	if err != nil || out.Item == nil {
		return events.APIGatewayProxyResponse{
			StatusCode: 404,
			Body: `{"code":"NOT_FOUND","message":"User not found"}`,
			Headers: map[string]string{"Content-Type": "application/json", "Access-Control-Allow-Origin": "*"},
		}, nil
	}

	var user User
	attributevalue.UnmarshalMap(out.Item, &user)

	respBody, _ := json.Marshal(user)
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