// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reason_exit_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReasonExitType _$ReasonExitTypeFromJson(Map<String, dynamic> json) {
  return _ReasonExitType.fromJson(json);
}

/// @nodoc
mixin _$ReasonExitType {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason_of_gate_exit_types')
  String? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReasonExitTypeCopyWith<ReasonExitType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReasonExitTypeCopyWith<$Res> {
  factory $ReasonExitTypeCopyWith(
          ReasonExitType value, $Res Function(ReasonExitType) then) =
      _$ReasonExitTypeCopyWithImpl<$Res, ReasonExitType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'reason_of_gate_exit_types') String? reason});
}

/// @nodoc
class _$ReasonExitTypeCopyWithImpl<$Res, $Val extends ReasonExitType>
    implements $ReasonExitTypeCopyWith<$Res> {
  _$ReasonExitTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReasonExitTypeImplCopyWith<$Res>
    implements $ReasonExitTypeCopyWith<$Res> {
  factory _$$ReasonExitTypeImplCopyWith(_$ReasonExitTypeImpl value,
          $Res Function(_$ReasonExitTypeImpl) then) =
      __$$ReasonExitTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'reason_of_gate_exit_types') String? reason});
}

/// @nodoc
class __$$ReasonExitTypeImplCopyWithImpl<$Res>
    extends _$ReasonExitTypeCopyWithImpl<$Res, _$ReasonExitTypeImpl>
    implements _$$ReasonExitTypeImplCopyWith<$Res> {
  __$$ReasonExitTypeImplCopyWithImpl(
      _$ReasonExitTypeImpl _value, $Res Function(_$ReasonExitTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$ReasonExitTypeImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReasonExitTypeImpl implements _ReasonExitType {
  const _$ReasonExitTypeImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'reason_of_gate_exit_types') this.reason});

  factory _$ReasonExitTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReasonExitTypeImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'reason_of_gate_exit_types')
  final String? reason;

  @override
  String toString() {
    return 'ReasonExitType(name: $name, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReasonExitTypeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReasonExitTypeImplCopyWith<_$ReasonExitTypeImpl> get copyWith =>
      __$$ReasonExitTypeImplCopyWithImpl<_$ReasonExitTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReasonExitTypeImplToJson(
      this,
    );
  }
}

abstract class _ReasonExitType implements ReasonExitType {
  const factory _ReasonExitType(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'reason_of_gate_exit_types') final String? reason}) =
      _$ReasonExitTypeImpl;

  factory _ReasonExitType.fromJson(Map<String, dynamic> json) =
      _$ReasonExitTypeImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'reason_of_gate_exit_types')
  String? get reason;
  @override
  @JsonKey(ignore: true)
  _$$ReasonExitTypeImplCopyWith<_$ReasonExitTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
