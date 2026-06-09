// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentImpl _$$DepartmentImplFromJson(Map<String, dynamic> json) =>
    _$DepartmentImpl(
      name: json['name'] as String?,
      departmentName: json['department_name'] as String?,
      parentDepartment: json['parent_department'] as String?,
      company: json['company'] as String?,
    );

Map<String, dynamic> _$$DepartmentImplToJson(_$DepartmentImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'department_name': instance.departmentName,
      'parent_department': instance.parentDepartment,
      'company': instance.company,
    };
