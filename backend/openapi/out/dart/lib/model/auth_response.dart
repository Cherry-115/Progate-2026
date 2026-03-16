//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthResponse {
  /// Returns a new [AuthResponse] instance.
  AuthResponse({
    required this.accessToken,
    this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  String accessToken;

  String? refreshToken;

  String tokenType;

  /// seconds
  int expiresIn;

  User user;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthResponse &&
    other.accessToken == accessToken &&
    other.refreshToken == refreshToken &&
    other.tokenType == tokenType &&
    other.expiresIn == expiresIn &&
    other.user == user;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accessToken.hashCode) +
    (refreshToken == null ? 0 : refreshToken!.hashCode) +
    (tokenType.hashCode) +
    (expiresIn.hashCode) +
    (user.hashCode);

  @override
  String toString() => 'AuthResponse[accessToken=$accessToken, refreshToken=$refreshToken, tokenType=$tokenType, expiresIn=$expiresIn, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'accessToken'] = this.accessToken;
    if (this.refreshToken != null) {
      json[r'refreshToken'] = this.refreshToken;
    } else {
      json[r'refreshToken'] = null;
    }
      json[r'tokenType'] = this.tokenType;
      json[r'expiresIn'] = this.expiresIn;
      json[r'user'] = this.user;
    return json;
  }

  /// Returns a new [AuthResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'accessToken'), 'Required key "AuthResponse[accessToken]" is missing from JSON.');
        assert(json[r'accessToken'] != null, 'Required key "AuthResponse[accessToken]" has a null value in JSON.');
        assert(json.containsKey(r'tokenType'), 'Required key "AuthResponse[tokenType]" is missing from JSON.');
        assert(json[r'tokenType'] != null, 'Required key "AuthResponse[tokenType]" has a null value in JSON.');
        assert(json.containsKey(r'expiresIn'), 'Required key "AuthResponse[expiresIn]" is missing from JSON.');
        assert(json[r'expiresIn'] != null, 'Required key "AuthResponse[expiresIn]" has a null value in JSON.');
        assert(json.containsKey(r'user'), 'Required key "AuthResponse[user]" is missing from JSON.');
        assert(json[r'user'] != null, 'Required key "AuthResponse[user]" has a null value in JSON.');
        return true;
      }());

      return AuthResponse(
        accessToken: mapValueOfType<String>(json, r'accessToken')!,
        refreshToken: mapValueOfType<String>(json, r'refreshToken'),
        tokenType: mapValueOfType<String>(json, r'tokenType')!,
        expiresIn: mapValueOfType<int>(json, r'expiresIn')!,
        user: User.fromJson(json[r'user'])!,
      );
    }
    return null;
  }

  static List<AuthResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthResponse> mapFromJson(dynamic json) {
    final map = <String, AuthResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthResponse-objects as value to a dart map
  static Map<String, List<AuthResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuthResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'accessToken',
    'tokenType',
    'expiresIn',
    'user',
  };
}

