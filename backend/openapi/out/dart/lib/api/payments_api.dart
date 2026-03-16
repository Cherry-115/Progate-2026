//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PaymentsApi {
  PaymentsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// 決済開始（モック）
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreatePaymentRequest] createPaymentRequest (required):
  Future<Response> createPaymentWithHttpInfo(CreatePaymentRequest createPaymentRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/payments/create';

    // ignore: prefer_final_locals
    Object? postBody = createPaymentRequest;

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

  /// 決済開始（モック）
  ///
  /// Parameters:
  ///
  /// * [CreatePaymentRequest] createPaymentRequest (required):
  Future<Payment?> createPayment(CreatePaymentRequest createPaymentRequest,) async {
    final response = await createPaymentWithHttpInfo(createPaymentRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Payment',) as Payment;
    
    }
    return null;
  }

  /// 決済状態確認（モック）
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] paymentId (required):
  Future<Response> getPaymentByIdWithHttpInfo(String paymentId,) async {
    // ignore: prefer_const_declarations
    final path = r'/payments/{paymentId}'
      .replaceAll('{paymentId}', paymentId);

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

  /// 決済状態確認（モック）
  ///
  /// Parameters:
  ///
  /// * [String] paymentId (required):
  Future<Payment?> getPaymentById(String paymentId,) async {
    final response = await getPaymentByIdWithHttpInfo(paymentId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Payment',) as Payment;
    
    }
    return null;
  }
}
