// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finished_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FinishedComponent _$FinishedComponentFromJson(Map<String, dynamic> json) {
  return _FinishedComponent.fromJson(json);
}

/// @nodoc
mixin _$FinishedComponent {
  @JsonKey(name: 'name')
  String? get componentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_bom')
  String? get deafultBom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinishedComponentCopyWith<FinishedComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinishedComponentCopyWith<$Res> {
  factory $FinishedComponentCopyWith(
          FinishedComponent value, $Res Function(FinishedComponent) then) =
      _$FinishedComponentCopyWithImpl<$Res, FinishedComponent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? componentName,
      @JsonKey(name: 'default_bom') String? deafultBom});
}

/// @nodoc
class _$FinishedComponentCopyWithImpl<$Res, $Val extends FinishedComponent>
    implements $FinishedComponentCopyWith<$Res> {
  _$FinishedComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? componentName = freezed,
    Object? deafultBom = freezed,
  }) {
    return _then(_value.copyWith(
      componentName: freezed == componentName
          ? _value.componentName
          : componentName // ignore: cast_nullable_to_non_nullable
              as String?,
      deafultBom: freezed == deafultBom
          ? _value.deafultBom
          : deafultBom // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinishedComponentImplCopyWith<$Res>
    implements $FinishedComponentCopyWith<$Res> {
  factory _$$FinishedComponentImplCopyWith(_$FinishedComponentImpl value,
          $Res Function(_$FinishedComponentImpl) then) =
      __$$FinishedComponentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? componentName,
      @JsonKey(name: 'default_bom') String? deafultBom});
}

/// @nodoc
class __$$FinishedComponentImplCopyWithImpl<$Res>
    extends _$FinishedComponentCopyWithImpl<$Res, _$FinishedComponentImpl>
    implements _$$FinishedComponentImplCopyWith<$Res> {
  __$$FinishedComponentImplCopyWithImpl(_$FinishedComponentImpl _value,
      $Res Function(_$FinishedComponentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? componentName = freezed,
    Object? deafultBom = freezed,
  }) {
    return _then(_$FinishedComponentImpl(
      componentName: freezed == componentName
          ? _value.componentName
          : componentName // ignore: cast_nullable_to_non_nullable
              as String?,
      deafultBom: freezed == deafultBom
          ? _value.deafultBom
          : deafultBom // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinishedComponentImpl implements _FinishedComponent {
  const _$FinishedComponentImpl(
      {@JsonKey(name: 'name') this.componentName,
      @JsonKey(name: 'default_bom') this.deafultBom});

  factory _$FinishedComponentImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinishedComponentImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? componentName;
  @override
  @JsonKey(name: 'default_bom')
  final String? deafultBom;

  @override
  String toString() {
    return 'FinishedComponent(componentName: $componentName, deafultBom: $deafultBom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinishedComponentImpl &&
            (identical(other.componentName, componentName) ||
                other.componentName == componentName) &&
            (identical(other.deafultBom, deafultBom) ||
                other.deafultBom == deafultBom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, componentName, deafultBom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinishedComponentImplCopyWith<_$FinishedComponentImpl> get copyWith =>
      __$$FinishedComponentImplCopyWithImpl<_$FinishedComponentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinishedComponentImplToJson(
      this,
    );
  }
}

abstract class _FinishedComponent implements FinishedComponent {
  const factory _FinishedComponent(
          {@JsonKey(name: 'name') final String? componentName,
          @JsonKey(name: 'default_bom') final String? deafultBom}) =
      _$FinishedComponentImpl;

  factory _FinishedComponent.fromJson(Map<String, dynamic> json) =
      _$FinishedComponentImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get componentName;
  @override
  @JsonKey(name: 'default_bom')
  String? get deafultBom;
  @override
  @JsonKey(ignore: true)
  _$$FinishedComponentImplCopyWith<_$FinishedComponentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
