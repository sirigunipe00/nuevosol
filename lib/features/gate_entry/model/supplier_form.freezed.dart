// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupplierForm _$SupplierFormFromJson(Map<String, dynamic> json) {
  return _SupplierForm.fromJson(json);
}

/// @nodoc
mixin _$SupplierForm {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_group')
  String? get supplierGruop => throw _privateConstructorUsedError;

  /// Serializes this SupplierForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupplierForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupplierFormCopyWith<SupplierForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplierFormCopyWith<$Res> {
  factory $SupplierFormCopyWith(
          SupplierForm value, $Res Function(SupplierForm) then) =
      _$SupplierFormCopyWithImpl<$Res, SupplierForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'supplier_group') String? supplierGruop});
}

/// @nodoc
class _$SupplierFormCopyWithImpl<$Res, $Val extends SupplierForm>
    implements $SupplierFormCopyWith<$Res> {
  _$SupplierFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupplierForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? supplierGruop = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierGruop: freezed == supplierGruop
          ? _value.supplierGruop
          : supplierGruop // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupplierFormImplCopyWith<$Res>
    implements $SupplierFormCopyWith<$Res> {
  factory _$$SupplierFormImplCopyWith(
          _$SupplierFormImpl value, $Res Function(_$SupplierFormImpl) then) =
      __$$SupplierFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'supplier_group') String? supplierGruop});
}

/// @nodoc
class __$$SupplierFormImplCopyWithImpl<$Res>
    extends _$SupplierFormCopyWithImpl<$Res, _$SupplierFormImpl>
    implements _$$SupplierFormImplCopyWith<$Res> {
  __$$SupplierFormImplCopyWithImpl(
      _$SupplierFormImpl _value, $Res Function(_$SupplierFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of SupplierForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? supplierGruop = freezed,
  }) {
    return _then(_$SupplierFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierGruop: freezed == supplierGruop
          ? _value.supplierGruop
          : supplierGruop // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupplierFormImpl implements _SupplierForm {
  const _$SupplierFormImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'supplier_group') this.supplierGruop});

  factory _$SupplierFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupplierFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'supplier_group')
  final String? supplierGruop;

  @override
  String toString() {
    return 'SupplierForm(name: $name, supplierGruop: $supplierGruop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupplierFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.supplierGruop, supplierGruop) ||
                other.supplierGruop == supplierGruop));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, supplierGruop);

  /// Create a copy of SupplierForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupplierFormImplCopyWith<_$SupplierFormImpl> get copyWith =>
      __$$SupplierFormImplCopyWithImpl<_$SupplierFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupplierFormImplToJson(
      this,
    );
  }
}

abstract class _SupplierForm implements SupplierForm {
  const factory _SupplierForm(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'supplier_group') final String? supplierGruop}) =
      _$SupplierFormImpl;

  factory _SupplierForm.fromJson(Map<String, dynamic> json) =
      _$SupplierFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'supplier_group')
  String? get supplierGruop;

  /// Create a copy of SupplierForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupplierFormImplCopyWith<_$SupplierFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
