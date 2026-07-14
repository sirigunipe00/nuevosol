// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainingEmployeeImpl _$$TrainingEmployeeImplFromJson(
        Map<String, dynamic> json) =>
    _$TrainingEmployeeImpl(
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creationDate: json['creation'] as String?,
      modifiedDate: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docStatus: (json['docstatus'] as num?)?.toInt(),
      idx: (json['idx'] as num?)?.toInt(),
      parent: json['parent'] as String?,
      parentField: json['parentfield'] as String?,
      parentType: json['parenttype'] as String?,
      employee: json['employee'] as String?,
      employeeName: json['employee_name'] as String?,
      department: json['department'] as String?,
      status: json['status'] as String?,
      attendance: json['attendance'] as String?,
      isMandatory: (json['is_mandatory'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TrainingEmployeeImplToJson(
        _$TrainingEmployeeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creationDate,
      'modified': instance.modifiedDate,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docStatus,
      'idx': instance.idx,
      'parent': instance.parent,
      'parentfield': instance.parentField,
      'parenttype': instance.parentType,
      'employee': instance.employee,
      'employee_name': instance.employeeName,
      'department': instance.department,
      'status': instance.status,
      'attendance': instance.attendance,
      'is_mandatory': instance.isMandatory,
    };
