// main.go
package main

import (
	"github.com/aws/aws-lambda-go/lambda"
)

func helloMe() (string, error) {
	return "Hello λ me!", nil
}

func main() {
	// Make the handler available for Remote Procedure Call by AWS Lambda
	lambda.Start(helloMe)
}