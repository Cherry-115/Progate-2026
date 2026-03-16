//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StoresApi {
  StoresApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// 店舗詳細
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] storeId (required):
  Future<Response> getStoreByIdWithHttpInfo(String storeId,) async {
    // ignore: prefer_const_declarations
    final path = r'/stores/{storeId}'
      .replaceAll('{storeId}', storeId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 店舗詳細
  ///
  /// Parameters:
  ///
  /// * [String] storeId (required):
  Future<Store?> getStoreById(String storeId,) async {
    final response = await getStoreByIdWithHttpInfo(storeId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Store',) as Store;
    
    }
    return null;
  }

  /// 店舗の景品在庫一覧
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] storeId (required):
  Future<Response> listStoreInventoriesWithHttpInfo(String storeId,) async {
    // ignore: prefer_const_declarations
    final path = r'/stores/{storeId}/inventories'
      .replaceAll('{storeId}', storeId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 店舗の景品在庫一覧
  ///
  /// Parameters:
  ///
  /// * [String] storeId (required):
  Future<ListStoreInventories200Response?> listStoreInventories(String storeId,) async {
    final response = await listStoreInventoriesWithHttpInfo(storeId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListStoreInventories200Response',) as ListStoreInventories200Response;
    
    }
    return null;
  }

  /// 実施店舗一覧
  ///
  /// lat/lng/radius(m)を指定して近隣店舗を取得
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [double] lat (required):
  ///
  /// * [double] lng (required):
  ///
  /// * [int] radius (required):
  ///   検索半径（メートル）
  Future<Response> listStoresWithHttpInfo(double lat, double lng, int radius,) async {
    // ignore: prefer_const_declarations
    final path = r'/stores';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'lat', lat));
      queryParams.addAll(_queryParams('', 'lng', lng));
      queryParams.addAll(_queryParams('', 'radius', radius));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// 実施店舗一覧
  ///
  /// lat/lng/radius(m)を指定して近隣店舗を取得
  ///
  /// Parameters:
  ///
  /// * [double] lat (required):
  ///
  /// * [double] lng (required):
  ///
  /// * [int] radius (required):
  ///   検索半径（メートル）
  Future<ListStores200Response?> listStores(double lat, double lng, int radius,) async {
    final response = await listStoresWithHttpInfo(lat, lng, radius,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListStores200Response',) as ListStores200Response;
    
    }
    return null;
  }
}
