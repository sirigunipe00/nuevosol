// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_tracking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventTracking _$EventTrackingFromJson(Map<String, dynamic> json) {
  return _EventTracking.fromJson(json);
}

/// @nodoc
mixin _$EventTracking {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'idx')
  int? get idx => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_date_time')
  String? get actualDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity')
  String? get activity => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError;

  /// Serializes this EventTracking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventTracking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventTrackingCopyWith<EventTracking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventTrackingCopyWith<$Res> {
  factory $EventTrackingCopyWith(
          EventTracking value, $Res Function(EventTracking) then) =
      _$EventTrackingCopyWithImpl<$Res, EventTracking>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'idx') int? idx,
      @JsonKey(name: 'actual_date_time') String? actualDateTime,
      @JsonKey(name: 'activity') String? activity,
      @JsonKey(name: 'location') String? location});
}

/// @nodoc
class _$EventTrackingCopyWithImpl<$Res, $Val extends EventTracking>
    implements $EventTrackingCopyWith<$Res> {
  _$EventTrackingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventTracking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? idx = freezed,
    Object? actualDateTime = freezed,
    Object? activity = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idx: freezed == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int?,
      actualDateTime: freezed == actualDateTime
          ? _value.actualDateTime
          : actualDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventTrackingImplCopyWith<$Res>
    implements $EventTrackingCopyWith<$Res> {
  factory _$$EventTrackingImplCopyWith(
          _$EventTrackingImpl value, $Res Function(_$EventTrackingImpl) then) =
      __$$EventTrackingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'idx') int? idx,
      @JsonKey(name: 'actual_date_time') String? actualDateTime,
      @JsonKey(name: 'activity') String? activity,
      @JsonKey(name: 'location') String? location});
}

/// @nodoc
class __$$EventTrackingImplCopyWithImpl<$Res>
    extends _$EventTrackingCopyWithImpl<$Res, _$EventTrackingImpl>
    implements _$$EventTrackingImplCopyWith<$Res> {
  __$$EventTrackingImplCopyWithImpl(
      _$EventTrackingImpl _value, $Res Function(_$EventTrackingImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventTracking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? idx = freezed,
    Object? actualDateTime = freezed,
    Object? activity = freezed,
    Object? location = freezed,
  }) {
    return _then(_$EventTrackingImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idx: freezed == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int?,
      actualDateTime: freezed == actualDateTime
          ? _value.actualDateTime
          : actualDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      activity: freezed == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
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
class _$EventTrackingImpl implements _EventTracking {
  const _$EventTrackingImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'idx') this.idx,
      @JsonKey(name: 'actual_date_time') this.actualDateTime,
      @JsonKey(name: 'activity') this.activity,
      @JsonKey(name: 'location') this.location});

  factory _$EventTrackingImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventTrackingImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'idx')
  final int? idx;
  @override
  @JsonKey(name: 'actual_date_time')
  final String? actualDateTime;
  @override
  @JsonKey(name: 'activity')
  final String? activity;
  @override
  @JsonKey(name: 'location')
  final String? location;

  @override
  String toString() {
    return 'EventTracking(name: $name, idx: $idx, actualDateTime: $actualDateTime, activity: $activity, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventTrackingImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.actualDateTime, actualDateTime) ||
                other.actualDateTime == actualDateTime) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, idx, actualDateTime, activity, location);

  /// Create a copy of EventTracking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventTrackingImplCopyWith<_$EventTrackingImpl> get copyWith =>
      __$$EventTrackingImplCopyWithImpl<_$EventTrackingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventTrackingImplToJson(
      this,
    );
  }
}

abstract class _EventTracking implements EventTracking {
  const factory _EventTracking(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'idx') final int? idx,
      @JsonKey(name: 'actual_date_time') final String? actualDateTime,
      @JsonKey(name: 'activity') final String? activity,
      @JsonKey(name: 'location') final String? location}) = _$EventTrackingImpl;

  factory _EventTracking.fromJson(Map<String, dynamic> json) =
      _$EventTrackingImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'idx')
  int? get idx;
  @override
  @JsonKey(name: 'actual_date_time')
  String? get actualDateTime;
  @override
  @JsonKey(name: 'activity')
  String? get activity;
  @override
  @JsonKey(name: 'location')
  String? get location;

  /// Create a copy of EventTracking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventTrackingImplCopyWith<_$EventTrackingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
