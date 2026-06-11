// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmployeeList _$EmployeeListFromJson(Map<String, dynamic> json) {
  return _EmployeeList.fromJson(json);
}

/// @nodoc
mixin _$EmployeeList {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_name')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'department')
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'company')
  String? get company => throw _privateConstructorUsedError;
  @JsonKey(name: 'reports_to')
  String? get reportsTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_reports_to_name')
  String? get reportsToName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeListCopyWith<EmployeeList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeListCopyWith<$Res> {
  factory $EmployeeListCopyWith(
          EmployeeList value, $Res Function(EmployeeList) then) =
      _$EmployeeListCopyWithImpl<$Res, EmployeeList>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'employee_name') String? employeeName,
      @JsonKey(name: 'department') String? department,
      @JsonKey(name: 'company') String? company,
      @JsonKey(name: 'reports_to') String? reportsTo,
      @JsonKey(name: 'custom_reports_to_name') String? reportsToName});
}

/// @nodoc
class _$EmployeeListCopyWithImpl<$Res, $Val extends EmployeeList>
    implements $EmployeeListCopyWith<$Res> {
  _$EmployeeListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? employeeName = freezed,
    Object? department = freezed,
    Object? company = freezed,
    Object? reportsTo = freezed,
    Object? reportsToName = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      reportsTo: freezed == reportsTo
          ? _value.reportsTo
          : reportsTo // ignore: cast_nullable_to_non_nullable
              as String?,
      reportsToName: freezed == reportsToName
          ? _value.reportsToName
          : reportsToName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeListImplCopyWith<$Res>
    implements $EmployeeListCopyWith<$Res> {
  factory _$$EmployeeListImplCopyWith(
          _$EmployeeListImpl value, $Res Function(_$EmployeeListImpl) then) =
      __$$EmployeeListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'employee_name') String? employeeName,
      @JsonKey(name: 'department') String? department,
      @JsonKey(name: 'company') String? company,
      @JsonKey(name: 'reports_to') String? reportsTo,
      @JsonKey(name: 'custom_reports_to_name') String? reportsToName});
}

/// @nodoc
class __$$EmployeeListImplCopyWithImpl<$Res>
    extends _$EmployeeListCopyWithImpl<$Res, _$EmployeeListImpl>
    implements _$$EmployeeListImplCopyWith<$Res> {
  __$$EmployeeListImplCopyWithImpl(
      _$EmployeeListImpl _value, $Res Function(_$EmployeeListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? employeeName = freezed,
    Object? department = freezed,
    Object? company = freezed,
    Object? reportsTo = freezed,
    Object? reportsToName = freezed,
  }) {
    return _then(_$EmployeeListImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      reportsTo: freezed == reportsTo
          ? _value.reportsTo
          : reportsTo // ignore: cast_nullable_to_non_nullable
              as String?,
      reportsToName: freezed == reportsToName
          ? _value.reportsToName
          : reportsToName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeListImpl implements _EmployeeList {
  const _$EmployeeListImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'employee_name') this.employeeName,
      @JsonKey(name: 'department') this.department,
      @JsonKey(name: 'company') this.company,
      @JsonKey(name: 'reports_to') this.reportsTo,
      @JsonKey(name: 'custom_reports_to_name') this.reportsToName});

  factory _$EmployeeListImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeListImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'employee_name')
  final String? employeeName;
  @override
  @JsonKey(name: 'department')
  final String? department;
  @override
  @JsonKey(name: 'company')
  final String? company;
  @override
  @JsonKey(name: 'reports_to')
  final String? reportsTo;
  @override
  @JsonKey(name: 'custom_reports_to_name')
  final String? reportsToName;

  @override
  String toString() {
    return 'EmployeeList(name: $name, employeeName: $employeeName, department: $department, company: $company, reportsTo: $reportsTo, reportsToName: $reportsToName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeListImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.reportsTo, reportsTo) ||
                other.reportsTo == reportsTo) &&
            (identical(other.reportsToName, reportsToName) ||
                other.reportsToName == reportsToName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, employeeName, department,
      company, reportsTo, reportsToName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeListImplCopyWith<_$EmployeeListImpl> get copyWith =>
      __$$EmployeeListImplCopyWithImpl<_$EmployeeListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeListImplToJson(
      this,
    );
  }
}

abstract class _EmployeeList implements EmployeeList {
  const factory _EmployeeList(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'employee_name') final String? employeeName,
      @JsonKey(name: 'department') final String? department,
      @JsonKey(name: 'company') final String? company,
      @JsonKey(name: 'reports_to') final String? reportsTo,
      @JsonKey(name: 'custom_reports_to_name')
      final String? reportsToName}) = _$EmployeeListImpl;

  factory _EmployeeList.fromJson(Map<String, dynamic> json) =
      _$EmployeeListImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'employee_name')
  String? get employeeName;
  @override
  @JsonKey(name: 'department')
  String? get department;
  @override
  @JsonKey(name: 'company')
  String? get company;
  @override
  @JsonKey(name: 'reports_to')
  String? get reportsTo;
  @override
  @JsonKey(name: 'custom_reports_to_name')
  String? get reportsToName;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeListImplCopyWith<_$EmployeeListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
