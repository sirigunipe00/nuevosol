

import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_code.freezed.dart';
part 'qr_code.g.dart';

@freezed
class QrCodeModel with _$QrCodeModel {
  const factory QrCodeModel({
    String? message,
  @JsonKey(name: 'gate_pass_id')
   String? gatePassId,

  @JsonKey(name: 'scan_no')
   int? scanNo,

  @JsonKey(name: 'total_scans')
   int? totalScans,

  @JsonKey(name: 'location')
   String? location,

  @JsonKey(name: 'activity')
   String? activity,

  @JsonKey(name: 'actual_date_time')
   String? actualDateTime,

  @JsonKey(name: 'duration_min')
   int? durationMin,

  @JsonKey(name: 'employee_photo')
   String? employeePhoto,

  @JsonKey(name: 'completed')
   bool? completed,

  @JsonKey(name: 'workflow_state')
   String? workflowState
  }) = _QrCodeModel;
factory QrCodeModel.fromJson(Map<String, dynamic> json) => _$QrCodeModelFromJson(json);
}