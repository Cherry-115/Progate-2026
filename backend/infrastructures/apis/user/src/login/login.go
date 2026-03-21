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
	"github.com/aws/aws-sdk-go-v2/service/cognitoidentityprovider"
	"github.com/aws/aws-sdk-go-v2/service/cognitoidentityprovider/types"
	"github.com/aws/aws-sdk-go-v2/service/dynamodb"
	"github.com/aws/aws-sdk-go-v2/feature/dynamodb/attributevalue"
	dynamodbTypes "github.com/aws/aws-sdk-go-v2/service/dynamodb/types"
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

type LoginRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type User struct {
	UserID      string `json:"userId" dynamodbav:"user_id"`
	DisplayName string `json:"displayName" dynamodbav:"displayName"`
	Email       string `json:"email" dynamodbav:"email"`
	CreatedAt   string `json:"createdAt" dynamodbav:"createdAt"`
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	var body LoginRequest
	if err := json.Unmarshal([]byte(req.Body), &body); err != nil {
		log.Printf("Error unmarshaling request body: %v\n", err)
		return events.APIGatewayProxyResponse{StatusCode: 400, Body: `{"code":"BAD_REQUEST","message":"Invalid body"}`}, nil
	}

	out, err := cognitoClient.InitiateAuth(ctx, &cognitoidentityprovider.InitiateAuthInput{
		AuthFlow: types.AuthFlowTypeUserPasswordAuth,
		ClientId: aws.String(clientId),
		AuthParameters: map[string]string{
			"USERNAME": body.Email,
			"PASSWORD": body.Password,
		},
	})
	if err != nil {
		log.Printf("Error authenticating user in Cognito: %v\n", err)
		return events.APIGatewayProxyResponse{
			StatusCode: 401,
			Body: `{"code":"UNAUTHORIZED","message":"Login failed"}`,
			Headers: map[string]string{"Content-Type": "application/json", "Access-Control-Allow-Origin": "*"},
		}, nil
	}

	accessToken := *out.AuthenticationResult.AccessToken

	usrout, _ := cognitoClient.GetUser(ctx, &cognitoidentityprovider.GetUserInput{
		AccessToken: aws.String(accessToken),
	})
	var userId string
	if usrout != nil {
		for _, attr := range usrout.UserAttributes {
			if *attr.Name == "sub" {
				userId = *attr.Value
				break
			}
		}
	}

	var user User
	if userId != "" {
		av, _ := attributevalue.Marshal(userId)
		dbOut, _ := dynamoClient.GetItem(ctx, &dynamodb.GetItemInput{
			TableName: aws.String(usersTable),
			Key: map[string]dynamodbTypes.AttributeValue{"user_id": av},
		})
		if dbOut != nil && dbOut.Item != nil {
			attributevalue.UnmarshalMap(dbOut.Item, &user)
		}
	}

	respBody := map[string]interface{}{
		"accessToken": accessToken,
		"tokenType":   "Bearer",
		"expiresIn":   out.AuthenticationResult.ExpiresIn,
		"user":        user,
	}
	b, _ := json.Marshal(respBody)

	return events.APIGatewayProxyResponse{
		StatusCode: 200,
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