// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationList _$LocationListFromJson(Map<String, dynamic> json) {
  return _LocationList.fromJson(json);
}

/// @nodoc
mixin _$LocationList {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_name')
  String? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationListCopyWith<LocationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationListCopyWith<$Res> {
  factory $LocationListCopyWith(
          LocationList value, $Res Function(LocationList) then) =
      _$LocationListCopyWithImpl<$Res, LocationList>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'location_name') String? location});
}

/// @nodoc
class _$LocationListCopyWithImpl<$Res, $Val extends LocationList>
    implements $LocationListCopyWith<$Res> {
  _$LocationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationListImplCopyWith<$Res>
    implements $LocationListCopyWith<$Res> {
  factory _$$LocationListImplCopyWith(
          _$LocationListImpl value, $Res Function(_$LocationListImpl) then) =
      __$$LocationListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'location_name') String? location});
}

/// @nodoc
class __$$LocationListImplCopyWithImpl<$Res>
    extends _$LocationListCopyWithImpl<$Res, _$LocationListImpl>
    implements _$$LocationListImplCopyWith<$Res> {
  __$$LocationListImplCopyWithImpl(
      _$LocationListImpl _value, $Res Function(_$LocationListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? location = freezed,
  }) {
    return _then(_$LocationListImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationListImpl implements _LocationList {
  const _$LocationListImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'location_name') this.location});

  factory _$LocationListImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationListImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'location_name')
  final String? location;

  @override
  String toString() {
    return 'LocationList(name: $name, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationListImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationListImplCopyWith<_$LocationListImpl> get copyWith =>
      __$$LocationListImplCopyWithImpl<_$LocationListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationListImplToJson(
      this,
    );
  }
}

abstract class _LocationList implements LocationList {
  const factory _LocationList(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'location_name') final String? location}) =
      _$LocationListImpl;

  factory _LocationList.fromJson(Map<String, dynamic> json) =
      _$LocationListImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'location_name')
  String? get location;
  @override
  @JsonKey(ignore: true)
  _$$LocationListImplCopyWith<_$LocationListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
