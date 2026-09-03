import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
class EmployeeTracker with _$EmployeeTracker {
  const factory EmployeeTracker({
     String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation') String? creation,
    @JsonKey(name: 'modified') String? modified,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docstatus,
    @JsonKey(name: 'idx') int? idx,
    @JsonKey(name: 'workflow_state') String? workflowState,
    @JsonKey(name: 'employee_id') String? employeeNo,
    @JsonKey(name: 'hod') String? hod,
    @JsonKey(name: 'company') String? company,
    @JsonKey(name: 'employee_name') String? employeeName,
    @JsonKey(name: 'department') String? department,
    @JsonKey(name: 'reason_of_gate_exit') String? reasonOfGateExit,
    @JsonKey(name: 'from_location') String? fromLocation,
    @JsonKey(name: 'movement_type') String? movementType,
    @JsonKey(name: 'to_location') String? toLocation,
    @JsonKey(name: '2nd_hod') String? secondHod,
    @JsonKey(name: 'expected_exit_date_time')
    String? expectedExitDateTime,
    @JsonKey(name: 'expected_duration_min')
    int? expectedDurationMin,
    @JsonKey(name: 'expected_return_date_time')
    String? expectedReturnDateTime,
    @JsonKey(name: 'send_for_approval_date_time')
    String? sendForApprovalDateTime,
    @JsonKey(name: 'approved_date_time')
    String? approvedDateTime,
    @JsonKey(name: 'approved_by')
    String? approvedBy,
    @JsonKey(name: 'reject_reason')
    String? rejectReason,
    @JsonKey(name: 'gate_exit_date_and_time')
    String? gateExitDateAndTime,
    @JsonKey(name: 'expected_duration_t1_min')
    int? expectedDurationT1Min,
    @JsonKey(name: 'status_1')
    String? status1,
    @JsonKey(name: 'gate_entry_date_and_time')
    String? gateEntryDateAndTime,
    @JsonKey(name: 'actual_duration_t1_min')
    int? actualDurationT1Min,
    @JsonKey(name: 'gate_exit_date_and_time_return')
    String? gateExitDateAndTimeReturn,
    @JsonKey(name: 'expected_duration_t2_min')
    int? expectedDurationT2Min,
    @JsonKey(name: 'status_2')
    String? status2,
    @JsonKey(name: 'gate_entry_date_and_time_return')
    String? gateEntryDateAndTimeReturn,
    @JsonKey(name: 'actual_duration_t2_min')
    int? actualDurationT2Min,
    @JsonKey(name: 'amended_from')
    String? amendedFrom,
    @JsonKey(name: 'remarks') String? remarks
  }) = _EmployeeTracker;

  factory EmployeeTracker.fromJson(
    Map<String, dynamic> json,
  ) => _$EmployeeTrackerFromJson(json);
}