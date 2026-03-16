//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class LotteryApi {
  LotteryApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// くじを引く
  ///
  /// 抽選実行API。 1) idempotencyKey重複確認 2) GPS範囲検証（100m以内） 3) Mock Location検知 4) 決済状態確認 5) 在庫条件付き更新（remainingCount > 0 AND version一致） 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [LotteryDrawRequest] lotteryDrawRequest (required):
  Future<Response> drawLotteryWithHttpInfo(LotteryDrawRequest lotteryDrawRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/lottery/draw';

    // ignore: prefer_final_locals
    Object? postBody = lotteryDrawRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// くじを引く
  ///
  /// 抽選実行API。 1) idempotencyKey重複確認 2) GPS範囲検証（100m以内） 3) Mock Location検知 4) 決済状態確認 5) 在庫条件付き更新（remainingCount > 0 AND version一致） 
  ///
  /// Parameters:
  ///
  /// * [LotteryDrawRequest] lotteryDrawRequest (required):
  Future<LotteryDrawResponse?> drawLottery(LotteryDrawRequest lotteryDrawRequest,) async {
    final response = await drawLotteryWithHttpInfo(lotteryDrawRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LotteryDrawResponse',) as LotteryDrawResponse;
    
    }
    return null;
  }

  /// 当選結果詳細
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] resultId (required):
  Future<Response> getLotteryResultByIdWithHttpInfo(String resultId,) async {
    // ignore: prefer_const_declarations
    final path = r'/lottery/results/{resultId}'
      .replaceAll('{resultId}', resultId);

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

  /// 当選結果詳細
  ///
  /// Parameters:
  ///
  /// * [String] resultId (required):
  Future<LotteryResultDetail?> getLotteryResultById(String resultId,) async {
    final response = await getLotteryResultByIdWithHttpInfo(resultId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LotteryResultDetail',) as LotteryResultDetail;
    
    }
    return null;
  }

  /// 自分の当選履歴
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] limit:
  ///
  /// * [String] nextToken:
  Future<Response> listLotteryResultsWithHttpInfo({ int? limit, String? nextToken, }) async {
    // ignore: prefer_const_declarations
    final path = r'/lottery/results';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (nextToken != null) {
      queryParams.addAll(_queryParams('', 'nextToken', nextToken));
    }

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

  /// 自分の当選履歴
  ///
  /// Parameters:
  ///
  /// * [int] limit:
  ///
  /// * [String] nextToken:
  Future<ListLotteryResults200Response?> listLotteryResults({ int? limit, String? nextToken, }) async {
    final response = await listLotteryResultsWithHttpInfo( limit: limit, nextToken: nextToken, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListLotteryResults200Response',) as ListLotteryResults200Response;
    
    }
    return null;
  }
}
