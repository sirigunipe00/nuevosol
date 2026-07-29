// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeDetailsImpl _$$EmployeeDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeDetailsImpl(
      employee: json['employee'] as String?,
      employeeName: json['employee_name'] as String?,
      department: json['department'] as String?,
      status: json['status'] as String?,
      attendance: json['attendance'] as String?,
      isMandatory: (json['is_mandatory'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EmployeeDetailsImplToJson(
        _$EmployeeDetailsImpl instance) =>
    <String, dynamic>{
      'employee': instance.employee,
      'employee_name': instance.employeeName,
      'department': instance.department,
      'status': instance.status,
      'attendance': instance.attendance,
      'is_mandatory': instance.isMandatory,
    };
