// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'po_approval.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoApprovalForm _$PoApprovalFormFromJson(Map<String, dynamic> json) {
  return _PoApprovalForm.fromJson(json);
}

/// @nodoc
mixin _$PoApprovalForm {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier')
  String get vendor => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String get vendorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation')
  String get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'company')
  String get requestedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total', defaultValue: 0.0)
  double get grandTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_qty', defaultValue: 0.0)
  double get totalQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'total', defaultValue: 0.0)
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_terms_template')
  String? get paymentTerm => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_date')
  String? get requiredBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_person', defaultValue: '')
  String get vendorsContact => throw _privateConstructorUsedError;
  @JsonKey(name: 'workflow_state')
  String get state => throw _privateConstructorUsedError;

  /// Serializes this PoApprovalForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoApprovalForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoApprovalFormCopyWith<PoApprovalForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoApprovalFormCopyWith<$Res> {
  factory $PoApprovalFormCopyWith(
          PoApprovalForm value, $Res Function(PoApprovalForm) then) =
      _$PoApprovalFormCopyWithImpl<$Res, PoApprovalForm>;
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'supplier') String vendor,
      @JsonKey(name: 'supplier_name') String vendorName,
      @JsonKey(name: 'creation') String creationDate,
      @JsonKey(name: 'company') String requestedBy,
      @JsonKey(name: 'grand_total', defaultValue: 0.0) double grandTotal,
      @JsonKey(name: 'total_qty', defaultValue: 0.0) double totalQty,
      @JsonKey(name: 'total', defaultValue: 0.0) double total,
      @JsonKey(name: 'payment_terms_template') String? paymentTerm,
      @JsonKey(name: 'schedule_date') String? requiredBy,
      @JsonKey(name: 'contact_person', defaultValue: '') String vendorsContact,
      @JsonKey(name: 'workflow_state') String state});
}

/// @nodoc
class _$PoApprovalFormCopyWithImpl<$Res, $Val extends PoApprovalForm>
    implements $PoApprovalFormCopyWith<$Res> {
  _$PoApprovalFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoApprovalForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = null,
    Object? vendor = null,
    Object? vendorName = null,
    Object? creationDate = null,
    Object? requestedBy = null,
    Object? grandTotal = null,
    Object? totalQty = null,
    Object? total = null,
    Object? paymentTerm = freezed,
    Object? requiredBy = freezed,
    Object? vendorsContact = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      vendorName: null == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      requestedBy: null == requestedBy
          ? _value.requestedBy
          : requestedBy // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      totalQty: null == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTerm: freezed == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredBy: freezed == requiredBy
          ? _value.requiredBy
          : requiredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorsContact: null == vendorsContact
          ? _value.vendorsContact
          : vendorsContact // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoApprovalFormImplCopyWith<$Res>
    implements $PoApprovalFormCopyWith<$Res> {
  factory _$$PoApprovalFormImplCopyWith(_$PoApprovalFormImpl value,
          $Res Function(_$PoApprovalFormImpl) then) =
      __$$PoApprovalFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'supplier') String vendor,
      @JsonKey(name: 'supplier_name') String vendorName,
      @JsonKey(name: 'creation') String creationDate,
      @JsonKey(name: 'company') String requestedBy,
      @JsonKey(name: 'grand_total', defaultValue: 0.0) double grandTotal,
      @JsonKey(name: 'total_qty', defaultValue: 0.0) double totalQty,
      @JsonKey(name: 'total', defaultValue: 0.0) double total,
      @JsonKey(name: 'payment_terms_template') String? paymentTerm,
      @JsonKey(name: 'schedule_date') String? requiredBy,
      @JsonKey(name: 'contact_person', defaultValue: '') String vendorsContact,
      @JsonKey(name: 'workflow_state') String state});
}

/// @nodoc
class __$$PoApprovalFormImplCopyWithImpl<$Res>
    extends _$PoApprovalFormCopyWithImpl<$Res, _$PoApprovalFormImpl>
    implements _$$PoApprovalFormImplCopyWith<$Res> {
  __$$PoApprovalFormImplCopyWithImpl(
      _$PoApprovalFormImpl _value, $Res Function(_$PoApprovalFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoApprovalForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = null,
    Object? vendor = null,
    Object? vendorName = null,
    Object? creationDate = null,
    Object? requestedBy = null,
    Object? grandTotal = null,
    Object? totalQty = null,
    Object? total = null,
    Object? paymentTerm = freezed,
    Object? requiredBy = freezed,
    Object? vendorsContact = null,
    Object? state = null,
  }) {
    return _then(_$PoApprovalFormImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      vendorName: null == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      requestedBy: null == requestedBy
          ? _value.requestedBy
          : requestedBy // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      totalQty: null == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTerm: freezed == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredBy: freezed == requiredBy
          ? _value.requiredBy
          : requiredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorsContact: null == vendorsContact
          ? _value.vendorsContact
          : vendorsContact // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoApprovalFormImpl implements _PoApprovalForm {
  const _$PoApprovalFormImpl(
      {this.status,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'supplier') required this.vendor,
      @JsonKey(name: 'supplier_name') required this.vendorName,
      @JsonKey(name: 'creation') required this.creationDate,
      @JsonKey(name: 'company') required this.requestedBy,
      @JsonKey(name: 'grand_total', defaultValue: 0.0) required this.grandTotal,
      @JsonKey(name: 'total_qty', defaultValue: 0.0) required this.totalQty,
      @JsonKey(name: 'total', defaultValue: 0.0) required this.total,
      @JsonKey(name: 'payment_terms_template') this.paymentTerm,
      @JsonKey(name: 'schedule_date') this.requiredBy,
      @JsonKey(name: 'contact_person', defaultValue: '')
      required this.vendorsContact,
      @JsonKey(name: 'workflow_state') required this.state});

  factory _$PoApprovalFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoApprovalFormImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'supplier')
  final String vendor;
  @override
  @JsonKey(name: 'supplier_name')
  final String vendorName;
  @override
  @JsonKey(name: 'creation')
  final String creationDate;
  @override
  @JsonKey(name: 'company')
  final String requestedBy;
  @override
  @JsonKey(name: 'grand_total', defaultValue: 0.0)
  final double grandTotal;
  @override
  @JsonKey(name: 'total_qty', defaultValue: 0.0)
  final double totalQty;
  @override
  @JsonKey(name: 'total', defaultValue: 0.0)
  final double total;
  @override
  @JsonKey(name: 'payment_terms_template')
  final String? paymentTerm;
  @override
  @JsonKey(name: 'schedule_date')
  final String? requiredBy;
  @override
  @JsonKey(name: 'contact_person', defaultValue: '')
  final String vendorsContact;
  @override
  @JsonKey(name: 'workflow_state')
  final String state;

  @override
  String toString() {
    return 'PoApprovalForm(status: $status, name: $name, vendor: $vendor, vendorName: $vendorName, creationDate: $creationDate, requestedBy: $requestedBy, grandTotal: $grandTotal, totalQty: $totalQty, total: $total, paymentTerm: $paymentTerm, requiredBy: $requiredBy, vendorsContact: $vendorsContact, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoApprovalFormImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.requestedBy, requestedBy) ||
                other.requestedBy == requestedBy) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.totalQty, totalQty) ||
                other.totalQty == totalQty) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paymentTerm, paymentTerm) ||
                other.paymentTerm == paymentTerm) &&
            (identical(other.requiredBy, requiredBy) ||
                other.requiredBy == requiredBy) &&
            (identical(other.vendorsContact, vendorsContact) ||
                other.vendorsContact == vendorsContact) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      name,
      vendor,
      vendorName,
      creationDate,
      requestedBy,
      grandTotal,
      totalQty,
      total,
      paymentTerm,
      requiredBy,
      vendorsContact,
      state);

  /// Create a copy of PoApprovalForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoApprovalFormImplCopyWith<_$PoApprovalFormImpl> get copyWith =>
      __$$PoApprovalFormImplCopyWithImpl<_$PoApprovalFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoApprovalFormImplToJson(
      this,
    );
  }
}

abstract class _PoApprovalForm implements PoApprovalForm {
  const factory _PoApprovalForm(
      {final String? status,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'supplier') required final String vendor,
      @JsonKey(name: 'supplier_name') required final String vendorName,
      @JsonKey(name: 'creation') required final String creationDate,
      @JsonKey(name: 'company') required final String requestedBy,
      @JsonKey(name: 'grand_total', defaultValue: 0.0)
      required final double grandTotal,
      @JsonKey(name: 'total_qty', defaultValue: 0.0)
      required final double totalQty,
      @JsonKey(name: 'total', defaultValue: 0.0) required final double total,
      @JsonKey(name: 'payment_terms_template') final String? paymentTerm,
      @JsonKey(name: 'schedule_date') final String? requiredBy,
      @JsonKey(name: 'contact_person', defaultValue: '')
      required final String vendorsContact,
      @JsonKey(name: 'workflow_state')
      required final String state}) = _$PoApprovalFormImpl;

  factory _PoApprovalForm.fromJson(Map<String, dynamic> json) =
      _$PoApprovalFormImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'supplier')
  String get vendor;
  @override
  @JsonKey(name: 'supplier_name')
  String get vendorName;
  @override
  @JsonKey(name: 'creation')
  String get creationDate;
  @override
  @JsonKey(name: 'company')
  String get requestedBy;
  @override
  @JsonKey(name: 'grand_total', defaultValue: 0.0)
  double get grandTotal;
  @override
  @JsonKey(name: 'total_qty', defaultValue: 0.0)
  double get totalQty;
  @override
  @JsonKey(name: 'total', defaultValue: 0.0)
  double get total;
  @override
  @JsonKey(name: 'payment_terms_template')
  String? get paymentTerm;
  @override
  @JsonKey(name: 'schedule_date')
  String? get requiredBy;
  @override
  @JsonKey(name: 'contact_person', defaultValue: '')
  String get vendorsContact;
  @override
  @JsonKey(name: 'workflow_state')
  String get state;

  /// Create a copy of PoApprovalForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoApprovalFormImplCopyWith<_$PoApprovalFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
