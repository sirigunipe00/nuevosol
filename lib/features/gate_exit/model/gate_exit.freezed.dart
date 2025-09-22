// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gate_exit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GateExit _$GateExitFromJson(Map<String, dynamic> json) {
  return _GateExit.fromJson(json);
}

/// @nodoc
mixin _$GateExit {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation', defaultValue: '')
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'docstatus')
  int? get docStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified')
  String? get modifiedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_by')
  String? get modifiedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'idx')
  int? get idx => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_invoice')
  String? get salesInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_no')
  String? get vehicleNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_photo')
  String? get vehiclePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_exit_date')
  String? get gateExitDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_back_photo')
  String? get vehicleBackPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'amended_from')
  String? get amendedFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_gate_exit_time')
  String? get gateExitTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'dcsales_invoice_photo')
  String? get dsScalePhoto => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehiclePhotoImg => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehicleBackPhotoImg => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get dsScalePhotoImg => throw _privateConstructorUsedError;

  /// Serializes this GateExit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GateExit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GateExitCopyWith<GateExit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateExitCopyWith<$Res> {
  factory $GateExitCopyWith(GateExit value, $Res Function(GateExit) then) =
      _$GateExitCopyWithImpl<$Res, GateExit>;
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
      @JsonKey(name: 'docstatus') int? docStatus,
      @JsonKey(name: 'modified') String? modifiedDate,
      @JsonKey(name: 'modified_by') String? modifiedBy,
      @JsonKey(name: 'idx') int? idx,
      @JsonKey(name: 'sales_invoice') String? salesInvoice,
      @JsonKey(name: 'vehicle_no') String? vehicleNo,
      @JsonKey(name: 'vehicle_photo') String? vehiclePhoto,
      @JsonKey(name: 'gate_exit_date') String? gateExitDate,
      @JsonKey(name: 'vehicle_back_photo') String? vehicleBackPhoto,
      @JsonKey(name: 'remarks') String? remarks,
      @JsonKey(name: 'amended_from') String? amendedFrom,
      @JsonKey(name: 'quantity') int? quantity,
      @JsonKey(name: 'custom_gate_exit_time') String? gateExitTime,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'custom_customer_name') String? customerName,
      @JsonKey(name: 'dcsales_invoice_photo') String? dsScalePhoto,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehiclePhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehicleBackPhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? dsScalePhotoImg});
}

/// @nodoc
class _$GateExitCopyWithImpl<$Res, $Val extends GateExit>
    implements $GateExitCopyWith<$Res> {
  _$GateExitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GateExit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? owner = freezed,
    Object? creationDate = freezed,
    Object? docStatus = freezed,
    Object? modifiedDate = freezed,
    Object? modifiedBy = freezed,
    Object? idx = freezed,
    Object? salesInvoice = freezed,
    Object? vehicleNo = freezed,
    Object? vehiclePhoto = freezed,
    Object? gateExitDate = freezed,
    Object? vehicleBackPhoto = freezed,
    Object? remarks = freezed,
    Object? amendedFrom = freezed,
    Object? quantity = freezed,
    Object? gateExitTime = freezed,
    Object? amount = freezed,
    Object? customerName = freezed,
    Object? dsScalePhoto = freezed,
    Object? vehiclePhotoImg = freezed,
    Object? vehicleBackPhotoImg = freezed,
    Object? dsScalePhotoImg = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: freezed == docStatus
          ? _value.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      idx: freezed == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int?,
      salesInvoice: freezed == salesInvoice
          ? _value.salesInvoice
          : salesInvoice // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNo: freezed == vehicleNo
          ? _value.vehicleNo
          : vehicleNo // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePhoto: freezed == vehiclePhoto
          ? _value.vehiclePhoto
          : vehiclePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      gateExitDate: freezed == gateExitDate
          ? _value.gateExitDate
          : gateExitDate // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleBackPhoto: freezed == vehicleBackPhoto
          ? _value.vehicleBackPhoto
          : vehicleBackPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      amendedFrom: freezed == amendedFrom
          ? _value.amendedFrom
          : amendedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      gateExitTime: freezed == gateExitTime
          ? _value.gateExitTime
          : gateExitTime // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      dsScalePhoto: freezed == dsScalePhoto
          ? _value.dsScalePhoto
          : dsScalePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePhotoImg: freezed == vehiclePhotoImg
          ? _value.vehiclePhotoImg
          : vehiclePhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      vehicleBackPhotoImg: freezed == vehicleBackPhotoImg
          ? _value.vehicleBackPhotoImg
          : vehicleBackPhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      dsScalePhotoImg: freezed == dsScalePhotoImg
          ? _value.dsScalePhotoImg
          : dsScalePhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GateExitImplCopyWith<$Res>
    implements $GateExitCopyWith<$Res> {
  factory _$$GateExitImplCopyWith(
          _$GateExitImpl value, $Res Function(_$GateExitImpl) then) =
      __$$GateExitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
      @JsonKey(name: 'docstatus') int? docStatus,
      @JsonKey(name: 'modified') String? modifiedDate,
      @JsonKey(name: 'modified_by') String? modifiedBy,
      @JsonKey(name: 'idx') int? idx,
      @JsonKey(name: 'sales_invoice') String? salesInvoice,
      @JsonKey(name: 'vehicle_no') String? vehicleNo,
      @JsonKey(name: 'vehicle_photo') String? vehiclePhoto,
      @JsonKey(name: 'gate_exit_date') String? gateExitDate,
      @JsonKey(name: 'vehicle_back_photo') String? vehicleBackPhoto,
      @JsonKey(name: 'remarks') String? remarks,
      @JsonKey(name: 'amended_from') String? amendedFrom,
      @JsonKey(name: 'quantity') int? quantity,
      @JsonKey(name: 'custom_gate_exit_time') String? gateExitTime,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'custom_customer_name') String? customerName,
      @JsonKey(name: 'dcsales_invoice_photo') String? dsScalePhoto,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehiclePhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? vehicleBackPhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? dsScalePhotoImg});
}

/// @nodoc
class __$$GateExitImplCopyWithImpl<$Res>
    extends _$GateExitCopyWithImpl<$Res, _$GateExitImpl>
    implements _$$GateExitImplCopyWith<$Res> {
  __$$GateExitImplCopyWithImpl(
      _$GateExitImpl _value, $Res Function(_$GateExitImpl) _then)
      : super(_value, _then);

  /// Create a copy of GateExit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? owner = freezed,
    Object? creationDate = freezed,
    Object? docStatus = freezed,
    Object? modifiedDate = freezed,
    Object? modifiedBy = freezed,
    Object? idx = freezed,
    Object? salesInvoice = freezed,
    Object? vehicleNo = freezed,
    Object? vehiclePhoto = freezed,
    Object? gateExitDate = freezed,
    Object? vehicleBackPhoto = freezed,
    Object? remarks = freezed,
    Object? amendedFrom = freezed,
    Object? quantity = freezed,
    Object? gateExitTime = freezed,
    Object? amount = freezed,
    Object? customerName = freezed,
    Object? dsScalePhoto = freezed,
    Object? vehiclePhotoImg = freezed,
    Object? vehicleBackPhotoImg = freezed,
    Object? dsScalePhotoImg = freezed,
  }) {
    return _then(_$GateExitImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: freezed == docStatus
          ? _value.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      idx: freezed == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int?,
      salesInvoice: freezed == salesInvoice
          ? _value.salesInvoice
          : salesInvoice // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNo: freezed == vehicleNo
          ? _value.vehicleNo
          : vehicleNo // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePhoto: freezed == vehiclePhoto
          ? _value.vehiclePhoto
          : vehiclePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      gateExitDate: freezed == gateExitDate
          ? _value.gateExitDate
          : gateExitDate // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleBackPhoto: freezed == vehicleBackPhoto
          ? _value.vehicleBackPhoto
          : vehicleBackPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      amendedFrom: freezed == amendedFrom
          ? _value.amendedFrom
          : amendedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      gateExitTime: freezed == gateExitTime
          ? _value.gateExitTime
          : gateExitTime // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      dsScalePhoto: freezed == dsScalePhoto
          ? _value.dsScalePhoto
          : dsScalePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePhotoImg: freezed == vehiclePhotoImg
          ? _value.vehiclePhotoImg
          : vehiclePhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      vehicleBackPhotoImg: freezed == vehicleBackPhotoImg
          ? _value.vehicleBackPhotoImg
          : vehicleBackPhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      dsScalePhotoImg: freezed == dsScalePhotoImg
          ? _value.dsScalePhotoImg
          : dsScalePhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GateExitImpl implements _GateExit {
  const _$GateExitImpl(
      {this.status,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'owner') this.owner,
      @JsonKey(name: 'creation', defaultValue: '') this.creationDate,
      @JsonKey(name: 'docstatus') this.docStatus,
      @JsonKey(name: 'modified') this.modifiedDate,
      @JsonKey(name: 'modified_by') this.modifiedBy,
      @JsonKey(name: 'idx') this.idx,
      @JsonKey(name: 'sales_invoice') this.salesInvoice,
      @JsonKey(name: 'vehicle_no') this.vehicleNo,
      @JsonKey(name: 'vehicle_photo') this.vehiclePhoto,
      @JsonKey(name: 'gate_exit_date') this.gateExitDate,
      @JsonKey(name: 'vehicle_back_photo') this.vehicleBackPhoto,
      @JsonKey(name: 'remarks') this.remarks,
      @JsonKey(name: 'amended_from') this.amendedFrom,
      @JsonKey(name: 'quantity') this.quantity,
      @JsonKey(name: 'custom_gate_exit_time') this.gateExitTime,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'custom_customer_name') this.customerName,
      @JsonKey(name: 'dcsales_invoice_photo') this.dsScalePhoto,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.vehiclePhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.vehicleBackPhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.dsScalePhotoImg});

  factory _$GateExitImpl.fromJson(Map<String, dynamic> json) =>
      _$$GateExitImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'owner')
  final String? owner;
  @override
  @JsonKey(name: 'creation', defaultValue: '')
  final String? creationDate;
  @override
  @JsonKey(name: 'docstatus')
  final int? docStatus;
  @override
  @JsonKey(name: 'modified')
  final String? modifiedDate;
  @override
  @JsonKey(name: 'modified_by')
  final String? modifiedBy;
  @override
  @JsonKey(name: 'idx')
  final int? idx;
  @override
  @JsonKey(name: 'sales_invoice')
  final String? salesInvoice;
  @override
  @JsonKey(name: 'vehicle_no')
  final String? vehicleNo;
  @override
  @JsonKey(name: 'vehicle_photo')
  final String? vehiclePhoto;
  @override
  @JsonKey(name: 'gate_exit_date')
  final String? gateExitDate;
  @override
  @JsonKey(name: 'vehicle_back_photo')
  final String? vehicleBackPhoto;
  @override
  @JsonKey(name: 'remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'amended_from')
  final String? amendedFrom;
  @override
  @JsonKey(name: 'quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'custom_gate_exit_time')
  final String? gateExitTime;
  @override
  @JsonKey(name: 'amount')
  final int? amount;
  @override
  @JsonKey(name: 'custom_customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'dcsales_invoice_photo')
  final String? dsScalePhoto;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? vehiclePhotoImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? vehicleBackPhotoImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? dsScalePhotoImg;

  @override
  String toString() {
    return 'GateExit(status: $status, name: $name, owner: $owner, creationDate: $creationDate, docStatus: $docStatus, modifiedDate: $modifiedDate, modifiedBy: $modifiedBy, idx: $idx, salesInvoice: $salesInvoice, vehicleNo: $vehicleNo, vehiclePhoto: $vehiclePhoto, gateExitDate: $gateExitDate, vehicleBackPhoto: $vehicleBackPhoto, remarks: $remarks, amendedFrom: $amendedFrom, quantity: $quantity, gateExitTime: $gateExitTime, amount: $amount, customerName: $customerName, dsScalePhoto: $dsScalePhoto, vehiclePhotoImg: $vehiclePhotoImg, vehicleBackPhotoImg: $vehicleBackPhotoImg, dsScalePhotoImg: $dsScalePhotoImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GateExitImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.docStatus, docStatus) ||
                other.docStatus == docStatus) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.salesInvoice, salesInvoice) ||
                other.salesInvoice == salesInvoice) &&
            (identical(other.vehicleNo, vehicleNo) ||
                other.vehicleNo == vehicleNo) &&
            (identical(other.vehiclePhoto, vehiclePhoto) ||
                other.vehiclePhoto == vehiclePhoto) &&
            (identical(other.gateExitDate, gateExitDate) ||
                other.gateExitDate == gateExitDate) &&
            (identical(other.vehicleBackPhoto, vehicleBackPhoto) ||
                other.vehicleBackPhoto == vehicleBackPhoto) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.amendedFrom, amendedFrom) ||
                other.amendedFrom == amendedFrom) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.gateExitTime, gateExitTime) ||
                other.gateExitTime == gateExitTime) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.dsScalePhoto, dsScalePhoto) ||
                other.dsScalePhoto == dsScalePhoto) &&
            (identical(other.vehiclePhotoImg, vehiclePhotoImg) ||
                other.vehiclePhotoImg == vehiclePhotoImg) &&
            (identical(other.vehicleBackPhotoImg, vehicleBackPhotoImg) ||
                other.vehicleBackPhotoImg == vehicleBackPhotoImg) &&
            (identical(other.dsScalePhotoImg, dsScalePhotoImg) ||
                other.dsScalePhotoImg == dsScalePhotoImg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        name,
        owner,
        creationDate,
        docStatus,
        modifiedDate,
        modifiedBy,
        idx,
        salesInvoice,
        vehicleNo,
        vehiclePhoto,
        gateExitDate,
        vehicleBackPhoto,
        remarks,
        amendedFrom,
        quantity,
        gateExitTime,
        amount,
        customerName,
        dsScalePhoto,
        vehiclePhotoImg,
        vehicleBackPhotoImg,
        dsScalePhotoImg
      ]);

  /// Create a copy of GateExit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GateExitImplCopyWith<_$GateExitImpl> get copyWith =>
      __$$GateExitImplCopyWithImpl<_$GateExitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GateExitImplToJson(
      this,
    );
  }
}

abstract class _GateExit implements GateExit {
  const factory _GateExit(
      {final String? status,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'owner') final String? owner,
      @JsonKey(name: 'creation', defaultValue: '') final String? creationDate,
      @JsonKey(name: 'docstatus') final int? docStatus,
      @JsonKey(name: 'modified') final String? modifiedDate,
      @JsonKey(name: 'modified_by') final String? modifiedBy,
      @JsonKey(name: 'idx') final int? idx,
      @JsonKey(name: 'sales_invoice') final String? salesInvoice,
      @JsonKey(name: 'vehicle_no') final String? vehicleNo,
      @JsonKey(name: 'vehicle_photo') final String? vehiclePhoto,
      @JsonKey(name: 'gate_exit_date') final String? gateExitDate,
      @JsonKey(name: 'vehicle_back_photo') final String? vehicleBackPhoto,
      @JsonKey(name: 'remarks') final String? remarks,
      @JsonKey(name: 'amended_from') final String? amendedFrom,
      @JsonKey(name: 'quantity') final int? quantity,
      @JsonKey(name: 'custom_gate_exit_time') final String? gateExitTime,
      @JsonKey(name: 'amount') final int? amount,
      @JsonKey(name: 'custom_customer_name') final String? customerName,
      @JsonKey(name: 'dcsales_invoice_photo') final String? dsScalePhoto,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? vehiclePhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? vehicleBackPhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? dsScalePhotoImg}) = _$GateExitImpl;

  factory _GateExit.fromJson(Map<String, dynamic> json) =
      _$GateExitImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'owner')
  String? get owner;
  @override
  @JsonKey(name: 'creation', defaultValue: '')
  String? get creationDate;
  @override
  @JsonKey(name: 'docstatus')
  int? get docStatus;
  @override
  @JsonKey(name: 'modified')
  String? get modifiedDate;
  @override
  @JsonKey(name: 'modified_by')
  String? get modifiedBy;
  @override
  @JsonKey(name: 'idx')
  int? get idx;
  @override
  @JsonKey(name: 'sales_invoice')
  String? get salesInvoice;
  @override
  @JsonKey(name: 'vehicle_no')
  String? get vehicleNo;
  @override
  @JsonKey(name: 'vehicle_photo')
  String? get vehiclePhoto;
  @override
  @JsonKey(name: 'gate_exit_date')
  String? get gateExitDate;
  @override
  @JsonKey(name: 'vehicle_back_photo')
  String? get vehicleBackPhoto;
  @override
  @JsonKey(name: 'remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'amended_from')
  String? get amendedFrom;
  @override
  @JsonKey(name: 'quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'custom_gate_exit_time')
  String? get gateExitTime;
  @override
  @JsonKey(name: 'amount')
  int? get amount;
  @override
  @JsonKey(name: 'custom_customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'dcsales_invoice_photo')
  String? get dsScalePhoto;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehiclePhotoImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehicleBackPhotoImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get dsScalePhotoImg;

  /// Create a copy of GateExit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GateExitImplCopyWith<_$GateExitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
