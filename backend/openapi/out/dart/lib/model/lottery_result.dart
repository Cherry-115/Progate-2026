//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LotteryResult {
  /// Returns a new [LotteryResult] instance.
  LotteryResult({
    required this.resultId,
    required this.userId,
    required this.storeId,
    required this.prizeGrade,
    required this.status,
    required this.paymentId,
    required this.createdAt,
  });

  String resultId;

  String userId;

  String storeId;

  PrizeGrade prizeGrade;

  LotteryStatus status;

  String paymentId;

  DateTime createdAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LotteryResult &&
    other.resultId == resultId &&
    other.userId == userId &&
    other.storeId == storeId &&
    other.prizeGrade == prizeGrade &&
    other.status == status &&
    other.paymentId == paymentId &&
    other.createdAt == createdAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (resultId.hashCode) +
    (userId.hashCode) +
    (storeId.hashCode) +
    (prizeGrade.hashCode) +
    (status.hashCode) +
    (paymentId.hashCode) +
    (createdAt.hashCode);

  @override
  String toString() => 'LotteryResult[resultId=$resultId, userId=$userId, storeId=$storeId, prizeGrade=$prizeGrade, status=$status, paymentId=$paymentId, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'resultId'] = this.resultId;
      json[r'userId'] = this.userId;
      json[r'storeId'] = this.storeId;
      json[r'prizeGrade'] = this.prizeGrade;
      json[r'status'] = this.status;
      json[r'paymentId'] = this.paymentId;
      json[r'createdAt'] = this.createdAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [LotteryResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LotteryResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'resultId'), 'Required key "LotteryResult[resultId]" is missing from JSON.');
        assert(json[r'resultId'] != null, 'Required key "LotteryResult[resultId]" has a null value in JSON.');
        assert(json.containsKey(r'userId'), 'Required key "LotteryResult[userId]" is missing from JSON.');
        assert(json[r'userId'] != null, 'Required key "LotteryResult[userId]" has a null value in JSON.');
        assert(json.containsKey(r'storeId'), 'Required key "LotteryResult[storeId]" is missing from JSON.');
        assert(json[r'storeId'] != null, 'Required key "LotteryResult[storeId]" has a null value in JSON.');
        assert(json.containsKey(r'prizeGrade'), 'Required key "LotteryResult[prizeGrade]" is missing from JSON.');
        assert(json[r'prizeGrade'] != null, 'Required key "LotteryResult[prizeGrade]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "LotteryResult[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "LotteryResult[status]" has a null value in JSON.');
        assert(json.containsKey(r'paymentId'), 'Required key "LotteryResult[paymentId]" is missing from JSON.');
        assert(json[r'paymentId'] != null, 'Required key "LotteryResult[paymentId]" has a null value in JSON.');
        assert(json.containsKey(r'createdAt'), 'Required key "LotteryResult[createdAt]" is missing from JSON.');
        assert(json[r'createdAt'] != null, 'Required key "LotteryResult[createdAt]" has a null value in JSON.');
        return true;
      }());

      return LotteryResult(
        resultId: mapValueOfType<String>(json, r'resultId')!,
        userId: mapValueOfType<String>(json, r'userId')!,
        storeId: mapValueOfType<String>(json, r'storeId')!,
        prizeGrade: PrizeGrade.fromJson(json[r'prizeGrade'])!,
        status: LotteryStatus.fromJson(json[r'status'])!,
        paymentId: mapValueOfType<String>(json, r'paymentId')!,
        createdAt: mapDateTime(json, r'createdAt', r'')!,
      );
    }
    return null;
  }

  static List<LotteryResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LotteryResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LotteryResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LotteryResult> mapFromJson(dynamic json) {
    final map = <String, LotteryResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LotteryResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LotteryResult-objects as value to a dart map
  static Map<String, List<LotteryResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LotteryResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LotteryResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'resultId',
    'userId',
    'storeId',
    'prizeGrade',
    'status',
    'paymentId',
    'createdAt',
  };
}

