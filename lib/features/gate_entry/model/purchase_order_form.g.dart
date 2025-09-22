// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderFormImpl _$$PurchaseOrderFormImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderFormImpl(
      name: json['name'] as String?,
      workFlowState: json['workflow_state'] as String?,
      supplierName: json['supplier_name'] as String?,
      scheduleDate: json['schedule_date'] as String? ?? '',
    );

Map<String, dynamic> _$$PurchaseOrderFormImplToJson(
        _$PurchaseOrderFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'workflow_state': instance.workFlowState,
      'supplier_name': instance.supplierName,
      'schedule_date': instance.scheduleDate,
    };
