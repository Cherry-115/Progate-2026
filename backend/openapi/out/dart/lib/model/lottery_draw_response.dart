//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LotteryDrawResponse {
  /// Returns a new [LotteryDrawResponse] instance.
  LotteryDrawResponse({
    required this.resultId,
    required this.status,
    required this.prizeGrade,
    required this.prizeName,
    required this.message,
    required this.createdAt,
  });

  String resultId;

  LotteryStatus status;

  PrizeGrade prizeGrade;

  String? prizeName;

  String message;

  DateTime createdAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LotteryDrawResponse &&
    other.resultId == resultId &&
    other.status == status &&
    other.prizeGrade == prizeGrade &&
    other.prizeName == prizeName &&
    other.message == message &&
    other.createdAt == createdAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (resultId.hashCode) +
    (status.hashCode) +
    (prizeGrade.hashCode) +
    (prizeName == null ? 0 : prizeName!.hashCode) +
    (message.hashCode) +
    (createdAt.hashCode);

  @override
  String toString() => 'LotteryDrawResponse[resultId=$resultId, status=$status, prizeGrade=$prizeGrade, prizeName=$prizeName, message=$message, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'resultId'] = this.resultId;
      json[r'status'] = this.status;
      json[r'prizeGrade'] = this.prizeGrade;
    if (this.prizeName != null) {
      json[r'prizeName'] = this.prizeName;
    } else {
      json[r'prizeName'] = null;
    }
      json[r'message'] = this.message;
      json[r'createdAt'] = this.createdAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [LotteryDrawResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LotteryDrawResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'resultId'), 'Required key "LotteryDrawResponse[resultId]" is missing from JSON.');
        assert(json[r'resultId'] != null, 'Required key "LotteryDrawResponse[resultId]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "LotteryDrawResponse[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "LotteryDrawResponse[status]" has a null value in JSON.');
        assert(json.containsKey(r'prizeGrade'), 'Required key "LotteryDrawResponse[prizeGrade]" is missing from JSON.');
        assert(json[r'prizeGrade'] != null, 'Required key "LotteryDrawResponse[prizeGrade]" has a null value in JSON.');
        assert(json.containsKey(r'prizeName'), 'Required key "LotteryDrawResponse[prizeName]" is missing from JSON.');
        assert(json.containsKey(r'message'), 'Required key "LotteryDrawResponse[message]" is missing from JSON.');
        assert(json[r'message'] != null, 'Required key "LotteryDrawResponse[message]" has a null value in JSON.');
        assert(json.containsKey(r'createdAt'), 'Required key "LotteryDrawResponse[createdAt]" is missing from JSON.');
        assert(json[r'createdAt'] != null, 'Required key "LotteryDrawResponse[createdAt]" has a null value in JSON.');
        return true;
      }());

      return LotteryDrawResponse(
        resultId: mapValueOfType<String>(json, r'resultId')!,
        status: LotteryStatus.fromJson(json[r'status'])!,
        prizeGrade: PrizeGrade.fromJson(json[r'prizeGrade'])!,
        prizeName: mapValueOfType<String>(json, r'prizeName'),
        message: mapValueOfType<String>(json, r'message')!,
        createdAt: mapDateTime(json, r'createdAt', r'')!,
      );
    }
    return null;
  }

  static List<LotteryDrawResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LotteryDrawResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LotteryDrawResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LotteryDrawResponse> mapFromJson(dynamic json) {
    final map = <String, LotteryDrawResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LotteryDrawResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LotteryDrawResponse-objects as value to a dart map
  static Map<String, List<LotteryDrawResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LotteryDrawResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LotteryDrawResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'resultId',
    'status',
    'prizeGrade',
    'prizeName',
    'message',
    'createdAt',
  };
}

