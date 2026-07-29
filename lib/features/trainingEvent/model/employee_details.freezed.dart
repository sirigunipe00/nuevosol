// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmployeeDetails _$EmployeeDetailsFromJson(Map<String, dynamic> json) {
  return _EmployeeDetails.fromJson(json);
}

/// @nodoc
mixin _$EmployeeDetails {
  @JsonKey(name: 'employee')
  String? get employee => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_name')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'department')
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance')
  String? get attendance => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_mandatory')
  int? get isMandatory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeDetailsCopyWith<EmployeeDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeDetailsCopyWith<$Res> {
  factory $EmployeeDetailsCopyWith(
          EmployeeDetails value, $Res Function(EmployeeDetails) then) =
      _$EmployeeDetailsCopyWithImpl<$Res, EmployeeDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'employee') String? employee,
      @JsonKey(name: 'employee_name') String? employeeName,
      @JsonKey(name: 'department') String? department,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'attendance') String? attendance,
      @JsonKey(name: 'is_mandatory') int? isMandatory});
}

/// @nodoc
class _$EmployeeDetailsCopyWithImpl<$Res, $Val extends EmployeeDetails>
    implements $EmployeeDetailsCopyWith<$Res> {
  _$EmployeeDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employee = freezed,
    Object? employeeName = freezed,
    Object? department = freezed,
    Object? status = freezed,
    Object? attendance = freezed,
    Object? isMandatory = freezed,
  }) {
    return _then(_value.copyWith(
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as String?,
      isMandatory: freezed == isMandatory
          ? _value.isMandatory
          : isMandatory // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeDetailsImplCopyWith<$Res>
    implements $EmployeeDetailsCopyWith<$Res> {
  factory _$$EmployeeDetailsImplCopyWith(_$EmployeeDetailsImpl value,
          $Res Function(_$EmployeeDetailsImpl) then) =
      __$$EmployeeDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'employee') String? employee,
      @JsonKey(name: 'employee_name') String? employeeName,
      @JsonKey(name: 'department') String? department,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'attendance') String? attendance,
      @JsonKey(name: 'is_mandatory') int? isMandatory});
}

/// @nodoc
class __$$EmployeeDetailsImplCopyWithImpl<$Res>
    extends _$EmployeeDetailsCopyWithImpl<$Res, _$EmployeeDetailsImpl>
    implements _$$EmployeeDetailsImplCopyWith<$Res> {
  __$$EmployeeDetailsImplCopyWithImpl(
      _$EmployeeDetailsImpl _value, $Res Function(_$EmployeeDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employee = freezed,
    Object? employeeName = freezed,
    Object? department = freezed,
    Object? status = freezed,
    Object? attendance = freezed,
    Object? isMandatory = freezed,
  }) {
    return _then(_$EmployeeDetailsImpl(
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as String?,
      isMandatory: freezed == isMandatory
          ? _value.isMandatory
          : isMandatory // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeDetailsImpl implements _EmployeeDetails {
  const _$EmployeeDetailsImpl(
      {@JsonKey(name: 'employee') this.employee,
      @JsonKey(name: 'employee_name') this.employeeName,
      @JsonKey(name: 'department') this.department,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'attendance') this.attendance,
      @JsonKey(name: 'is_mandatory') this.isMandatory});

  factory _$EmployeeDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'employee')
  final String? employee;
  @override
  @JsonKey(name: 'employee_name')
  final String? employeeName;
  @override
  @JsonKey(name: 'department')
  final String? department;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'attendance')
  final String? attendance;
  @override
  @JsonKey(name: 'is_mandatory')
  final int? isMandatory;

  @override
  String toString() {
    return 'EmployeeDetails(employee: $employee, employeeName: $employeeName, department: $department, status: $status, attendance: $attendance, isMandatory: $isMandatory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeDetailsImpl &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance) &&
            (identical(other.isMandatory, isMandatory) ||
                other.isMandatory == isMandatory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, employee, employeeName,
      department, status, attendance, isMandatory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeDetailsImplCopyWith<_$EmployeeDetailsImpl> get copyWith =>
      __$$EmployeeDetailsImplCopyWithImpl<_$EmployeeDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeDetailsImplToJson(
      this,
    );
  }
}

abstract class _EmployeeDetails implements EmployeeDetails {
  const factory _EmployeeDetails(
          {@JsonKey(name: 'employee') final String? employee,
          @JsonKey(name: 'employee_name') final String? employeeName,
          @JsonKey(name: 'department') final String? department,
          @JsonKey(name: 'status') final String? status,
          @JsonKey(name: 'attendance') final String? attendance,
          @JsonKey(name: 'is_mandatory') final int? isMandatory}) =
      _$EmployeeDetailsImpl;

  factory _EmployeeDetails.fromJson(Map<String, dynamic> json) =
      _$EmployeeDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'employee')
  String? get employee;
  @override
  @JsonKey(name: 'employee_name')
  String? get employeeName;
  @override
  @JsonKey(name: 'department')
  String? get department;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'attendance')
  String? get attendance;
  @override
  @JsonKey(name: 'is_mandatory')
  int? get isMandatory;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeDetailsImplCopyWith<_$EmployeeDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
