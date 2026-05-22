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

  /// Serializes this EmployeeList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @JsonKey(name: 'employee_name') String? employeeName});
}

/// @nodoc
class _$EmployeeListCopyWithImpl<$Res, $Val extends EmployeeList>
    implements $EmployeeListCopyWith<$Res> {
  _$EmployeeListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? employeeName = freezed,
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
      @JsonKey(name: 'employee_name') String? employeeName});
}

/// @nodoc
class __$$EmployeeListImplCopyWithImpl<$Res>
    extends _$EmployeeListCopyWithImpl<$Res, _$EmployeeListImpl>
    implements _$$EmployeeListImplCopyWith<$Res> {
  __$$EmployeeListImplCopyWithImpl(
      _$EmployeeListImpl _value, $Res Function(_$EmployeeListImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? employeeName = freezed,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeListImpl implements _EmployeeList {
  const _$EmployeeListImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'employee_name') this.employeeName});

  factory _$EmployeeListImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeListImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'employee_name')
  final String? employeeName;

  @override
  String toString() {
    return 'EmployeeList(name: $name, employeeName: $employeeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeListImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, employeeName);

  /// Create a copy of EmployeeList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
          @JsonKey(name: 'employee_name') final String? employeeName}) =
      _$EmployeeListImpl;

  factory _EmployeeList.fromJson(Map<String, dynamic> json) =
      _$EmployeeListImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'employee_name')
  String? get employeeName;

  /// Create a copy of EmployeeList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeListImplCopyWith<_$EmployeeListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
