// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Operator _$OperatorFromJson(Map<String, dynamic> json) {
  return _Operator.fromJson(json);
}

/// @nodoc
mixin _$Operator {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'operator_name')
  String? get operatorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'operator_username')
  String? get operatorUserName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperatorCopyWith<Operator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperatorCopyWith<$Res> {
  factory $OperatorCopyWith(Operator value, $Res Function(Operator) then) =
      _$OperatorCopyWithImpl<$Res, Operator>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'operator_name') String? operatorName,
      @JsonKey(name: 'operator_username') String? operatorUserName});
}

/// @nodoc
class _$OperatorCopyWithImpl<$Res, $Val extends Operator>
    implements $OperatorCopyWith<$Res> {
  _$OperatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? operatorName = freezed,
    Object? operatorUserName = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      operatorName: freezed == operatorName
          ? _value.operatorName
          : operatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      operatorUserName: freezed == operatorUserName
          ? _value.operatorUserName
          : operatorUserName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperatorImplCopyWith<$Res>
    implements $OperatorCopyWith<$Res> {
  factory _$$OperatorImplCopyWith(
          _$OperatorImpl value, $Res Function(_$OperatorImpl) then) =
      __$$OperatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'operator_name') String? operatorName,
      @JsonKey(name: 'operator_username') String? operatorUserName});
}

/// @nodoc
class __$$OperatorImplCopyWithImpl<$Res>
    extends _$OperatorCopyWithImpl<$Res, _$OperatorImpl>
    implements _$$OperatorImplCopyWith<$Res> {
  __$$OperatorImplCopyWithImpl(
      _$OperatorImpl _value, $Res Function(_$OperatorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? operatorName = freezed,
    Object? operatorUserName = freezed,
  }) {
    return _then(_$OperatorImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      operatorName: freezed == operatorName
          ? _value.operatorName
          : operatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      operatorUserName: freezed == operatorUserName
          ? _value.operatorUserName
          : operatorUserName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperatorImpl implements _Operator {
  const _$OperatorImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'operator_name') this.operatorName,
      @JsonKey(name: 'operator_username') this.operatorUserName});

  factory _$OperatorImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperatorImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'operator_name')
  final String? operatorName;
  @override
  @JsonKey(name: 'operator_username')
  final String? operatorUserName;

  @override
  String toString() {
    return 'Operator(name: $name, operatorName: $operatorName, operatorUserName: $operatorUserName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperatorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.operatorName, operatorName) ||
                other.operatorName == operatorName) &&
            (identical(other.operatorUserName, operatorUserName) ||
                other.operatorUserName == operatorUserName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, operatorName, operatorUserName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OperatorImplCopyWith<_$OperatorImpl> get copyWith =>
      __$$OperatorImplCopyWithImpl<_$OperatorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperatorImplToJson(
      this,
    );
  }
}

abstract class _Operator implements Operator {
  const factory _Operator(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'operator_name') final String? operatorName,
          @JsonKey(name: 'operator_username') final String? operatorUserName}) =
      _$OperatorImpl;

  factory _Operator.fromJson(Map<String, dynamic> json) =
      _$OperatorImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'operator_name')
  String? get operatorName;
  @override
  @JsonKey(name: 'operator_username')
  String? get operatorUserName;
  @override
  @JsonKey(ignore: true)
  _$$OperatorImplCopyWith<_$OperatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
