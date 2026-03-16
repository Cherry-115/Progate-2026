//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Payment {
  /// Returns a new [Payment] instance.
  Payment({
    required this.paymentId,
    required this.status,
    required this.amount,
    required this.currency,
    required this.createdAt,
    this.paidAt,
  });

  String paymentId;

  PaymentStatusEnum status;

  /// Minimum value: 1
  int amount;

  String currency;

  DateTime createdAt;

  DateTime? paidAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Payment &&
    other.paymentId == paymentId &&
    other.status == status &&
    other.amount == amount &&
    other.currency == currency &&
    other.createdAt == createdAt &&
    other.paidAt == paidAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (paymentId.hashCode) +
    (status.hashCode) +
    (amount.hashCode) +
    (currency.hashCode) +
    (createdAt.hashCode) +
    (paidAt == null ? 0 : paidAt!.hashCode);

  @override
  String toString() => 'Payment[paymentId=$paymentId, status=$status, amount=$amount, currency=$currency, createdAt=$createdAt, paidAt=$paidAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'paymentId'] = this.paymentId;
      json[r'status'] = this.status;
      json[r'amount'] = this.amount;
      json[r'currency'] = this.currency;
      json[r'createdAt'] = this.createdAt.toUtc().toIso8601String();
    if (this.paidAt != null) {
      json[r'paidAt'] = this.paidAt!.toUtc().toIso8601String();
    } else {
      json[r'paidAt'] = null;
    }
    return json;
  }

  /// Returns a new [Payment] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Payment? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'paymentId'), 'Required key "Payment[paymentId]" is missing from JSON.');
        assert(json[r'paymentId'] != null, 'Required key "Payment[paymentId]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "Payment[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "Payment[status]" has a null value in JSON.');
        assert(json.containsKey(r'amount'), 'Required key "Payment[amount]" is missing from JSON.');
        assert(json[r'amount'] != null, 'Required key "Payment[amount]" has a null value in JSON.');
        assert(json.containsKey(r'currency'), 'Required key "Payment[currency]" is missing from JSON.');
        assert(json[r'currency'] != null, 'Required key "Payment[currency]" has a null value in JSON.');
        assert(json.containsKey(r'createdAt'), 'Required key "Payment[createdAt]" is missing from JSON.');
        assert(json[r'createdAt'] != null, 'Required key "Payment[createdAt]" has a null value in JSON.');
        return true;
      }());

      return Payment(
        paymentId: mapValueOfType<String>(json, r'paymentId')!,
        status: PaymentStatusEnum.fromJson(json[r'status'])!,
        amount: mapValueOfType<int>(json, r'amount')!,
        currency: mapValueOfType<String>(json, r'currency')!,
        createdAt: mapDateTime(json, r'createdAt', r'')!,
        paidAt: mapDateTime(json, r'paidAt', r''),
      );
    }
    return null;
  }

  static List<Payment> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Payment>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Payment.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Payment> mapFromJson(dynamic json) {
    final map = <String, Payment>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Payment.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Payment-objects as value to a dart map
  static Map<String, List<Payment>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Payment>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Payment.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'paymentId',
    'status',
    'amount',
    'currency',
    'createdAt',
  };
}


class PaymentStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const PaymentStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const CREATED = PaymentStatusEnum._(r'CREATED');
  static const PENDING = PaymentStatusEnum._(r'PENDING');
  static const PAID = PaymentStatusEnum._(r'PAID');
  static const FAILED = PaymentStatusEnum._(r'FAILED');
  static const CANCELED = PaymentStatusEnum._(r'CANCELED');

  /// List of all possible values in this [enum][PaymentStatusEnum].
  static const values = <PaymentStatusEnum>[
    CREATED,
    PENDING,
    PAID,
    FAILED,
    CANCELED,
  ];

  static PaymentStatusEnum? fromJson(dynamic value) => PaymentStatusEnumTypeTransformer().decode(value);

  static List<PaymentStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PaymentStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PaymentStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PaymentStatusEnum] to String,
/// and [decode] dynamic data back to [PaymentStatusEnum].
class PaymentStatusEnumTypeTransformer {
  factory PaymentStatusEnumTypeTransformer() => _instance ??= const PaymentStatusEnumTypeTransformer._();

  const PaymentStatusEnumTypeTransformer._();

  String encode(PaymentStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PaymentStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PaymentStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'CREATED': return PaymentStatusEnum.CREATED;
        case r'PENDING': return PaymentStatusEnum.PENDING;
        case r'PAID': return PaymentStatusEnum.PAID;
        case r'FAILED': return PaymentStatusEnum.FAILED;
        case r'CANCELED': return PaymentStatusEnum.CANCELED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PaymentStatusEnumTypeTransformer] instance.
  static PaymentStatusEnumTypeTransformer? _instance;
}


