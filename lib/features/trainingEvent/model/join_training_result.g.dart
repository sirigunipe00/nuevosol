// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_training_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JoinTrainingResultImpl _$$JoinTrainingResultImplFromJson(
        Map<String, dynamic> json) =>
    _$JoinTrainingResultImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      userEmail: json['user_email'] as String?,
      employee: json['employee'] as String?,
      employeeName: json['employee_name'] as String?,
      trainingEvents: (json['training_events'] as List<dynamic>?)
              ?.map((e) => TrainingEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TrainingEvent>[],
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$JoinTrainingResultImplToJson(
        _$JoinTrainingResultImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'user_email': instance.userEmail,
      'employee': instance.employee,
      'employee_name': instance.employeeName,
      'training_events': instance.trainingEvents,
      'count': instance.count,
    };
