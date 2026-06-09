import 'package:freezed_annotation/freezed_annotation.dart';
part 'department.freezed.dart';
part 'department.g.dart';
@freezed
class Department with _$Department {
  const factory Department({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'department_name') String? departmentName,
    @JsonKey(name: 'parent_department') String? parentDepartment,
    @JsonKey(name: 'company') String? company,

  }) = _Department;
factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
}