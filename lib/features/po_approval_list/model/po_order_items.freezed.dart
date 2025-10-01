// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'po_order_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoOrderItemsForm _$PoOrderItemsFormFromJson(Map<String, dynamic> json) {
  return _PoOrderItemsForm.fromJson(json);
}

/// @nodoc
mixin _$PoOrderItemsForm {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity', defaultValue: 0.0)
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate', defaultValue: 0.0)
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount', defaultValue: 0.0)
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'net_amount', defaultValue: 0.0)
  double get netAmount => throw _privateConstructorUsedError;

  /// Serializes this PoOrderItemsForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoOrderItemsForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoOrderItemsFormCopyWith<PoOrderItemsForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoOrderItemsFormCopyWith<$Res> {
  factory $PoOrderItemsFormCopyWith(
          PoOrderItemsForm value, $Res Function(PoOrderItemsForm) then) =
      _$PoOrderItemsFormCopyWithImpl<$Res, PoOrderItemsForm>;
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'quantity', defaultValue: 0.0) double quantity,
      @JsonKey(name: 'rate', defaultValue: 0.0) double rate,
      @JsonKey(name: 'amount', defaultValue: 0.0) double amount,
      @JsonKey(name: 'net_amount', defaultValue: 0.0) double netAmount});
}

/// @nodoc
class _$PoOrderItemsFormCopyWithImpl<$Res, $Val extends PoOrderItemsForm>
    implements $PoOrderItemsFormCopyWith<$Res> {
  _$PoOrderItemsFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoOrderItemsForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? itemName = null,
    Object? quantity = null,
    Object? rate = null,
    Object? amount = null,
    Object? netAmount = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoOrderItemsFormImplCopyWith<$Res>
    implements $PoOrderItemsFormCopyWith<$Res> {
  factory _$$PoOrderItemsFormImplCopyWith(_$PoOrderItemsFormImpl value,
          $Res Function(_$PoOrderItemsFormImpl) then) =
      __$$PoOrderItemsFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'quantity', defaultValue: 0.0) double quantity,
      @JsonKey(name: 'rate', defaultValue: 0.0) double rate,
      @JsonKey(name: 'amount', defaultValue: 0.0) double amount,
      @JsonKey(name: 'net_amount', defaultValue: 0.0) double netAmount});
}

/// @nodoc
class __$$PoOrderItemsFormImplCopyWithImpl<$Res>
    extends _$PoOrderItemsFormCopyWithImpl<$Res, _$PoOrderItemsFormImpl>
    implements _$$PoOrderItemsFormImplCopyWith<$Res> {
  __$$PoOrderItemsFormImplCopyWithImpl(_$PoOrderItemsFormImpl _value,
      $Res Function(_$PoOrderItemsFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoOrderItemsForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? itemName = null,
    Object? quantity = null,
    Object? rate = null,
    Object? amount = null,
    Object? netAmount = null,
  }) {
    return _then(_$PoOrderItemsFormImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoOrderItemsFormImpl implements _PoOrderItemsForm {
  const _$PoOrderItemsFormImpl(
      {this.status,
      @JsonKey(name: 'item_name') required this.itemName,
      @JsonKey(name: 'quantity', defaultValue: 0.0) required this.quantity,
      @JsonKey(name: 'rate', defaultValue: 0.0) required this.rate,
      @JsonKey(name: 'amount', defaultValue: 0.0) required this.amount,
      @JsonKey(name: 'net_amount', defaultValue: 0.0) required this.netAmount});

  factory _$PoOrderItemsFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoOrderItemsFormImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0.0)
  final double quantity;
  @override
  @JsonKey(name: 'rate', defaultValue: 0.0)
  final double rate;
  @override
  @JsonKey(name: 'amount', defaultValue: 0.0)
  final double amount;
  @override
  @JsonKey(name: 'net_amount', defaultValue: 0.0)
  final double netAmount;

  @override
  String toString() {
    return 'PoOrderItemsForm(status: $status, itemName: $itemName, quantity: $quantity, rate: $rate, amount: $amount, netAmount: $netAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoOrderItemsFormImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, itemName, quantity, rate, amount, netAmount);

  /// Create a copy of PoOrderItemsForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoOrderItemsFormImplCopyWith<_$PoOrderItemsFormImpl> get copyWith =>
      __$$PoOrderItemsFormImplCopyWithImpl<_$PoOrderItemsFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoOrderItemsFormImplToJson(
      this,
    );
  }
}

abstract class _PoOrderItemsForm implements PoOrderItemsForm {
  const factory _PoOrderItemsForm(
      {final String? status,
      @JsonKey(name: 'item_name') required final String itemName,
      @JsonKey(name: 'quantity', defaultValue: 0.0)
      required final double quantity,
      @JsonKey(name: 'rate', defaultValue: 0.0) required final double rate,
      @JsonKey(name: 'amount', defaultValue: 0.0) required final double amount,
      @JsonKey(name: 'net_amount', defaultValue: 0.0)
      required final double netAmount}) = _$PoOrderItemsFormImpl;

  factory _PoOrderItemsForm.fromJson(Map<String, dynamic> json) =
      _$PoOrderItemsFormImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0.0)
  double get quantity;
  @override
  @JsonKey(name: 'rate', defaultValue: 0.0)
  double get rate;
  @override
  @JsonKey(name: 'amount', defaultValue: 0.0)
  double get amount;
  @override
  @JsonKey(name: 'net_amount', defaultValue: 0.0)
  double get netAmount;

  /// Create a copy of PoOrderItemsForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoOrderItemsFormImplCopyWith<_$PoOrderItemsFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
