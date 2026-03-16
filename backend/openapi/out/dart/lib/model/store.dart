//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Store {
  /// Returns a new [Store] instance.
  Store({
    required this.storeId,
    required this.storeName,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.geohash,
    required this.isActive,
    this.distanceMeters,
  });

  String storeId;

  String storeName;

  String address;

  double latitude;

  double longitude;

  String geohash;

  bool isActive;

  /// 検索時のみ返すことがある
  double? distanceMeters;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Store &&
    other.storeId == storeId &&
    other.storeName == storeName &&
    other.address == address &&
    other.latitude == latitude &&
    other.longitude == longitude &&
    other.geohash == geohash &&
    other.isActive == isActive &&
    other.distanceMeters == distanceMeters;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (storeId.hashCode) +
    (storeName.hashCode) +
    (address.hashCode) +
    (latitude.hashCode) +
    (longitude.hashCode) +
    (geohash.hashCode) +
    (isActive.hashCode) +
    (distanceMeters == null ? 0 : distanceMeters!.hashCode);

  @override
  String toString() => 'Store[storeId=$storeId, storeName=$storeName, address=$address, latitude=$latitude, longitude=$longitude, geohash=$geohash, isActive=$isActive, distanceMeters=$distanceMeters]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'storeId'] = this.storeId;
      json[r'storeName'] = this.storeName;
      json[r'address'] = this.address;
      json[r'latitude'] = this.latitude;
      json[r'longitude'] = this.longitude;
      json[r'geohash'] = this.geohash;
      json[r'isActive'] = this.isActive;
    if (this.distanceMeters != null) {
      json[r'distanceMeters'] = this.distanceMeters;
    } else {
      json[r'distanceMeters'] = null;
    }
    return json;
  }

  /// Returns a new [Store] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Store? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'storeId'), 'Required key "Store[storeId]" is missing from JSON.');
        assert(json[r'storeId'] != null, 'Required key "Store[storeId]" has a null value in JSON.');
        assert(json.containsKey(r'storeName'), 'Required key "Store[storeName]" is missing from JSON.');
        assert(json[r'storeName'] != null, 'Required key "Store[storeName]" has a null value in JSON.');
        assert(json.containsKey(r'address'), 'Required key "Store[address]" is missing from JSON.');
        assert(json[r'address'] != null, 'Required key "Store[address]" has a null value in JSON.');
        assert(json.containsKey(r'latitude'), 'Required key "Store[latitude]" is missing from JSON.');
        assert(json[r'latitude'] != null, 'Required key "Store[latitude]" has a null value in JSON.');
        assert(json.containsKey(r'longitude'), 'Required key "Store[longitude]" is missing from JSON.');
        assert(json[r'longitude'] != null, 'Required key "Store[longitude]" has a null value in JSON.');
        assert(json.containsKey(r'geohash'), 'Required key "Store[geohash]" is missing from JSON.');
        assert(json[r'geohash'] != null, 'Required key "Store[geohash]" has a null value in JSON.');
        assert(json.containsKey(r'isActive'), 'Required key "Store[isActive]" is missing from JSON.');
        assert(json[r'isActive'] != null, 'Required key "Store[isActive]" has a null value in JSON.');
        return true;
      }());

      return Store(
        storeId: mapValueOfType<String>(json, r'storeId')!,
        storeName: mapValueOfType<String>(json, r'storeName')!,
        address: mapValueOfType<String>(json, r'address')!,
        latitude: mapValueOfType<double>(json, r'latitude')!,
        longitude: mapValueOfType<double>(json, r'longitude')!,
        geohash: mapValueOfType<String>(json, r'geohash')!,
        isActive: mapValueOfType<bool>(json, r'isActive')!,
        distanceMeters: mapValueOfType<double>(json, r'distanceMeters'),
      );
    }
    return null;
  }

  static List<Store> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Store>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Store.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Store> mapFromJson(dynamic json) {
    final map = <String, Store>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Store.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Store-objects as value to a dart map
  static Map<String, List<Store>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Store>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Store.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'storeId',
    'storeName',
    'address',
    'latitude',
    'longitude',
    'geohash',
    'isActive',
  };
}

