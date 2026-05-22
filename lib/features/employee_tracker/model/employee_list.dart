import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_list.freezed.dart';
part 'employee_list.g.dart';

@freezed
class EmployeeList with _$EmployeeList {
  const factory EmployeeList({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'employee_name') String? employeeName,
  }) = _EmployeeList;
factory EmployeeList.fromJson(Map<String, dynamic> json) => _$EmployeeListFromJson(json);
}