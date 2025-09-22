// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_exit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateExitImpl _$$GateExitImplFromJson(Map<String, dynamic> json) =>
    _$GateExitImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creationDate: json['creation'] as String? ?? '',
      docStatus: (json['docstatus'] as num?)?.toInt(),
      modifiedDate: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      idx: (json['idx'] as num?)?.toInt(),
      salesInvoice: json['sales_invoice'] as String?,
      vehicleNo: json['vehicle_no'] as String?,
      vehiclePhoto: json['vehicle_photo'] as String?,
      gateExitDate: json['gate_exit_date'] as String?,
      vehicleBackPhoto: json['vehicle_back_photo'] as String?,
      remarks: json['remarks'] as String?,
      amendedFrom: json['amended_from'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      gateExitTime: json['custom_gate_exit_time'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      customerName: json['custom_customer_name'] as String?,
      dsScalePhoto: json['dcsales_invoice_photo'] as String?,
      vehiclePhotoImg: toNull(json['vehiclePhotoImg']),
      vehicleBackPhotoImg: toNull(json['vehicleBackPhotoImg']),
      dsScalePhotoImg: toNull(json['dsScalePhotoImg']),
    );

Map<String, dynamic> _$$GateExitImplToJson(_$GateExitImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creationDate,
      'docstatus': instance.docStatus,
      'modified': instance.modifiedDate,
      'modified_by': instance.modifiedBy,
      'idx': instance.idx,
      'sales_invoice': instance.salesInvoice,
      'vehicle_no': instance.vehicleNo,
      'vehicle_photo': instance.vehiclePhoto,
      'gate_exit_date': instance.gateExitDate,
      'vehicle_back_photo': instance.vehicleBackPhoto,
      'remarks': instance.remarks,
      'amended_from': instance.amendedFrom,
      'quantity': instance.quantity,
      'custom_gate_exit_time': instance.gateExitTime,
      'amount': instance.amount,
      'custom_customer_name': instance.customerName,
      'dcsales_invoice_photo': instance.dsScalePhoto,
    };
