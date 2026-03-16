//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PrizeGrade {
  /// Instantiate a new enum with the provided [value].
  const PrizeGrade._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const A = PrizeGrade._(r'A');
  static const B = PrizeGrade._(r'B');
  static const C = PrizeGrade._(r'C');
  static const D = PrizeGrade._(r'D');
  static const E = PrizeGrade._(r'E');
  static const F = PrizeGrade._(r'F');

  /// List of all possible values in this [enum][PrizeGrade].
  static const values = <PrizeGrade>[
    A,
    B,
    C,
    D,
    E,
    F,
  ];

  static PrizeGrade? fromJson(dynamic value) => PrizeGradeTypeTransformer().decode(value);

  static List<PrizeGrade> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PrizeGrade>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PrizeGrade.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PrizeGrade] to String,
/// and [decode] dynamic data back to [PrizeGrade].
class PrizeGradeTypeTransformer {
  factory PrizeGradeTypeTransformer() => _instance ??= const PrizeGradeTypeTransformer._();

  const PrizeGradeTypeTransformer._();

  String encode(PrizeGrade data) => data.value;

  /// Decodes a [dynamic value][data] to a PrizeGrade.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PrizeGrade? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'A': return PrizeGrade.A;
        case r'B': return PrizeGrade.B;
        case r'C': return PrizeGrade.C;
        case r'D': return PrizeGrade.D;
        case r'E': return PrizeGrade.E;
        case r'F': return PrizeGrade.F;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PrizeGradeTypeTransformer] instance.
  static PrizeGradeTypeTransformer? _instance;
}

