package main

import (
	"context"
	"encoding/json"
	"log"
	"time"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

type Payment struct {
	PaymentID string `json:"paymentId"`
	Status    string `json:"status"`
	Amount    int    `json:"amount"`
	Currency  string `json:"currency"`
	CreatedAt string `json:"createdAt"`
	PaidAt    string `json:"paidAt,omitempty"`
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	paymentId := req.PathParameters["paymentId"]
	if paymentId == "" {
		return events.APIGatewayProxyResponse{
			StatusCode: 400,
			Body:       `{"code":"BAD_REQUEST","message":"Missing paymentId"}`,
		}, nil
	}

	// モックAPIなので、常に成功(PAID)として扱うか、paymentIdをベースに返す
	payment := Payment{
		PaymentID: paymentId,
		Status:    "PAID",
		Amount:    700,
		Currency:  "JPY",
		CreatedAt: time.Now().UTC().Add(-1 * time.Minute).Format(time.RFC3339),
		PaidAt:    time.Now().UTC().Format(time.RFC3339),
	}

	respBody, _ := json.Marshal(payment)

	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Headers: map[string]string{
			"Content-Type": "application/json",
			"Access-Control-Allow-Origin": "*",
		},
		Body:       string(respBody),
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