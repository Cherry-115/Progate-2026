//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LotteryResultDetail {
  /// Returns a new [LotteryResultDetail] instance.
  LotteryResultDetail({
    required this.resultId,
    required this.userId,
    required this.storeId,
    required this.prizeGrade,
    required this.status,
    required this.paymentId,
    required this.createdAt,
    this.prizeName,
    this.idempotencyKey,
    this.store,
  });

  String resultId;

  String userId;

  String storeId;

  PrizeGrade prizeGrade;

  LotteryStatus status;

  String paymentId;

  DateTime createdAt;

  String? prizeName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? idempotencyKey;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Store? store;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LotteryResultDetail &&
    other.resultId == resultId &&
    other.userId == userId &&
    other.storeId == storeId &&
    other.prizeGrade == prizeGrade &&
    other.status == status &&
    other.paymentId == paymentId &&
    other.createdAt == createdAt &&
    other.prizeName == prizeName &&
    other.idempotencyKey == idempotencyKey &&
    other.store == store;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (resultId.hashCode) +
    (userId.hashCode) +
    (storeId.hashCode) +
    (prizeGrade.hashCode) +
    (status.hashCode) +
    (paymentId.hashCode) +
    (createdAt.hashCode) +
    (prizeName == null ? 0 : prizeName!.hashCode) +
    (idempotencyKey == null ? 0 : idempotencyKey!.hashCode) +
    (store == null ? 0 : store!.hashCode);

  @override
  String toString() => 'LotteryResultDetail[resultId=$resultId, userId=$userId, storeId=$storeId, prizeGrade=$prizeGrade, status=$status, paymentId=$paymentId, createdAt=$createdAt, prizeName=$prizeName, idempotencyKey=$idempotencyKey, store=$store]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'resultId'] = this.resultId;
      json[r'userId'] = this.userId;
      json[r'storeId'] = this.storeId;
      json[r'prizeGrade'] = this.prizeGrade;
      json[r'status'] = this.status;
      json[r'paymentId'] = this.paymentId;
      json[r'createdAt'] = this.createdAt.toUtc().toIso8601String();
    if (this.prizeName != null) {
      json[r'prizeName'] = this.prizeName;
    } else {
      json[r'prizeName'] = null;
    }
    if (this.idempotencyKey != null) {
      json[r'idempotencyKey'] = this.idempotencyKey;
    } else {
      json[r'idempotencyKey'] = null;
    }
    if (this.store != null) {
      json[r'store'] = this.store;
    } else {
      json[r'store'] = null;
    }
    return json;
  }

  /// Returns a new [LotteryResultDetail] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LotteryResultDetail? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'resultId'), 'Required key "LotteryResultDetail[resultId]" is missing from JSON.');
        assert(json[r'resultId'] != null, 'Required key "LotteryResultDetail[resultId]" has a null value in JSON.');
        assert(json.containsKey(r'userId'), 'Required key "LotteryResultDetail[userId]" is missing from JSON.');
        assert(json[r'userId'] != null, 'Required key "LotteryResultDetail[userId]" has a null value in JSON.');
        assert(json.containsKey(r'storeId'), 'Required key "LotteryResultDetail[storeId]" is missing from JSON.');
        assert(json[r'storeId'] != null, 'Required key "LotteryResultDetail[storeId]" has a null value in JSON.');
        assert(json.containsKey(r'prizeGrade'), 'Required key "LotteryResultDetail[prizeGrade]" is missing from JSON.');
        assert(json[r'prizeGrade'] != null, 'Required key "LotteryResultDetail[prizeGrade]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "LotteryResultDetail[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "LotteryResultDetail[status]" has a null value in JSON.');
        assert(json.containsKey(r'paymentId'), 'Required key "LotteryResultDetail[paymentId]" is missing from JSON.');
        assert(json[r'paymentId'] != null, 'Required key "LotteryResultDetail[paymentId]" has a null value in JSON.');
        assert(json.containsKey(r'createdAt'), 'Required key "LotteryResultDetail[createdAt]" is missing from JSON.');
        assert(json[r'createdAt'] != null, 'Required key "LotteryResultDetail[createdAt]" has a null value in JSON.');
        return true;
      }());

      return LotteryResultDetail(
        resultId: mapValueOfType<String>(json, r'resultId')!,
        userId: mapValueOfType<String>(json, r'userId')!,
        storeId: mapValueOfType<String>(json, r'storeId')!,
        prizeGrade: PrizeGrade.fromJson(json[r'prizeGrade'])!,
        status: LotteryStatus.fromJson(json[r'status'])!,
        paymentId: mapValueOfType<String>(json, r'paymentId')!,
        createdAt: mapDateTime(json, r'createdAt', r'')!,
        prizeName: mapValueOfType<String>(json, r'prizeName'),
        idempotencyKey: mapValueOfType<String>(json, r'idempotencyKey'),
        store: Store.fromJson(json[r'store']),
      );
    }
    return null;
  }

  static List<LotteryResultDetail> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LotteryResultDetail>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LotteryResultDetail.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LotteryResultDetail> mapFromJson(dynamic json) {
    final map = <String, LotteryResultDetail>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LotteryResultDetail.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LotteryResultDetail-objects as value to a dart map
  static Map<String, List<LotteryResultDetail>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LotteryResultDetail>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LotteryResultDetail.listFromJson(entry.value, growable: growable,);
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

