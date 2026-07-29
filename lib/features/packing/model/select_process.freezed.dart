// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_process.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectProcess _$SelectProcessFromJson(Map<String, dynamic> json) {
  return _SelectProcess.fromJson(json);
}

/// @nodoc
mixin _$SelectProcess {
  @JsonKey(name: 'name')
  String? get processName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectProcessCopyWith<SelectProcess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectProcessCopyWith<$Res> {
  factory $SelectProcessCopyWith(
          SelectProcess value, $Res Function(SelectProcess) then) =
      _$SelectProcessCopyWithImpl<$Res, SelectProcess>;
  @useResult
  $Res call({@JsonKey(name: 'name') String? processName});
}

/// @nodoc
class _$SelectProcessCopyWithImpl<$Res, $Val extends SelectProcess>
    implements $SelectProcessCopyWith<$Res> {
  _$SelectProcessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processName = freezed,
  }) {
    return _then(_value.copyWith(
      processName: freezed == processName
          ? _value.processName
          : processName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectProcessImplCopyWith<$Res>
    implements $SelectProcessCopyWith<$Res> {
  factory _$$SelectProcessImplCopyWith(
          _$SelectProcessImpl value, $Res Function(_$SelectProcessImpl) then) =
      __$$SelectProcessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name') String? processName});
}

/// @nodoc
class __$$SelectProcessImplCopyWithImpl<$Res>
    extends _$SelectProcessCopyWithImpl<$Res, _$SelectProcessImpl>
    implements _$$SelectProcessImplCopyWith<$Res> {
  __$$SelectProcessImplCopyWithImpl(
      _$SelectProcessImpl _value, $Res Function(_$SelectProcessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processName = freezed,
  }) {
    return _then(_$SelectProcessImpl(
      processName: freezed == processName
          ? _value.processName
          : processName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectProcessImpl implements _SelectProcess {
  const _$SelectProcessImpl({@JsonKey(name: 'name') this.processName});

  factory _$SelectProcessImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectProcessImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? processName;

  @override
  String toString() {
    return 'SelectProcess(processName: $processName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectProcessImpl &&
            (identical(other.processName, processName) ||
                other.processName == processName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, processName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectProcessImplCopyWith<_$SelectProcessImpl> get copyWith =>
      __$$SelectProcessImplCopyWithImpl<_$SelectProcessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectProcessImplToJson(
      this,
    );
  }
}

abstract class _SelectProcess implements SelectProcess {
  const factory _SelectProcess(
      {@JsonKey(name: 'name') final String? processName}) = _$SelectProcessImpl;

  factory _SelectProcess.fromJson(Map<String, dynamic> json) =
      _$SelectProcessImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get processName;
  @override
  @JsonKey(ignore: true)
  _$$SelectProcessImplCopyWith<_$SelectProcessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
