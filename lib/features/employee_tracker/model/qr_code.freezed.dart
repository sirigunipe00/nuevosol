// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QrCodeModel _$QrCodeModelFromJson(Map<String, dynamic> json) {
  return _QrCodeModel.fromJson(json);
}

/// @nodoc
mixin _$QrCodeModel {
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_pass_id')
  String? get gatePassId => throw _privateConstructorUsedError;
  @JsonKey(name: 'scan_no')
  int? get scanNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_scans')
  int? get totalScans => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity')
  String? get activity => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_date_time')
  String? get actualDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_min')
  int? get durationMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_photo')
  String? get employeePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed')
  bool? get completed => throw _privateConstructorUsedError;
  @JsonKey(name: 'workflow_state')
  String? get workflowState => throw _privateConstructorUsedError;

  /// Serializes this QrCodeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QrCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QrCodeModelCopyWith<QrCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrCodeModelCopyWith<$Res> {
  factory $QrCodeModelCopyWith(
          QrCodeModel value, $Res Function(QrCodeModel) then) =
      _$QrCodeModelCopyWithImpl<$Res, QrCodeModel>;
  @useResult
  $Res call(
      {String? message,
      @JsonKey(name: 'gate_pass_id') String? gatePassId,
      @JsonKey(name: 'scan_no') int? scanNo,
      @JsonKey(name: 'total_scans') int? totalScans,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'activity') String? activity,
      @JsonKey(name: 'actual_date_time') String? actualDateTime,
      @JsonKey(name: 'duration_min') int? durationMin,
      @JsonKey(name: 'employee_photo') String? employeePhoto,
      @JsonKey(name: 'completed') bool? completed,
      @JsonKey(name: 'workflow_state') String? workflowState});
}

/// @nodoc
class _$QrCodeModelCopyWithImpl<$Res, $Val extends QrCodeModel>
    implements $QrCodeModelCopyWith<$Res> {
  _$QrCodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? gatePassId = freezed,
    Object? scanNo = freezed,
    Object? totalScans = freezed,
    Object? location = freezed,
    Object? activity = freezed,
    Object? actualDateTime = freezed,
    Object? durationMin = freezed,
    Object? employeePhoto = freezed,
    Object? completed = freezed,
    Object? workflowState = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      gatePassId: freezed == gatePassId
          ? _value.gatePassId
          : gatePassId // ignore: cast_nullable_to_non_nullable
              as String?,
      scanNo: freezed == scanNo
          ? _value.scanNo
          : scanNo // ignore: cast_nullable_to_non_nullable
              as int?,
      totalScans: freezed == totalScans
          ? _value.totalScans
          : totalScans // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String?,
      actualDateTime: freezed == actualDateTime
          ? _value.actualDateTime
          : actualDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMin: freezed == durationMin
          ? _value.durationMin
          : durationMin // ignore: cast_nullable_to_non_nullable
              as int?,
      employeePhoto: freezed == employeePhoto
          ? _value.employeePhoto
          : employeePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
      workflowState: freezed == workflowState
          ? _value.workflowState
          : workflowState // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrCodeModelImplCopyWith<$Res>
    implements $QrCodeModelCopyWith<$Res> {
  factory _$$QrCodeModelImplCopyWith(
          _$QrCodeModelImpl value, $Res Function(_$QrCodeModelImpl) then) =
      __$$QrCodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message,
      @JsonKey(name: 'gate_pass_id') String? gatePassId,
      @JsonKey(name: 'scan_no') int? scanNo,
      @JsonKey(name: 'total_scans') int? totalScans,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'activity') String? activity,
      @JsonKey(name: 'actual_date_time') String? actualDateTime,
      @JsonKey(name: 'duration_min') int? durationMin,
      @JsonKey(name: 'employee_photo') String? employeePhoto,
      @JsonKey(name: 'completed') bool? completed,
      @JsonKey(name: 'workflow_state') String? workflowState});
}

/// @nodoc
class __$$QrCodeModelImplCopyWithImpl<$Res>
    extends _$QrCodeModelCopyWithImpl<$Res, _$QrCodeModelImpl>
    implements _$$QrCodeModelImplCopyWith<$Res> {
  __$$QrCodeModelImplCopyWithImpl(
      _$QrCodeModelImpl _value, $Res Function(_$QrCodeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? gatePassId = freezed,
    Object? scanNo = freezed,
    Object? totalScans = freezed,
    Object? location = freezed,
    Object? activity = freezed,
    Object? actualDateTime = freezed,
    Object? durationMin = freezed,
    Object? employeePhoto = freezed,
    Object? completed = freezed,
    Object? workflowState = freezed,
  }) {
    return _then(_$QrCodeModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      gatePassId: freezed == gatePassId
          ? _value.gatePassId
          : gatePassId // ignore: cast_nullable_to_non_nullable
              as String?,
      scanNo: freezed == scanNo
          ? _value.scanNo
          : scanNo // ignore: cast_nullable_to_non_nullable
              as int?,
      totalScans: freezed == totalScans
          ? _value.totalScans
          : totalScans // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String?,
      actualDateTime: freezed == actualDateTime
          ? _value.actualDateTime
          : actualDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      durationMin: freezed == durationMin
          ? _value.durationMin
          : durationMin // ignore: cast_nullable_to_non_nullable
              as int?,
      employeePhoto: freezed == employeePhoto
          ? _value.employeePhoto
          : employeePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
      workflowState: freezed == workflowState
          ? _value.workflowState
          : workflowState // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrCodeModelImpl implements _QrCodeModel {
  const _$QrCodeModelImpl(
      {this.message,
      @JsonKey(name: 'gate_pass_id') this.gatePassId,
      @JsonKey(name: 'scan_no') this.scanNo,
      @JsonKey(name: 'total_scans') this.totalScans,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'activity') this.activity,
      @JsonKey(name: 'actual_date_time') this.actualDateTime,
      @JsonKey(name: 'duration_min') this.durationMin,
      @JsonKey(name: 'employee_photo') this.employeePhoto,
      @JsonKey(name: 'completed') this.completed,
      @JsonKey(name: 'workflow_state') this.workflowState});

  factory _$QrCodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrCodeModelImplFromJson(json);

  @override
  final String? message;
  @override
  @JsonKey(name: 'gate_pass_id')
  final String? gatePassId;
  @override
  @JsonKey(name: 'scan_no')
  final int? scanNo;
  @override
  @JsonKey(name: 'total_scans')
  final int? totalScans;
  @override
  @JsonKey(name: 'location')
  final String? location;
  @override
  @JsonKey(name: 'activity')
  final String? activity;
  @override
  @JsonKey(name: 'actual_date_time')
  final String? actualDateTime;
  @override
  @JsonKey(name: 'duration_min')
  final int? durationMin;
  @override
  @JsonKey(name: 'employee_photo')
  final String? employeePhoto;
  @override
  @JsonKey(name: 'completed')
  final bool? completed;
  @override
  @JsonKey(name: 'workflow_state')
  final String? workflowState;

  @override
  String toString() {
    return 'QrCodeModel(message: $message, gatePassId: $gatePassId, scanNo: $scanNo, totalScans: $totalScans, location: $location, activity: $activity, actualDateTime: $actualDateTime, durationMin: $durationMin, employeePhoto: $employeePhoto, completed: $completed, workflowState: $workflowState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrCodeModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.gatePassId, gatePassId) ||
                other.gatePassId == gatePassId) &&
            (identical(other.scanNo, scanNo) || other.scanNo == scanNo) &&
            (identical(other.totalScans, totalScans) ||
                other.totalScans == totalScans) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.actualDateTime, actualDateTime) ||
                other.actualDateTime == actualDateTime) &&
            (identical(other.durationMin, durationMin) ||
                other.durationMin == durationMin) &&
            (identical(other.employeePhoto, employeePhoto) ||
                other.employeePhoto == employeePhoto) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.workflowState, workflowState) ||
                other.workflowState == workflowState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      gatePassId,
      scanNo,
      totalScans,
      location,
      activity,
      actualDateTime,
      durationMin,
      employeePhoto,
      completed,
      workflowState);

  /// Create a copy of QrCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrCodeModelImplCopyWith<_$QrCodeModelImpl> get copyWith =>
      __$$QrCodeModelImplCopyWithImpl<_$QrCodeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrCodeModelImplToJson(
      this,
    );
  }
}

abstract class _QrCodeModel implements QrCodeModel {
  const factory _QrCodeModel(
          {final String? message,
          @JsonKey(name: 'gate_pass_id') final String? gatePassId,
          @JsonKey(name: 'scan_no') final int? scanNo,
          @JsonKey(name: 'total_scans') final int? totalScans,
          @JsonKey(name: 'location') final String? location,
          @JsonKey(name: 'activity') final String? activity,
          @JsonKey(name: 'actual_date_time') final String? actualDateTime,
          @JsonKey(name: 'duration_min') final int? durationMin,
          @JsonKey(name: 'employee_photo') final String? employeePhoto,
          @JsonKey(name: 'completed') final bool? completed,
          @JsonKey(name: 'workflow_state') final String? workflowState}) =
      _$QrCodeModelImpl;

  factory _QrCodeModel.fromJson(Map<String, dynamic> json) =
      _$QrCodeModelImpl.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(name: 'gate_pass_id')
  String? get gatePassId;
  @override
  @JsonKey(name: 'scan_no')
  int? get scanNo;
  @override
  @JsonKey(name: 'total_scans')
  int? get totalScans;
  @override
  @JsonKey(name: 'location')
  String? get location;
  @override
  @JsonKey(name: 'activity')
  String? get activity;
  @override
  @JsonKey(name: 'actual_date_time')
  String? get actualDateTime;
  @override
  @JsonKey(name: 'duration_min')
  int? get durationMin;
  @override
  @JsonKey(name: 'employee_photo')
  String? get employeePhoto;
  @override
  @JsonKey(name: 'completed')
  bool? get completed;
  @override
  @JsonKey(name: 'workflow_state')
  String? get workflowState;

  /// Create a copy of QrCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrCodeModelImplCopyWith<_$QrCodeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
