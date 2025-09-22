// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateEntryImpl _$$GateEntryImplFromJson(Map<String, dynamic> json) =>
    _$GateEntryImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creationDate: json['creation'] as String? ?? '',
      docStatus: (json['docstatus'] as num?)?.toInt(),
      modifiedDate: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      idx: (json['idx'] as num?)?.toInt(),
      purchaseOrder: json['po_number'] as String?,
      vehicleNo: json['vehicle_no'] as String?,
      vendorInvoiceDate: json['vendor_invoice_date'] as String?,
      vendorInvoiceNo: json['vendor_invoice_no'] as String?,
      gateEntryDate: json['gate_entry_date'] as String?,
      invoiceQuantity: (json['vendor_invoice_quantity'] as num?)?.toInt(),
      invoiceAmount: (json['invoice_amount'] as num?)?.toInt(),
      remarks: json['remarks'] as String?,
      receipt: (json['is_purchase_receipt_created'] as num?)?.toInt(),
      vehiclePhoto: json['vehicle_photo'] as String?,
      invoicePhoto: json['vendor_invoice_photo'] as String?,
      vehicleBackPhoto: json['vehicle_back_photo'] as String?,
      customSupplier: json['custom_supplier'] as String?,
      createTime: json['created_time'] as String?,
      byMobileApp: (json['by_mobile_app'] as num?)?.toInt(),
      customeUnit1: json['custom_unit_1'] as String?,
      customeUnit2: json['custom_unit_2'] as String?,
      vehiclePhotoImg: toNull(json['vehiclePhotoImg']),
      invoicePhotoImg: toNull(json['invoicePhotoImg']),
      vehicleBackPhotoImg: toNull(json['vehicleBackPhotoImg']),
    );

Map<String, dynamic> _$$GateEntryImplToJson(_$GateEntryImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creationDate,
      'docstatus': instance.docStatus,
      'modified': instance.modifiedDate,
      'modified_by': instance.modifiedBy,
      'idx': instance.idx,
      'po_number': instance.purchaseOrder,
      'vehicle_no': instance.vehicleNo,
      'vendor_invoice_date': instance.vendorInvoiceDate,
      'vendor_invoice_no': instance.vendorInvoiceNo,
      'gate_entry_date': instance.gateEntryDate,
      'vendor_invoice_quantity': instance.invoiceQuantity,
      'invoice_amount': instance.invoiceAmount,
      'remarks': instance.remarks,
      'is_purchase_receipt_created': instance.receipt,
      'vehicle_photo': instance.vehiclePhoto,
      'vendor_invoice_photo': instance.invoicePhoto,
      'vehicle_back_photo': instance.vehicleBackPhoto,
      'custom_supplier': instance.customSupplier,
      'created_time': instance.createTime,
      'by_mobile_app': instance.byMobileApp,
      'custom_unit_1': instance.customeUnit1,
      'custom_unit_2': instance.customeUnit2,
    };
