import 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:io';

import 'package:nuevosol/core/utils/typedefs.dart';
part 'gate_exit.freezed.dart';
part 'gate_exit.g.dart';

@freezed
class GateExit with _$GateExit {
  const factory GateExit({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
    @JsonKey(name: 'docstatus') int? docStatus,
    @JsonKey(name: 'modified') String? modifiedDate,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'idx') int? idx,
    @JsonKey(name: 'sales_invoice') String? salesInvoice,
    @JsonKey(name: 'vehicle_no') String? vehicleNo,
    @JsonKey(name: 'vehicle_photo') String? vehiclePhoto,
    @JsonKey(name: 'gate_exit_date') String? gateExitDate,
    @JsonKey(name: 'vehicle_back_photo') String? vehicleBackPhoto,
    @JsonKey(name: 'remarks') String? remarks,
    @JsonKey(name: 'amended_from') String? amendedFrom,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'custom_gate_exit_time') String? gateExitTime,
    @JsonKey(name: 'amount') int? amount,
    @JsonKey(name: 'custom_customer_name') String? customerName,
    @JsonKey(name: 'dcsales_invoice_photo') String?  dsScalePhoto,
      @JsonKey(
        includeFromJson: true,
        includeToJson: false,
        toJson: toNull,
        fromJson: toNull)
    File? vehiclePhotoImg,
      @JsonKey(
        includeFromJson: true,
        includeToJson: false,
        toJson: toNull,
        fromJson: toNull)
    File? vehicleBackPhotoImg,
    @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull,
    )
    File? dsScalePhotoImg,
  }) = _GateExit;
  factory GateExit.fromJson(Map<String, dynamic> json) =>
      _$GateExitFromJson(json);
}
