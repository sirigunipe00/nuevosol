// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_employee_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateEmployeeState {
  EmployeeTracker get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isApproveLoading => throw _privateConstructorUsedError;
  bool get isRejectLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  EmployeeView get view => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  /// Create a copy of CreateEmployeeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateEmployeeStateCopyWith<CreateEmployeeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEmployeeStateCopyWith<$Res> {
  factory $CreateEmployeeStateCopyWith(
          CreateEmployeeState value, $Res Function(CreateEmployeeState) then) =
      _$CreateEmployeeStateCopyWithImpl<$Res, CreateEmployeeState>;
  @useResult
  $Res call(
      {EmployeeTracker form,
      bool isLoading,
      bool isApproveLoading,
      bool isRejectLoading,
      bool isSuccess,
      EmployeeView view,
      String? successMsg,
      Failure? error});

  $EmployeeTrackerCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$CreateEmployeeStateCopyWithImpl<$Res, $Val extends CreateEmployeeState>
    implements $CreateEmployeeStateCopyWith<$Res> {
  _$CreateEmployeeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateEmployeeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isApproveLoading = null,
    Object? isRejectLoading = null,
    Object? isSuccess = null,
    Object? view = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as EmployeeTracker,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isApproveLoading: null == isApproveLoading
          ? _value.isApproveLoading
          : isApproveLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRejectLoading: null == isRejectLoading
          ? _value.isRejectLoading
          : isRejectLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as EmployeeView,
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

  /// Create a copy of CreateEmployeeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmployeeTrackerCopyWith<$Res> get form {
    return $EmployeeTrackerCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }

  /// Create a copy of CreateEmployeeState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$CreateEmployeeStateImplCopyWith<$Res>
    implements $CreateEmployeeStateCopyWith<$Res> {
  factory _$$CreateEmployeeStateImplCopyWith(_$CreateEmployeeStateImpl value,
          $Res Function(_$CreateEmployeeStateImpl) then) =
      __$$CreateEmployeeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmployeeTracker form,
      bool isLoading,
      bool isApproveLoading,
      bool isRejectLoading,
      bool isSuccess,
      EmployeeView view,
      String? successMsg,
      Failure? error});

  @override
  $EmployeeTrackerCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$CreateEmployeeStateImplCopyWithImpl<$Res>
    extends _$CreateEmployeeStateCopyWithImpl<$Res, _$CreateEmployeeStateImpl>
    implements _$$CreateEmployeeStateImplCopyWith<$Res> {
  __$$CreateEmployeeStateImplCopyWithImpl(_$CreateEmployeeStateImpl _value,
      $Res Function(_$CreateEmployeeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateEmployeeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isApproveLoading = null,
    Object? isRejectLoading = null,
    Object? isSuccess = null,
    Object? view = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_$CreateEmployeeStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as EmployeeTracker,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isApproveLoading: null == isApproveLoading
          ? _value.isApproveLoading
          : isApproveLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRejectLoading: null == isRejectLoading
          ? _value.isRejectLoading
          : isRejectLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as EmployeeView,
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

class _$CreateEmployeeStateImpl implements _CreateEmployeeState {
  const _$CreateEmployeeStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isApproveLoading,
      required this.isRejectLoading,
      required this.isSuccess,
      required this.view,
      this.successMsg,
      this.error});

  @override
  final EmployeeTracker form;
  @override
  final bool isLoading;
  @override
  final bool isApproveLoading;
  @override
  final bool isRejectLoading;
  @override
  final bool isSuccess;
  @override
  final EmployeeView view;
  @override
  final String? successMsg;
  @override
  final Failure? error;

  @override
  String toString() {
    return 'CreateEmployeeState(form: $form, isLoading: $isLoading, isApproveLoading: $isApproveLoading, isRejectLoading: $isRejectLoading, isSuccess: $isSuccess, view: $view, successMsg: $successMsg, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEmployeeStateImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isApproveLoading, isApproveLoading) ||
                other.isApproveLoading == isApproveLoading) &&
            (identical(other.isRejectLoading, isRejectLoading) ||
                other.isRejectLoading == isRejectLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, isLoading,
      isApproveLoading, isRejectLoading, isSuccess, view, successMsg, error);

  /// Create a copy of CreateEmployeeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEmployeeStateImplCopyWith<_$CreateEmployeeStateImpl> get copyWith =>
      __$$CreateEmployeeStateImplCopyWithImpl<_$CreateEmployeeStateImpl>(
          this, _$identity);
}

abstract class _CreateEmployeeState implements CreateEmployeeState {
  const factory _CreateEmployeeState(
      {required final EmployeeTracker form,
      required final bool isLoading,
      required final bool isApproveLoading,
      required final bool isRejectLoading,
      required final bool isSuccess,
      required final EmployeeView view,
      final String? successMsg,
      final Failure? error}) = _$CreateEmployeeStateImpl;

  @override
  EmployeeTracker get form;
  @override
  bool get isLoading;
  @override
  bool get isApproveLoading;
  @override
  bool get isRejectLoading;
  @override
  bool get isSuccess;
  @override
  EmployeeView get view;
  @override
  String? get successMsg;
  @override
  Failure? get error;

  /// Create a copy of CreateEmployeeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateEmployeeStateImplCopyWith<_$CreateEmployeeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
