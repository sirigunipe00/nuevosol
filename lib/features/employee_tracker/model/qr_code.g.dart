// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrCodeModelImpl _$$QrCodeModelImplFromJson(Map<String, dynamic> json) =>
    _$QrCodeModelImpl(
      message: json['message'] as String?,
      gatePassId: json['gate_pass_id'] as String?,
      scanNo: (json['scan_no'] as num?)?.toInt(),
      totalScans: (json['total_scans'] as num?)?.toInt(),
      location: json['location'] as String?,
      activity: json['activity'] as String?,
      actualDateTime: json['actual_date_time'] as String?,
      durationMin: (json['duration_min'] as num?)?.toInt(),
      employeePhoto: json['employee_photo'] as String?,
      completed: json['completed'] as bool?,
      workflowState: json['workflow_state'] as String?,
    );

Map<String, dynamic> _$$QrCodeModelImplToJson(_$QrCodeModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'gate_pass_id': instance.gatePassId,
      'scan_no': instance.scanNo,
      'total_scans': instance.totalScans,
      'location': instance.location,
      'activity': instance.activity,
      'actual_date_time': instance.actualDateTime,
      'duration_min': instance.durationMin,
      'employee_photo': instance.employeePhoto,
      'completed': instance.completed,
      'workflow_state': instance.workflowState,
    };
