//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Inventory {
  /// Returns a new [Inventory] instance.
  Inventory({
    required this.storeId,
    required this.prizeGrade,
    required this.prizeName,
    required this.totalCount,
    required this.remainingCount,
    required this.version,
  });

  String storeId;

  PrizeGrade prizeGrade;

  String prizeName;

  /// Minimum value: 0
  int totalCount;

  /// Minimum value: 0
  int remainingCount;

  /// Minimum value: 0
  int version;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Inventory &&
    other.storeId == storeId &&
    other.prizeGrade == prizeGrade &&
    other.prizeName == prizeName &&
    other.totalCount == totalCount &&
    other.remainingCount == remainingCount &&
    other.version == version;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (storeId.hashCode) +
    (prizeGrade.hashCode) +
    (prizeName.hashCode) +
    (totalCount.hashCode) +
    (remainingCount.hashCode) +
    (version.hashCode);

  @override
  String toString() => 'Inventory[storeId=$storeId, prizeGrade=$prizeGrade, prizeName=$prizeName, totalCount=$totalCount, remainingCount=$remainingCount, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'storeId'] = this.storeId;
      json[r'prizeGrade'] = this.prizeGrade;
      json[r'prizeName'] = this.prizeName;
      json[r'totalCount'] = this.totalCount;
      json[r'remainingCount'] = this.remainingCount;
      json[r'version'] = this.version;
    return json;
  }

  /// Returns a new [Inventory] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Inventory? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'storeId'), 'Required key "Inventory[storeId]" is missing from JSON.');
        assert(json[r'storeId'] != null, 'Required key "Inventory[storeId]" has a null value in JSON.');
        assert(json.containsKey(r'prizeGrade'), 'Required key "Inventory[prizeGrade]" is missing from JSON.');
        assert(json[r'prizeGrade'] != null, 'Required key "Inventory[prizeGrade]" has a null value in JSON.');
        assert(json.containsKey(r'prizeName'), 'Required key "Inventory[prizeName]" is missing from JSON.');
        assert(json[r'prizeName'] != null, 'Required key "Inventory[prizeName]" has a null value in JSON.');
        assert(json.containsKey(r'totalCount'), 'Required key "Inventory[totalCount]" is missing from JSON.');
        assert(json[r'totalCount'] != null, 'Required key "Inventory[totalCount]" has a null value in JSON.');
        assert(json.containsKey(r'remainingCount'), 'Required key "Inventory[remainingCount]" is missing from JSON.');
        assert(json[r'remainingCount'] != null, 'Required key "Inventory[remainingCount]" has a null value in JSON.');
        assert(json.containsKey(r'version'), 'Required key "Inventory[version]" is missing from JSON.');
        assert(json[r'version'] != null, 'Required key "Inventory[version]" has a null value in JSON.');
        return true;
      }());

      return Inventory(
        storeId: mapValueOfType<String>(json, r'storeId')!,
        prizeGrade: PrizeGrade.fromJson(json[r'prizeGrade'])!,
        prizeName: mapValueOfType<String>(json, r'prizeName')!,
        totalCount: mapValueOfType<int>(json, r'totalCount')!,
        remainingCount: mapValueOfType<int>(json, r'remainingCount')!,
        version: mapValueOfType<int>(json, r'version')!,
      );
    }
    return null;
  }

  static List<Inventory> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Inventory>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Inventory.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Inventory> mapFromJson(dynamic json) {
    final map = <String, Inventory>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Inventory.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Inventory-objects as value to a dart map
  static Map<String, List<Inventory>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Inventory>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Inventory.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'storeId',
    'prizeGrade',
    'prizeName',
    'totalCount',
    'remainingCount',
    'version',
  };
}

