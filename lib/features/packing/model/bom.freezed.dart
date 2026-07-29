// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bom _$BomFromJson(Map<String, dynamic> json) {
  return _Bom.fromJson(json);
}

/// @nodoc
mixin _$Bom {
  @JsonKey(name: 'name')
  String? get bomName => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  double? get bomqty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BomCopyWith<Bom> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BomCopyWith<$Res> {
  factory $BomCopyWith(Bom value, $Res Function(Bom) then) =
      _$BomCopyWithImpl<$Res, Bom>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? bomName,
      @JsonKey(name: 'quantity') double? bomqty});
}

/// @nodoc
class _$BomCopyWithImpl<$Res, $Val extends Bom> implements $BomCopyWith<$Res> {
  _$BomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bomName = freezed,
    Object? bomqty = freezed,
  }) {
    return _then(_value.copyWith(
      bomName: freezed == bomName
          ? _value.bomName
          : bomName // ignore: cast_nullable_to_non_nullable
              as String?,
      bomqty: freezed == bomqty
          ? _value.bomqty
          : bomqty // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BomImplCopyWith<$Res> implements $BomCopyWith<$Res> {
  factory _$$BomImplCopyWith(_$BomImpl value, $Res Function(_$BomImpl) then) =
      __$$BomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? bomName,
      @JsonKey(name: 'quantity') double? bomqty});
}

/// @nodoc
class __$$BomImplCopyWithImpl<$Res> extends _$BomCopyWithImpl<$Res, _$BomImpl>
    implements _$$BomImplCopyWith<$Res> {
  __$$BomImplCopyWithImpl(_$BomImpl _value, $Res Function(_$BomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bomName = freezed,
    Object? bomqty = freezed,
  }) {
    return _then(_$BomImpl(
      bomName: freezed == bomName
          ? _value.bomName
          : bomName // ignore: cast_nullable_to_non_nullable
              as String?,
      bomqty: freezed == bomqty
          ? _value.bomqty
          : bomqty // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BomImpl implements _Bom {
  const _$BomImpl(
      {@JsonKey(name: 'name') this.bomName,
      @JsonKey(name: 'quantity') this.bomqty});

  factory _$BomImpl.fromJson(Map<String, dynamic> json) =>
      _$$BomImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? bomName;
  @override
  @JsonKey(name: 'quantity')
  final double? bomqty;

  @override
  String toString() {
    return 'Bom(bomName: $bomName, bomqty: $bomqty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BomImpl &&
            (identical(other.bomName, bomName) || other.bomName == bomName) &&
            (identical(other.bomqty, bomqty) || other.bomqty == bomqty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bomName, bomqty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BomImplCopyWith<_$BomImpl> get copyWith =>
      __$$BomImplCopyWithImpl<_$BomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BomImplToJson(
      this,
    );
  }
}

abstract class _Bom implements Bom {
  const factory _Bom(
      {@JsonKey(name: 'name') final String? bomName,
      @JsonKey(name: 'quantity') final double? bomqty}) = _$BomImpl;

  factory _Bom.fromJson(Map<String, dynamic> json) = _$BomImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get bomName;
  @override
  @JsonKey(name: 'quantity')
  double? get bomqty;
  @override
  @JsonKey(ignore: true)
  _$$BomImplCopyWith<_$BomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
