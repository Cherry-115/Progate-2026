# openapi.api.StoresApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.example.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getStoreById**](StoresApi.md#getstorebyid) | **GET** /stores/{storeId} | 店舗詳細
[**listStoreInventories**](StoresApi.md#liststoreinventories) | **GET** /stores/{storeId}/inventories | 店舗の景品在庫一覧
[**listStores**](StoresApi.md#liststores) | **GET** /stores | 実施店舗一覧


# **getStoreById**
> Store getStoreById(storeId)

店舗詳細

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = StoresApi();
final storeId = store-001; // String | 

try {
    final result = api_instance.getStoreById(storeId);
    print(result);
} catch (e) {
    print('Exception when calling StoresApi->getStoreById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storeId** | **String**|  | 

### Return type

[**Store**](Store.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStoreInventories**
> ListStoreInventories200Response listStoreInventories(storeId)

店舗の景品在庫一覧

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = StoresApi();
final storeId = store-001; // String | 

try {
    final result = api_instance.listStoreInventories(storeId);
    print(result);
} catch (e) {
    print('Exception when calling StoresApi->listStoreInventories: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storeId** | **String**|  | 

### Return type

[**ListStoreInventories200Response**](ListStoreInventories200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStores**
> ListStores200Response listStores(lat, lng, radius)

実施店舗一覧

lat/lng/radius(m)を指定して近隣店舗を取得

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = StoresApi();
final lat = 1.2; // double | 
final lng = 1.2; // double | 
final radius = 56; // int | 検索半径（メートル）

try {
    final result = api_instance.listStores(lat, lng, radius);
    print(result);
} catch (e) {
    print('Exception when calling StoresApi->listStores: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lat** | **double**|  | 
 **lng** | **double**|  | 
 **radius** | **int**| 検索半径（メートル） | [default to 1000]

### Return type

[**ListStores200Response**](ListStores200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

