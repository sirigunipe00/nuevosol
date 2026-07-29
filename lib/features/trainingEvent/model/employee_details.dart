import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_details.freezed.dart';
part 'employee_details.g.dart';

@freezed
class EmployeeDetails with _$EmployeeDetails {
  const factory EmployeeDetails({
    @JsonKey(name: 'employee')
    String? employee,

    @JsonKey(name: 'employee_name')
    String? employeeName,

    @JsonKey(name: 'department')
    String? department,

    @JsonKey(name: 'status')
    String? status,

    @JsonKey(name: 'attendance')
    String? attendance,

    @JsonKey(name: 'is_mandatory')
    int? isMandatory,
  }) = _EmployeeDetails;

  factory EmployeeDetails.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDetailsFromJson(json);
}