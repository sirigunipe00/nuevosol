// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_invoice_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesInvoiceForm _$SalesInvoiceFormFromJson(Map<String, dynamic> json) {
  return _SalesInvoiceForm.fromJson(json);
}

/// @nodoc
mixin _$SalesInvoiceForm {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  String? get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'posting_date', defaultValue: '')
  String? get postingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', defaultValue: '')
  String? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total')
  int? get grandTotal => throw _privateConstructorUsedError;

  /// Serializes this SalesInvoiceForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesInvoiceForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesInvoiceFormCopyWith<SalesInvoiceForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesInvoiceFormCopyWith<$Res> {
  factory $SalesInvoiceFormCopyWith(
          SalesInvoiceForm value, $Res Function(SalesInvoiceForm) then) =
      _$SalesInvoiceFormCopyWithImpl<$Res, SalesInvoiceForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'customer') String? customer,
      @JsonKey(name: 'posting_date', defaultValue: '') String? postingDate,
      @JsonKey(name: 'due_date', defaultValue: '') String? dueDate,
      @JsonKey(name: 'grand_total') int? grandTotal});
}

/// @nodoc
class _$SalesInvoiceFormCopyWithImpl<$Res, $Val extends SalesInvoiceForm>
    implements $SalesInvoiceFormCopyWith<$Res> {
  _$SalesInvoiceFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesInvoiceForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? customer = freezed,
    Object? postingDate = freezed,
    Object? dueDate = freezed,
    Object? grandTotal = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      postingDate: freezed == postingDate
          ? _value.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      grandTotal: freezed == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesInvoiceFormImplCopyWith<$Res>
    implements $SalesInvoiceFormCopyWith<$Res> {
  factory _$$SalesInvoiceFormImplCopyWith(_$SalesInvoiceFormImpl value,
          $Res Function(_$SalesInvoiceFormImpl) then) =
      __$$SalesInvoiceFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'customer') String? customer,
      @JsonKey(name: 'posting_date', defaultValue: '') String? postingDate,
      @JsonKey(name: 'due_date', defaultValue: '') String? dueDate,
      @JsonKey(name: 'grand_total') int? grandTotal});
}

/// @nodoc
class __$$SalesInvoiceFormImplCopyWithImpl<$Res>
    extends _$SalesInvoiceFormCopyWithImpl<$Res, _$SalesInvoiceFormImpl>
    implements _$$SalesInvoiceFormImplCopyWith<$Res> {
  __$$SalesInvoiceFormImplCopyWithImpl(_$SalesInvoiceFormImpl _value,
      $Res Function(_$SalesInvoiceFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesInvoiceForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? customer = freezed,
    Object? postingDate = freezed,
    Object? dueDate = freezed,
    Object? grandTotal = freezed,
  }) {
    return _then(_$SalesInvoiceFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      postingDate: freezed == postingDate
          ? _value.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      grandTotal: freezed == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesInvoiceFormImpl implements _SalesInvoiceForm {
  const _$SalesInvoiceFormImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'customer') this.customer,
      @JsonKey(name: 'posting_date', defaultValue: '') this.postingDate,
      @JsonKey(name: 'due_date', defaultValue: '') this.dueDate,
      @JsonKey(name: 'grand_total') this.grandTotal});

  factory _$SalesInvoiceFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesInvoiceFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'customer')
  final String? customer;
  @override
  @JsonKey(name: 'posting_date', defaultValue: '')
  final String? postingDate;
  @override
  @JsonKey(name: 'due_date', defaultValue: '')
  final String? dueDate;
  @override
  @JsonKey(name: 'grand_total')
  final int? grandTotal;

  @override
  String toString() {
    return 'SalesInvoiceForm(name: $name, customer: $customer, postingDate: $postingDate, dueDate: $dueDate, grandTotal: $grandTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesInvoiceFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, customer, postingDate, dueDate, grandTotal);

  /// Create a copy of SalesInvoiceForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesInvoiceFormImplCopyWith<_$SalesInvoiceFormImpl> get copyWith =>
      __$$SalesInvoiceFormImplCopyWithImpl<_$SalesInvoiceFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesInvoiceFormImplToJson(
      this,
    );
  }
}

abstract class _SalesInvoiceForm implements SalesInvoiceForm {
  const factory _SalesInvoiceForm(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'customer') final String? customer,
          @JsonKey(name: 'posting_date', defaultValue: '')
          final String? postingDate,
          @JsonKey(name: 'due_date', defaultValue: '') final String? dueDate,
          @JsonKey(name: 'grand_total') final int? grandTotal}) =
      _$SalesInvoiceFormImpl;

  factory _SalesInvoiceForm.fromJson(Map<String, dynamic> json) =
      _$SalesInvoiceFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'customer')
  String? get customer;
  @override
  @JsonKey(name: 'posting_date', defaultValue: '')
  String? get postingDate;
  @override
  @JsonKey(name: 'due_date', defaultValue: '')
  String? get dueDate;
  @override
  @JsonKey(name: 'grand_total')
  int? get grandTotal;

  /// Create a copy of SalesInvoiceForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesInvoiceFormImplCopyWith<_$SalesInvoiceFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
