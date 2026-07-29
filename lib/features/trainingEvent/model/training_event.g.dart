// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainingEventImpl _$$TrainingEventImplFromJson(Map<String, dynamic> json) =>
    _$TrainingEventImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creationDate: json['creation'] as String?,
      modifiedDate: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docStatus: (json['docstatus'] as num?)?.toInt(),
      idx: (json['idx'] as num?)?.toInt(),
      eventName: json['event_name'] as String?,
      trainingProgram: json['training_program'] as String?,
      eventStatus: json['event_status'] as String?,
      hasCertificate: (json['has_certificate'] as num?)?.toInt(),
      type: json['type'] as String?,
      level: json['level'] as String?,
      company: json['company'] as String?,
      trainerName: json['trainer_name'] as String?,
      trainerEmail: json['trainer_email'] as String?,
      supplier: json['supplier'] as String?,
      contactNumber: json['contact_number'] as String?,
      course: json['course'] as String?,
      location: json['location'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      introduction: json['introduction'] as String?,
      amendedFrom: json['amended_from'] as String?,
      employeeEmails: json['employee_emails'] as String?,
      employeeDetails: json['employee_details'] == null
          ? null
          : EmployeeDetails.fromJson(
              json['employee_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TrainingEventImplToJson(_$TrainingEventImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creationDate,
      'modified': instance.modifiedDate,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docStatus,
      'idx': instance.idx,
      'event_name': instance.eventName,
      'training_program': instance.trainingProgram,
      'event_status': instance.eventStatus,
      'has_certificate': instance.hasCertificate,
      'type': instance.type,
      'level': instance.level,
      'company': instance.company,
      'trainer_name': instance.trainerName,
      'trainer_email': instance.trainerEmail,
      'supplier': instance.supplier,
      'contact_number': instance.contactNumber,
      'course': instance.course,
      'location': instance.location,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'introduction': instance.introduction,
      'amended_from': instance.amendedFrom,
      'employee_emails': instance.employeeEmails,
      'employee_details': instance.employeeDetails,
    };
