// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseOrderForm _$PurchaseOrderFormFromJson(Map<String, dynamic> json) {
  return _PurchaseOrderForm.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderForm {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'workflow_state')
  String? get workFlowState => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String? get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_date', defaultValue: '')
  String? get scheduleDate => throw _privateConstructorUsedError;

  /// Serializes this PurchaseOrderForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderFormCopyWith<PurchaseOrderForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderFormCopyWith<$Res> {
  factory $PurchaseOrderFormCopyWith(
          PurchaseOrderForm value, $Res Function(PurchaseOrderForm) then) =
      _$PurchaseOrderFormCopyWithImpl<$Res, PurchaseOrderForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'workflow_state') String? workFlowState,
      @JsonKey(name: 'supplier_name') String? supplierName,
      @JsonKey(name: 'schedule_date', defaultValue: '') String? scheduleDate});
}

/// @nodoc
class _$PurchaseOrderFormCopyWithImpl<$Res, $Val extends PurchaseOrderForm>
    implements $PurchaseOrderFormCopyWith<$Res> {
  _$PurchaseOrderFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? workFlowState = freezed,
    Object? supplierName = freezed,
    Object? scheduleDate = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      workFlowState: freezed == workFlowState
          ? _value.workFlowState
          : workFlowState // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleDate: freezed == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseOrderFormImplCopyWith<$Res>
    implements $PurchaseOrderFormCopyWith<$Res> {
  factory _$$PurchaseOrderFormImplCopyWith(_$PurchaseOrderFormImpl value,
          $Res Function(_$PurchaseOrderFormImpl) then) =
      __$$PurchaseOrderFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'workflow_state') String? workFlowState,
      @JsonKey(name: 'supplier_name') String? supplierName,
      @JsonKey(name: 'schedule_date', defaultValue: '') String? scheduleDate});
}

/// @nodoc
class __$$PurchaseOrderFormImplCopyWithImpl<$Res>
    extends _$PurchaseOrderFormCopyWithImpl<$Res, _$PurchaseOrderFormImpl>
    implements _$$PurchaseOrderFormImplCopyWith<$Res> {
  __$$PurchaseOrderFormImplCopyWithImpl(_$PurchaseOrderFormImpl _value,
      $Res Function(_$PurchaseOrderFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? workFlowState = freezed,
    Object? supplierName = freezed,
    Object? scheduleDate = freezed,
  }) {
    return _then(_$PurchaseOrderFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      workFlowState: freezed == workFlowState
          ? _value.workFlowState
          : workFlowState // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleDate: freezed == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderFormImpl implements _PurchaseOrderForm {
  const _$PurchaseOrderFormImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'workflow_state') this.workFlowState,
      @JsonKey(name: 'supplier_name') this.supplierName,
      @JsonKey(name: 'schedule_date', defaultValue: '') this.scheduleDate});

  factory _$PurchaseOrderFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'workflow_state')
  final String? workFlowState;
  @override
  @JsonKey(name: 'supplier_name')
  final String? supplierName;
  @override
  @JsonKey(name: 'schedule_date', defaultValue: '')
  final String? scheduleDate;

  @override
  String toString() {
    return 'PurchaseOrderForm(name: $name, workFlowState: $workFlowState, supplierName: $supplierName, scheduleDate: $scheduleDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.workFlowState, workFlowState) ||
                other.workFlowState == workFlowState) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.scheduleDate, scheduleDate) ||
                other.scheduleDate == scheduleDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, workFlowState, supplierName, scheduleDate);

  /// Create a copy of PurchaseOrderForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderFormImplCopyWith<_$PurchaseOrderFormImpl> get copyWith =>
      __$$PurchaseOrderFormImplCopyWithImpl<_$PurchaseOrderFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderFormImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderForm implements PurchaseOrderForm {
  const factory _PurchaseOrderForm(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'workflow_state') final String? workFlowState,
      @JsonKey(name: 'supplier_name') final String? supplierName,
      @JsonKey(name: 'schedule_date', defaultValue: '')
      final String? scheduleDate}) = _$PurchaseOrderFormImpl;

  factory _PurchaseOrderForm.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'workflow_state')
  String? get workFlowState;
  @override
  @JsonKey(name: 'supplier_name')
  String? get supplierName;
  @override
  @JsonKey(name: 'schedule_date', defaultValue: '')
  String? get scheduleDate;

  /// Create a copy of PurchaseOrderForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseOrderFormImplCopyWith<_$PurchaseOrderFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
