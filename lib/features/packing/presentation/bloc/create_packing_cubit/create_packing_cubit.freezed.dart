// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_packing_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreatePackingState {
  PackingModel get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  PackingView get view => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePackingStateCopyWith<CreatePackingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePackingStateCopyWith<$Res> {
  factory $CreatePackingStateCopyWith(
          CreatePackingState value, $Res Function(CreatePackingState) then) =
      _$CreatePackingStateCopyWithImpl<$Res, CreatePackingState>;
  @useResult
  $Res call(
      {PackingModel form,
      bool isLoading,
      bool isSuccess,
      PackingView view,
      String? successMsg,
      Failure? error});

  $PackingModelCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$CreatePackingStateCopyWithImpl<$Res, $Val extends CreatePackingState>
    implements $CreatePackingStateCopyWith<$Res> {
  _$CreatePackingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? view = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as PackingModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as PackingView,
      successMsg: freezed == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PackingModelCopyWith<$Res> get form {
    return $PackingModelCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatePackingStateImplCopyWith<$Res>
    implements $CreatePackingStateCopyWith<$Res> {
  factory _$$CreatePackingStateImplCopyWith(_$CreatePackingStateImpl value,
          $Res Function(_$CreatePackingStateImpl) then) =
      __$$CreatePackingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PackingModel form,
      bool isLoading,
      bool isSuccess,
      PackingView view,
      String? successMsg,
      Failure? error});

  @override
  $PackingModelCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$CreatePackingStateImplCopyWithImpl<$Res>
    extends _$CreatePackingStateCopyWithImpl<$Res, _$CreatePackingStateImpl>
    implements _$$CreatePackingStateImplCopyWith<$Res> {
  __$$CreatePackingStateImplCopyWithImpl(_$CreatePackingStateImpl _value,
      $Res Function(_$CreatePackingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? view = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_$CreatePackingStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as PackingModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as PackingView,
      successMsg: freezed == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$CreatePackingStateImpl implements _CreatePackingState {
  const _$CreatePackingStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      required this.view,
      this.successMsg,
      this.error});

  @override
  final PackingModel form;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final PackingView view;
  @override
  final String? successMsg;
  @override
  final Failure? error;

  @override
  String toString() {
    return 'CreatePackingState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, view: $view, successMsg: $successMsg, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePackingStateImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, form, isLoading, isSuccess, view, successMsg, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePackingStateImplCopyWith<_$CreatePackingStateImpl> get copyWith =>
      __$$CreatePackingStateImplCopyWithImpl<_$CreatePackingStateImpl>(
          this, _$identity);
}

abstract class _CreatePackingState implements CreatePackingState {
  const factory _CreatePackingState(
      {required final PackingModel form,
      required final bool isLoading,
      required final bool isSuccess,
      required final PackingView view,
      final String? successMsg,
      final Failure? error}) = _$CreatePackingStateImpl;

  @override
  PackingModel get form;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  PackingView get view;
  @override
  String? get successMsg;
  @override
  Failure? get error;
  @override
  @JsonKey(ignore: true)
  _$$CreatePackingStateImplCopyWith<_$CreatePackingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
