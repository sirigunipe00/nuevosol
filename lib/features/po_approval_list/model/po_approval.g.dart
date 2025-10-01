// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'po_approval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoApprovalFormImpl _$$PoApprovalFormImplFromJson(Map<String, dynamic> json) =>
    _$PoApprovalFormImpl(
      status: json['status'] as String?,
      name: json['name'] as String,
      vendor: json['supplier'] as String,
      vendorName: json['supplier_name'] as String,
      creationDate: json['creation'] as String,
      requestedBy: json['company'] as String,
      grandTotal: (json['grand_total'] as num?)?.toDouble() ?? 0.0,
      totalQty: (json['total_qty'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      paymentTerm: json['payment_terms_template'] as String?,
      requiredBy: json['schedule_date'] as String?,
      vendorsContact: json['contact_person'] as String? ?? '',
      state: json['workflow_state'] as String,
    );

Map<String, dynamic> _$$PoApprovalFormImplToJson(
        _$PoApprovalFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'supplier': instance.vendor,
      'supplier_name': instance.vendorName,
      'creation': instance.creationDate,
      'company': instance.requestedBy,
      'grand_total': instance.grandTotal,
      'total_qty': instance.totalQty,
      'total': instance.total,
      'payment_terms_template': instance.paymentTerm,
      'schedule_date': instance.requiredBy,
      'contact_person': instance.vendorsContact,
      'workflow_state': instance.state,
    };
