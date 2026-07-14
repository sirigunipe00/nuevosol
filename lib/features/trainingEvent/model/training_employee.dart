import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_employee.freezed.dart';
part 'training_employee.g.dart';

@freezed
class TrainingEmployee with _$TrainingEmployee {
  const factory TrainingEmployee({
    @JsonKey(name: 'name')
    String? name,

    @JsonKey(name: 'owner')
    String? owner,

    @JsonKey(name: 'creation')
    String? creationDate,

    @JsonKey(name: 'modified')
    String? modifiedDate,

    @JsonKey(name: 'modified_by')
    String? modifiedBy,

    @JsonKey(name: 'docstatus')
    int? docStatus,

    @JsonKey(name: 'idx')
    int? idx,

    @JsonKey(name: 'parent')
    String? parent,

    @JsonKey(name: 'parentfield')
    String? parentField,

    @JsonKey(name: 'parenttype')
    String? parentType,

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
  }) = _TrainingEmployee;

  factory TrainingEmployee.fromJson(Map<String, dynamic> json) =>
      _$TrainingEmployeeFromJson(json);
}