package main

import (
	"context"
	"encoding/json"
	"time"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/google/uuid"
)

type CreatePaymentRequest struct {
	Amount   int    `json:"amount"`
	Currency string `json:"currency"`
}

type Payment struct {
	PaymentID string `json:"paymentId"`
	Status    string `json:"status"`
	Amount    int    `json:"amount"`
	Currency  string `json:"currency"`
	CreatedAt string `json:"createdAt"`
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	var body CreatePaymentRequest
	if err := json.Unmarshal([]byte(req.Body), &body); err != nil {
		return events.APIGatewayProxyResponse{
			StatusCode: 400,
			Body:       `{"code":"BAD_REQUEST","message":"Invalid request"}`,
		}, nil
	}

	paymentId := "pay-" + uuid.New().String()

	payment := Payment{
		PaymentID: paymentId,
		Status:    "PENDING",
		Amount:    body.Amount,
		Currency:  body.Currency,
		CreatedAt: time.Now().UTC().Format(time.RFC3339),
	}

	respBody, _ := json.Marshal(payment)

	return events.APIGatewayProxyResponse{
		StatusCode: 201,
		Headers: map[string]string{
			"Content-Type": "application/json",
			"Access-Control-Allow-Origin": "*",
		},
		Body:       string(respBody),
	}, nil
}

func main() {
	lambda.Start(handler)
}