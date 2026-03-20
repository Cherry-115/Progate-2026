package main

import (
	"context"
	"encoding/json"
	"log"
	"math"
	"os"
	"strconv"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/feature/dynamodb/attributevalue"
	"github.com/aws/aws-sdk-go-v2/service/dynamodb"
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
	StoreID        string  `json:"storeId" dynamodbav:"store_id"`
	StoreName      string  `json:"storeName" dynamodbav:"storeName"`
	Address        string  `json:"address" dynamodbav:"address"`
	Latitude       float64 `json:"latitude" dynamodbav:"latitude"`
	Longitude      float64 `json:"longitude" dynamodbav:"longitude"`
	Geohash        string  `json:"geohash" dynamodbav:"geohash"`
	IsActive       bool    `json:"isActive" dynamodbav:"isActive"`
	DistanceMeters float64 `json:"distanceMeters,omitempty"`
}

func haversine(lat1, lon1, lat2, lon2 float64) float64 {
	const R = 6371e3 // Earth radius in meters
	rad := math.Pi / 180
	dLat := (lat2 - lat1) * rad
	dLon := (lon2 - lon1) * rad
	a := math.Sin(dLat/2)*math.Sin(dLat/2) +
		math.Cos(lat1*rad)*math.Cos(lat2*rad)*
			math.Sin(dLon/2)*math.Sin(dLon/2)
	c := 2 * math.Atan2(math.Sqrt(a), math.Sqrt(1-a))
	return R * c
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	latStr := req.QueryStringParameters["lat"]
	lngStr := req.QueryStringParameters["lng"]
	radiusStr := req.QueryStringParameters["radius"]

	lat, err1 := strconv.ParseFloat(latStr, 64)
	lng, err2 := strconv.ParseFloat(lngStr, 64)
	radius, _ := strconv.ParseFloat(radiusStr, 64)
	if err1 != nil || err2 != nil {
		log.Printf("Error parsing lat/lng: err1=%v, err2=%v\n", err1, err2)
		return events.APIGatewayProxyResponse{StatusCode: 400, Body: `{"code":"BAD_REQUEST","message":"Invalid lat/lng"}`}, nil
	}
	if radius == 0 {
		radius = 1000
	}

	out, err := dynamoClient.Scan(ctx, &dynamodb.ScanInput{
		TableName: &storesTable,
	})
	if err != nil {
		log.Printf("Error scanning stores table: %v\n", err)
		return events.APIGatewayProxyResponse{StatusCode: 500, Body: `{"code":"INTERNAL_ERROR","message":"Failed to scan stores"}`}, nil
	}

	var allStores []Store
	attributevalue.UnmarshalListOfMaps(out.Items, &allStores)

	var filtered []Store
	if len(allStores) > 0 {
		for _, s := range allStores {
			dist := haversine(lat, lng, s.Latitude, s.Longitude)
			if dist <= radius {
				s.DistanceMeters = dist
				filtered = append(filtered, s)
			}
		}
	} else {
		filtered = []Store{}
	}

	respBody, _ := json.Marshal(map[string]interface{}{"items": filtered})
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