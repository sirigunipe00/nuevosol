// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_training_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JoinTrainingResult _$JoinTrainingResultFromJson(Map<String, dynamic> json) {
  return _JoinTrainingResult.fromJson(json);
}

/// @nodoc
mixin _$JoinTrainingResult {
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_email')
  String? get userEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee')
  String? get employee => throw _privateConstructorUsedError;
  @JsonKey(name: 'employee_name')
  String? get employeeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'training_events')
  List<TrainingEvent> get trainingEvents => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinTrainingResultCopyWith<JoinTrainingResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinTrainingResultCopyWith<$Res> {
  factory $JoinTrainingResultCopyWith(
          JoinTrainingResult value, $Res Function(JoinTrainingResult) then) =
      _$JoinTrainingResultCopyWithImpl<$Res, JoinTrainingResult>;
  @useResult
  $Res call(
      {int? status,
      String? message,
      @JsonKey(name: 'user_email') String? userEmail,
      @JsonKey(name: 'employee') String? employee,
      @JsonKey(name: 'employee_name') String? employeeName,
      @JsonKey(name: 'training_events') List<TrainingEvent> trainingEvents,
      int? count});
}

/// @nodoc
class _$JoinTrainingResultCopyWithImpl<$Res, $Val extends JoinTrainingResult>
    implements $JoinTrainingResultCopyWith<$Res> {
  _$JoinTrainingResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? userEmail = freezed,
    Object? employee = freezed,
    Object? employeeName = freezed,
    Object? trainingEvents = null,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      trainingEvents: null == trainingEvents
          ? _value.trainingEvents
          : trainingEvents // ignore: cast_nullable_to_non_nullable
              as List<TrainingEvent>,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JoinTrainingResultImplCopyWith<$Res>
    implements $JoinTrainingResultCopyWith<$Res> {
  factory _$$JoinTrainingResultImplCopyWith(_$JoinTrainingResultImpl value,
          $Res Function(_$JoinTrainingResultImpl) then) =
      __$$JoinTrainingResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      String? message,
      @JsonKey(name: 'user_email') String? userEmail,
      @JsonKey(name: 'employee') String? employee,
      @JsonKey(name: 'employee_name') String? employeeName,
      @JsonKey(name: 'training_events') List<TrainingEvent> trainingEvents,
      int? count});
}

/// @nodoc
class __$$JoinTrainingResultImplCopyWithImpl<$Res>
    extends _$JoinTrainingResultCopyWithImpl<$Res, _$JoinTrainingResultImpl>
    implements _$$JoinTrainingResultImplCopyWith<$Res> {
  __$$JoinTrainingResultImplCopyWithImpl(_$JoinTrainingResultImpl _value,
      $Res Function(_$JoinTrainingResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? userEmail = freezed,
    Object? employee = freezed,
    Object? employeeName = freezed,
    Object? trainingEvents = null,
    Object? count = freezed,
  }) {
    return _then(_$JoinTrainingResultImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      employee: freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeName: freezed == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String?,
      trainingEvents: null == trainingEvents
          ? _value._trainingEvents
          : trainingEvents // ignore: cast_nullable_to_non_nullable
              as List<TrainingEvent>,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinTrainingResultImpl implements _JoinTrainingResult {
  const _$JoinTrainingResultImpl(
      {this.status,
      this.message,
      @JsonKey(name: 'user_email') this.userEmail,
      @JsonKey(name: 'employee') this.employee,
      @JsonKey(name: 'employee_name') this.employeeName,
      @JsonKey(name: 'training_events')
      final List<TrainingEvent> trainingEvents = const <TrainingEvent>[],
      this.count})
      : _trainingEvents = trainingEvents;

  factory _$JoinTrainingResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinTrainingResultImplFromJson(json);

  @override
  final int? status;
  @override
  final String? message;
  @override
  @JsonKey(name: 'user_email')
  final String? userEmail;
  @override
  @JsonKey(name: 'employee')
  final String? employee;
  @override
  @JsonKey(name: 'employee_name')
  final String? employeeName;
  final List<TrainingEvent> _trainingEvents;
  @override
  @JsonKey(name: 'training_events')
  List<TrainingEvent> get trainingEvents {
    if (_trainingEvents is EqualUnmodifiableListView) return _trainingEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trainingEvents);
  }

  @override
  final int? count;

  @override
  String toString() {
    return 'JoinTrainingResult(status: $status, message: $message, userEmail: $userEmail, employee: $employee, employeeName: $employeeName, trainingEvents: $trainingEvents, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinTrainingResultImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            const DeepCollectionEquality()
                .equals(other._trainingEvents, _trainingEvents) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      message,
      userEmail,
      employee,
      employeeName,
      const DeepCollectionEquality().hash(_trainingEvents),
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinTrainingResultImplCopyWith<_$JoinTrainingResultImpl> get copyWith =>
      __$$JoinTrainingResultImplCopyWithImpl<_$JoinTrainingResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinTrainingResultImplToJson(
      this,
    );
  }
}

abstract class _JoinTrainingResult implements JoinTrainingResult {
  const factory _JoinTrainingResult(
      {final int? status,
      final String? message,
      @JsonKey(name: 'user_email') final String? userEmail,
      @JsonKey(name: 'employee') final String? employee,
      @JsonKey(name: 'employee_name') final String? employeeName,
      @JsonKey(name: 'training_events')
      final List<TrainingEvent> trainingEvents,
      final int? count}) = _$JoinTrainingResultImpl;

  factory _JoinTrainingResult.fromJson(Map<String, dynamic> json) =
      _$JoinTrainingResultImpl.fromJson;

  @override
  int? get status;
  @override
  String? get message;
  @override
  @JsonKey(name: 'user_email')
  String? get userEmail;
  @override
  @JsonKey(name: 'employee')
  String? get employee;
  @override
  @JsonKey(name: 'employee_name')
  String? get employeeName;
  @override
  @JsonKey(name: 'training_events')
  List<TrainingEvent> get trainingEvents;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$JoinTrainingResultImplCopyWith<_$JoinTrainingResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
