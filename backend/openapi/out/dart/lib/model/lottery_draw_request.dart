//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LotteryDrawRequest {
  /// Returns a new [LotteryDrawRequest] instance.
  LotteryDrawRequest({
    required this.storeId,
    required this.latitude,
    required this.longitude,
    required this.paymentId,
    required this.idempotencyKey,
  });

  String storeId;

  /// Minimum value: -90
  /// Maximum value: 90
  double latitude;

  /// Minimum value: -180
  /// Maximum value: 180
  double longitude;

  String paymentId;

  /// 同一抽選要求の重複防止キー
  String idempotencyKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LotteryDrawRequest &&
    other.storeId == storeId &&
    other.latitude == latitude &&
    other.longitude == longitude &&
    other.paymentId == paymentId &&
    other.idempotencyKey == idempotencyKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (storeId.hashCode) +
    (latitude.hashCode) +
    (longitude.hashCode) +
    (paymentId.hashCode) +
    (idempotencyKey.hashCode);

  @override
  String toString() => 'LotteryDrawRequest[storeId=$storeId, latitude=$latitude, longitude=$longitude, paymentId=$paymentId, idempotencyKey=$idempotencyKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'storeId'] = this.storeId;
      json[r'latitude'] = this.latitude;
      json[r'longitude'] = this.longitude;
      json[r'paymentId'] = this.paymentId;
      json[r'idempotencyKey'] = this.idempotencyKey;
    return json;
  }

  /// Returns a new [LotteryDrawRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LotteryDrawRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'storeId'), 'Required key "LotteryDrawRequest[storeId]" is missing from JSON.');
        assert(json[r'storeId'] != null, 'Required key "LotteryDrawRequest[storeId]" has a null value in JSON.');
        assert(json.containsKey(r'latitude'), 'Required key "LotteryDrawRequest[latitude]" is missing from JSON.');
        assert(json[r'latitude'] != null, 'Required key "LotteryDrawRequest[latitude]" has a null value in JSON.');
        assert(json.containsKey(r'longitude'), 'Required key "LotteryDrawRequest[longitude]" is missing from JSON.');
        assert(json[r'longitude'] != null, 'Required key "LotteryDrawRequest[longitude]" has a null value in JSON.');
        assert(json.containsKey(r'paymentId'), 'Required key "LotteryDrawRequest[paymentId]" is missing from JSON.');
        assert(json[r'paymentId'] != null, 'Required key "LotteryDrawRequest[paymentId]" has a null value in JSON.');
        assert(json.containsKey(r'idempotencyKey'), 'Required key "LotteryDrawRequest[idempotencyKey]" is missing from JSON.');
        assert(json[r'idempotencyKey'] != null, 'Required key "LotteryDrawRequest[idempotencyKey]" has a null value in JSON.');
        return true;
      }());

      return LotteryDrawRequest(
        storeId: mapValueOfType<String>(json, r'storeId')!,
        latitude: mapValueOfType<double>(json, r'latitude')!,
        longitude: mapValueOfType<double>(json, r'longitude')!,
        paymentId: mapValueOfType<String>(json, r'paymentId')!,
        idempotencyKey: mapValueOfType<String>(json, r'idempotencyKey')!,
      );
    }
    return null;
  }

  static List<LotteryDrawRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LotteryDrawRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LotteryDrawRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LotteryDrawRequest> mapFromJson(dynamic json) {
    final map = <String, LotteryDrawRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LotteryDrawRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LotteryDrawRequest-objects as value to a dart map
  static Map<String, List<LotteryDrawRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LotteryDrawRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LotteryDrawRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'storeId',
    'latitude',
    'longitude',
    'paymentId',
    'idempotencyKey',
  };
}

