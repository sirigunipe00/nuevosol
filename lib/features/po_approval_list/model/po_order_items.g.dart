// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'po_order_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoOrderItemsFormImpl _$$PoOrderItemsFormImplFromJson(
        Map<String, dynamic> json) =>
    _$PoOrderItemsFormImpl(
      status: json['status'] as String?,
      itemName: json['item_name'] as String,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      netAmount: (json['net_amount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$PoOrderItemsFormImplToJson(
        _$PoOrderItemsFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'item_name': instance.itemName,
      'quantity': instance.quantity,
      'rate': instance.rate,
      'amount': instance.amount,
      'net_amount': instance.netAmount,
    };
