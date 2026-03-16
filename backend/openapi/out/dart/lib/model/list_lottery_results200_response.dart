//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ListLotteryResults200Response {
  /// Returns a new [ListLotteryResults200Response] instance.
  ListLotteryResults200Response({
    this.items = const [],
    this.nextToken,
  });

  List<LotteryResult> items;

  String? nextToken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ListLotteryResults200Response &&
    _deepEquality.equals(other.items, items) &&
    other.nextToken == nextToken;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (items.hashCode) +
    (nextToken == null ? 0 : nextToken!.hashCode);

  @override
  String toString() => 'ListLotteryResults200Response[items=$items, nextToken=$nextToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'items'] = this.items;
    if (this.nextToken != null) {
      json[r'nextToken'] = this.nextToken;
    } else {
      json[r'nextToken'] = null;
    }
    return json;
  }

  /// Returns a new [ListLotteryResults200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ListLotteryResults200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'items'), 'Required key "ListLotteryResults200Response[items]" is missing from JSON.');
        assert(json[r'items'] != null, 'Required key "ListLotteryResults200Response[items]" has a null value in JSON.');
        return true;
      }());

      return ListLotteryResults200Response(
        items: LotteryResult.listFromJson(json[r'items']),
        nextToken: mapValueOfType<String>(json, r'nextToken'),
      );
    }
    return null;
  }

  static List<ListLotteryResults200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ListLotteryResults200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListLotteryResults200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListLotteryResults200Response> mapFromJson(dynamic json) {
    final map = <String, ListLotteryResults200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ListLotteryResults200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListLotteryResults200Response-objects as value to a dart map
  static Map<String, List<ListLotteryResults200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ListLotteryResults200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListLotteryResults200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'items',
  };
}

