// main.go
package main

import (
	"github.com/aws/aws-lambda-go/lambda"
)

func helloLogin() (string, error) {
	return "Hello λ login!", nil
}

func main() {
	// Make the handler available for Remote Procedure Call by AWS Lambda
	lambda.Start(helloLogin)
}