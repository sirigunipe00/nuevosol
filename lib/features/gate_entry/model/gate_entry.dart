
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nuevosol/core/utils/typedefs.dart';


part 'gate_entry.freezed.dart';
part 'gate_entry.g.dart';

@freezed
class GateEntry with _$GateEntry {
  const factory GateEntry({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation',defaultValue: '') String? creationDate,
    @JsonKey(name: 'docstatus') int? docStatus,
    @JsonKey(name: 'modified') String? modifiedDate,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'idx') int? idx,
    @JsonKey(name: 'po_number') String? purchaseOrder,
    @JsonKey(name: 'vehicle_no') String? vehicleNo,
    @JsonKey(name: 'vendor_invoice_date')
    String? vendorInvoiceDate,
    @JsonKey(name: 'vendor_invoice_no')
    String? vendorInvoiceNo,
    @JsonKey(name: 'gate_entry_date') String? gateEntryDate,
    @JsonKey(name: 'vendor_invoice_quantity') int? invoiceQuantity,
    @JsonKey(name: 'invoice_amount') int? invoiceAmount,
    @JsonKey(name: 'remarks') String? remarks,
    @JsonKey(name: 'is_purchase_receipt_created') int? receipt,
    @JsonKey(name: 'vehicle_photo') String? vehiclePhoto,
    @JsonKey(name: 'vendor_invoice_photo') String? invoicePhoto,
    @JsonKey(name: 'vehicle_back_photo') String? vehicleBackPhoto,
    @JsonKey(name:  'custom_supplier') String? customSupplier,
    @JsonKey(name:  'created_time') String? createTime,
    @JsonKey(name:  'by_mobile_app') int? byMobileApp,
    @JsonKey(name: 'custom_unit_1') String? customeUnit1,
    @JsonKey(name: 'custom_unit_2') String? customeUnit2,


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
    File? invoicePhotoImg,
    @JsonKey(
        includeFromJson: true,
        includeToJson: false,
        toJson: toNull,
        fromJson: toNull)
    File? vehicleBackPhotoImg,
    
  }) = _GateEntry;
  factory GateEntry.fromJson(Map<String, dynamic> json) =>
      _$GateEntryFromJson(json);
}
