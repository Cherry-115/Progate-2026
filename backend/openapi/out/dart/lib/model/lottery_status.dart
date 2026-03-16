//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class LotteryStatus {
  /// Instantiate a new enum with the provided [value].
  const LotteryStatus._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const PENDING = LotteryStatus._(r'PENDING');
  static const WON = LotteryStatus._(r'WON');
  static const LOST = LotteryStatus._(r'LOST');
  static const RECEIVED = LotteryStatus._(r'RECEIVED');

  /// List of all possible values in this [enum][LotteryStatus].
  static const values = <LotteryStatus>[
    PENDING,
    WON,
    LOST,
    RECEIVED,
  ];

  static LotteryStatus? fromJson(dynamic value) => LotteryStatusTypeTransformer().decode(value);

  static List<LotteryStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LotteryStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LotteryStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [LotteryStatus] to String,
/// and [decode] dynamic data back to [LotteryStatus].
class LotteryStatusTypeTransformer {
  factory LotteryStatusTypeTransformer() => _instance ??= const LotteryStatusTypeTransformer._();

  const LotteryStatusTypeTransformer._();

  String encode(LotteryStatus data) => data.value;

  /// Decodes a [dynamic value][data] to a LotteryStatus.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  LotteryStatus? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'PENDING': return LotteryStatus.PENDING;
        case r'WON': return LotteryStatus.WON;
        case r'LOST': return LotteryStatus.LOST;
        case r'RECEIVED': return LotteryStatus.RECEIVED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [LotteryStatusTypeTransformer] instance.
  static LotteryStatusTypeTransformer? _instance;
}

