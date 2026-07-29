// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'machine_no.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MachineNo _$MachineNoFromJson(Map<String, dynamic> json) {
  return _MachineNo.fromJson(json);
}

/// @nodoc
mixin _$MachineNo {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation')
  String? get creation => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified')
  String? get modified => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_by')
  String? get modifiedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'docstatus')
  int? get docstatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MachineNoCopyWith<MachineNo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineNoCopyWith<$Res> {
  factory $MachineNoCopyWith(MachineNo value, $Res Function(MachineNo) then) =
      _$MachineNoCopyWithImpl<$Res, MachineNo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'creation') String? creation,
      @JsonKey(name: 'modified') String? modified,
      @JsonKey(name: 'modified_by') String? modifiedBy,
      @JsonKey(name: 'docstatus') int? docstatus});
}

/// @nodoc
class _$MachineNoCopyWithImpl<$Res, $Val extends MachineNo>
    implements $MachineNoCopyWith<$Res> {
  _$MachineNoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? creation = freezed,
    Object? modified = freezed,
    Object? modifiedBy = freezed,
    Object? docstatus = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      creation: freezed == creation
          ? _value.creation
          : creation // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      docstatus: freezed == docstatus
          ? _value.docstatus
          : docstatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MachineNoImplCopyWith<$Res>
    implements $MachineNoCopyWith<$Res> {
  factory _$$MachineNoImplCopyWith(
          _$MachineNoImpl value, $Res Function(_$MachineNoImpl) then) =
      __$$MachineNoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'creation') String? creation,
      @JsonKey(name: 'modified') String? modified,
      @JsonKey(name: 'modified_by') String? modifiedBy,
      @JsonKey(name: 'docstatus') int? docstatus});
}

/// @nodoc
class __$$MachineNoImplCopyWithImpl<$Res>
    extends _$MachineNoCopyWithImpl<$Res, _$MachineNoImpl>
    implements _$$MachineNoImplCopyWith<$Res> {
  __$$MachineNoImplCopyWithImpl(
      _$MachineNoImpl _value, $Res Function(_$MachineNoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? creation = freezed,
    Object? modified = freezed,
    Object? modifiedBy = freezed,
    Object? docstatus = freezed,
  }) {
    return _then(_$MachineNoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      creation: freezed == creation
          ? _value.creation
          : creation // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      docstatus: freezed == docstatus
          ? _value.docstatus
          : docstatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachineNoImpl implements _MachineNo {
  const _$MachineNoImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'owner') this.owner,
      @JsonKey(name: 'creation') this.creation,
      @JsonKey(name: 'modified') this.modified,
      @JsonKey(name: 'modified_by') this.modifiedBy,
      @JsonKey(name: 'docstatus') this.docstatus});

  factory _$MachineNoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MachineNoImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'owner')
  final String? owner;
  @override
  @JsonKey(name: 'creation')
  final String? creation;
  @override
  @JsonKey(name: 'modified')
  final String? modified;
  @override
  @JsonKey(name: 'modified_by')
  final String? modifiedBy;
  @override
  @JsonKey(name: 'docstatus')
  final int? docstatus;

  @override
  String toString() {
    return 'MachineNo(name: $name, owner: $owner, creation: $creation, modified: $modified, modifiedBy: $modifiedBy, docstatus: $docstatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineNoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.creation, creation) ||
                other.creation == creation) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.docstatus, docstatus) ||
                other.docstatus == docstatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, owner, creation, modified, modifiedBy, docstatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MachineNoImplCopyWith<_$MachineNoImpl> get copyWith =>
      __$$MachineNoImplCopyWithImpl<_$MachineNoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MachineNoImplToJson(
      this,
    );
  }
}

abstract class _MachineNo implements MachineNo {
  const factory _MachineNo(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'owner') final String? owner,
      @JsonKey(name: 'creation') final String? creation,
      @JsonKey(name: 'modified') final String? modified,
      @JsonKey(name: 'modified_by') final String? modifiedBy,
      @JsonKey(name: 'docstatus') final int? docstatus}) = _$MachineNoImpl;

  factory _MachineNo.fromJson(Map<String, dynamic> json) =
      _$MachineNoImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'owner')
  String? get owner;
  @override
  @JsonKey(name: 'creation')
  String? get creation;
  @override
  @JsonKey(name: 'modified')
  String? get modified;
  @override
  @JsonKey(name: 'modified_by')
  String? get modifiedBy;
  @override
  @JsonKey(name: 'docstatus')
  int? get docstatus;
  @override
  @JsonKey(ignore: true)
  _$$MachineNoImplCopyWith<_$MachineNoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
