# openapi.api.LotteryApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.example.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**drawLottery**](LotteryApi.md#drawlottery) | **POST** /lottery/draw | くじを引く
[**getLotteryResultById**](LotteryApi.md#getlotteryresultbyid) | **GET** /lottery/results/{resultId} | 当選結果詳細
[**listLotteryResults**](LotteryApi.md#listlotteryresults) | **GET** /lottery/results | 自分の当選履歴


# **drawLottery**
> LotteryDrawResponse drawLottery(lotteryDrawRequest)

くじを引く

抽選実行API。 1) idempotencyKey重複確認 2) GPS範囲検証（100m以内） 3) Mock Location検知 4) 決済状態確認 5) 在庫条件付き更新（remainingCount > 0 AND version一致） 

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = LotteryApi();
final lotteryDrawRequest = LotteryDrawRequest(); // LotteryDrawRequest | 

try {
    final result = api_instance.drawLottery(lotteryDrawRequest);
    print(result);
} catch (e) {
    print('Exception when calling LotteryApi->drawLottery: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lotteryDrawRequest** | [**LotteryDrawRequest**](LotteryDrawRequest.md)|  | 

### Return type

[**LotteryDrawResponse**](LotteryDrawResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLotteryResultById**
> LotteryResultDetail getLotteryResultById(resultId)

当選結果詳細

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = LotteryApi();
final resultId = result-xyz789; // String | 

try {
    final result = api_instance.getLotteryResultById(resultId);
    print(result);
} catch (e) {
    print('Exception when calling LotteryApi->getLotteryResultById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resultId** | **String**|  | 

### Return type

[**LotteryResultDetail**](LotteryResultDetail.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listLotteryResults**
> ListLotteryResults200Response listLotteryResults(limit, nextToken)

自分の当選履歴

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = LotteryApi();
final limit = 56; // int | 
final nextToken = nextToken_example; // String | 

try {
    final result = api_instance.listLotteryResults(limit, nextToken);
    print(result);
} catch (e) {
    print('Exception when calling LotteryApi->listLotteryResults: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**|  | [optional] [default to 20]
 **nextToken** | **String**|  | [optional] 

### Return type

[**ListLotteryResults200Response**](ListLotteryResults200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

