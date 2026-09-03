// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeTrackerImpl _$$EmployeeTrackerImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeTrackerImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creation: json['creation'] as String?,
      modified: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docstatus: (json['docstatus'] as num?)?.toInt(),
      idx: (json['idx'] as num?)?.toInt(),
      workflowState: json['workflow_state'] as String?,
      employeeNo: json['employee_id'] as String?,
      hod: json['hod'] as String?,
      company: json['company'] as String?,
      employeeName: json['employee_name'] as String?,
      department: json['department'] as String?,
      reasonOfGateExit: json['reason_of_gate_exit'] as String?,
      fromLocation: json['from_location'] as String?,
      movementType: json['movement_type'] as String?,
      toLocation: json['to_location'] as String?,
      secondHod: json['2nd_hod'] as String?,
      expectedExitDateTime: json['expected_exit_date_time'] as String?,
      expectedDurationMin: (json['expected_duration_min'] as num?)?.toInt(),
      expectedReturnDateTime: json['expected_return_date_time'] as String?,
      sendForApprovalDateTime: json['send_for_approval_date_time'] as String?,
      approvedDateTime: json['approved_date_time'] as String?,
      approvedBy: json['approved_by'] as String?,
      rejectReason: json['reject_reason'] as String?,
      gateExitDateAndTime: json['gate_exit_date_and_time'] as String?,
      expectedDurationT1Min:
          (json['expected_duration_t1_min'] as num?)?.toInt(),
      status1: json['status_1'] as String?,
      gateEntryDateAndTime: json['gate_entry_date_and_time'] as String?,
      actualDurationT1Min: (json['actual_duration_t1_min'] as num?)?.toInt(),
      gateExitDateAndTimeReturn:
          json['gate_exit_date_and_time_return'] as String?,
      expectedDurationT2Min:
          (json['expected_duration_t2_min'] as num?)?.toInt(),
      status2: json['status_2'] as String?,
      gateEntryDateAndTimeReturn:
          json['gate_entry_date_and_time_return'] as String?,
      actualDurationT2Min: (json['actual_duration_t2_min'] as num?)?.toInt(),
      amendedFrom: json['amended_from'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$$EmployeeTrackerImplToJson(
        _$EmployeeTrackerImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creation,
      'modified': instance.modified,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docstatus,
      'idx': instance.idx,
      'workflow_state': instance.workflowState,
      'employee_id': instance.employeeNo,
      'hod': instance.hod,
      'company': instance.company,
      'employee_name': instance.employeeName,
      'department': instance.department,
      'reason_of_gate_exit': instance.reasonOfGateExit,
      'from_location': instance.fromLocation,
      'movement_type': instance.movementType,
      'to_location': instance.toLocation,
      '2nd_hod': instance.secondHod,
      'expected_exit_date_time': instance.expectedExitDateTime,
      'expected_duration_min': instance.expectedDurationMin,
      'expected_return_date_time': instance.expectedReturnDateTime,
      'send_for_approval_date_time': instance.sendForApprovalDateTime,
      'approved_date_time': instance.approvedDateTime,
      'approved_by': instance.approvedBy,
      'reject_reason': instance.rejectReason,
      'gate_exit_date_and_time': instance.gateExitDateAndTime,
      'expected_duration_t1_min': instance.expectedDurationT1Min,
      'status_1': instance.status1,
      'gate_entry_date_and_time': instance.gateEntryDateAndTime,
      'actual_duration_t1_min': instance.actualDurationT1Min,
      'gate_exit_date_and_time_return': instance.gateExitDateAndTimeReturn,
      'expected_duration_t2_min': instance.expectedDurationT2Min,
      'status_2': instance.status2,
      'gate_entry_date_and_time_return': instance.gateEntryDateAndTimeReturn,
      'actual_duration_t2_min': instance.actualDurationT2Min,
      'amended_from': instance.amendedFrom,
      'remarks': instance.remarks,
    };
