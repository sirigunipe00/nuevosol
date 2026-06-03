// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventTrackingImpl _$$EventTrackingImplFromJson(Map<String, dynamic> json) =>
    _$EventTrackingImpl(
      name: json['name'] as String?,
      idx: (json['idx'] as num?)?.toInt(),
      actualDateTime: json['actual_date_time'] as String?,
      activity: json['activity'] as String?,
      location: json['location'] as String?,
      expectedDateTime: json['expected_date_time'] as String?,
    );

Map<String, dynamic> _$$EventTrackingImplToJson(_$EventTrackingImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'idx': instance.idx,
      'actual_date_time': instance.actualDateTime,
      'activity': instance.activity,
      'location': instance.location,
      'expected_date_time': instance.expectedDateTime,
    };
