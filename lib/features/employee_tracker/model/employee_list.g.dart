// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeListImpl _$$EmployeeListImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeListImpl(
      name: json['name'] as String?,
      employeeName: json['employee_name'] as String?,
      department: json['department'] as String?,
      company: json['company'] as String?,
      reportsTo: json['reports_to'] as String?,
      reportsToName: json['custom_reports_to_name'] as String?,
    );

Map<String, dynamic> _$$EmployeeListImplToJson(_$EmployeeListImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'employee_name': instance.employeeName,
      'department': instance.department,
      'company': instance.company,
      'reports_to': instance.reportsTo,
      'custom_reports_to_name': instance.reportsToName,
    };
