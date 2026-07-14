// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_training_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateTrainingState {
  TrainingEvent get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  TraininView get view => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateTrainingStateCopyWith<CreateTrainingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTrainingStateCopyWith<$Res> {
  factory $CreateTrainingStateCopyWith(
          CreateTrainingState value, $Res Function(CreateTrainingState) then) =
      _$CreateTrainingStateCopyWithImpl<$Res, CreateTrainingState>;
  @useResult
  $Res call(
      {TrainingEvent form,
      bool isLoading,
      bool isSuccess,
      TraininView view,
      String? successMsg,
      Failure? error});

  $TrainingEventCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$CreateTrainingStateCopyWithImpl<$Res, $Val extends CreateTrainingState>
    implements $CreateTrainingStateCopyWith<$Res> {
  _$CreateTrainingStateCopyWithImpl(this._value, this._then);

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
              as TrainingEvent,
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
              as TraininView,
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
  $TrainingEventCopyWith<$Res> get form {
    return $TrainingEventCopyWith<$Res>(_value.form, (value) {
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
abstract class _$$CreateTrainingStateImplCopyWith<$Res>
    implements $CreateTrainingStateCopyWith<$Res> {
  factory _$$CreateTrainingStateImplCopyWith(_$CreateTrainingStateImpl value,
          $Res Function(_$CreateTrainingStateImpl) then) =
      __$$CreateTrainingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TrainingEvent form,
      bool isLoading,
      bool isSuccess,
      TraininView view,
      String? successMsg,
      Failure? error});

  @override
  $TrainingEventCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$CreateTrainingStateImplCopyWithImpl<$Res>
    extends _$CreateTrainingStateCopyWithImpl<$Res, _$CreateTrainingStateImpl>
    implements _$$CreateTrainingStateImplCopyWith<$Res> {
  __$$CreateTrainingStateImplCopyWithImpl(_$CreateTrainingStateImpl _value,
      $Res Function(_$CreateTrainingStateImpl) _then)
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
    return _then(_$CreateTrainingStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as TrainingEvent,
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
              as TraininView,
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

class _$CreateTrainingStateImpl implements _CreateTrainingState {
  const _$CreateTrainingStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      required this.view,
      this.successMsg,
      this.error});

  @override
  final TrainingEvent form;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final TraininView view;
  @override
  final String? successMsg;
  @override
  final Failure? error;

  @override
  String toString() {
    return 'CreateTrainingState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, view: $view, successMsg: $successMsg, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTrainingStateImpl &&
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
  _$$CreateTrainingStateImplCopyWith<_$CreateTrainingStateImpl> get copyWith =>
      __$$CreateTrainingStateImplCopyWithImpl<_$CreateTrainingStateImpl>(
          this, _$identity);
}

abstract class _CreateTrainingState implements CreateTrainingState {
  const factory _CreateTrainingState(
      {required final TrainingEvent form,
      required final bool isLoading,
      required final bool isSuccess,
      required final TraininView view,
      final String? successMsg,
      final Failure? error}) = _$CreateTrainingStateImpl;

  @override
  TrainingEvent get form;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  TraininView get view;
  @override
  String? get successMsg;
  @override
  Failure? get error;
  @override
  @JsonKey(ignore: true)
  _$$CreateTrainingStateImplCopyWith<_$CreateTrainingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
