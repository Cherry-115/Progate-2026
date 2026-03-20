package main

import (
	"context"
	"encoding/json"
	"os"
	"time"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/cognitoidentityprovider"
	"github.com/aws/aws-sdk-go-v2/service/cognitoidentityprovider/types"
	"github.com/aws/aws-sdk-go-v2/service/dynamodb"
	"github.com/aws/aws-sdk-go-v2/feature/dynamodb/attributevalue"
)

var (
	cognitoClient *cognitoidentityprovider.Client
	dynamoClient  *dynamodb.Client
	clientId      = os.Getenv("COGNITO_CLIENT_ID")
	usersTable    = os.Getenv("USERS_TABLE_NAME")
)

func init() {
	if usersTable == "" {
		usersTable = "Users"
	}
	cfg, err := config.LoadDefaultConfig(context.TODO())
	if err == nil {
		cognitoClient = cognitoidentityprovider.NewFromConfig(cfg)
		dynamoClient = dynamodb.NewFromConfig(cfg)
	}
}

type SignUpRequest struct {
	DisplayName string `json:"displayName"`
	Email       string `json:"email"`
	Password    string `json:"password"`
}

type User struct {
	UserID      string `json:"userId" dynamodbav:"user_id"`
	DisplayName string `json:"displayName" dynamodbav:"displayName"`
	Email       string `json:"email" dynamodbav:"email"`
	CreatedAt   string `json:"createdAt" dynamodbav:"createdAt"`
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	var body SignUpRequest
	if err := json.Unmarshal([]byte(req.Body), &body); err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 400, Body: `{"code":"BAD_REQUEST","message":"Invalid body"}`}, nil
	}

	// Create user in Cognito
	out, err := cognitoClient.SignUp(ctx, &cognitoidentityprovider.SignUpInput{
		ClientId: aws.String(clientId),
		Username: aws.String(body.Email),
		Password: aws.String(body.Password),
		UserAttributes: []types.AttributeType{
			{Name: aws.String("email"), Value: aws.String(body.Email)},
		},
	})
	if err != nil {
		return events.APIGatewayProxyResponse{StatusCode: 400, Body: `{"code":"BAD_REQUEST","message":"SignUp failed"}`}, nil
	}

	userId := *out.UserSub

	user := User{
		UserID:      userId,
		DisplayName: body.DisplayName,
		Email:       body.Email,
		CreatedAt:   time.Now().UTC().Format(time.RFC3339),
	}
	av, _ := attributevalue.MarshalMap(user)
	dynamoClient.PutItem(ctx, &dynamodb.PutItemInput{
		TableName: aws.String(usersTable),
		Item:      av,
	})

	respBody := map[string]interface{}{
		"accessToken": "mock-token-after-signup",
		"tokenType":   "Bearer",
		"expiresIn":   3600,
		"user":        user,
	}
	b, _ := json.Marshal(respBody)

	return events.APIGatewayProxyResponse{
		StatusCode: 201,
		Headers: map[string]string{
			"Content-Type": "application/json",
			"Access-Control-Allow-Origin": "*",
		},
		Body: string(b),
	}, nil
}

func main() {
	lambda.Start(handler)
}