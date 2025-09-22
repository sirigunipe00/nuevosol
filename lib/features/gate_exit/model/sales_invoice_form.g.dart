// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_invoice_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesInvoiceFormImpl _$$SalesInvoiceFormImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesInvoiceFormImpl(
      name: json['name'] as String?,
      customer: json['customer'] as String?,
      postingDate: json['posting_date'] as String? ?? '',
      dueDate: json['due_date'] as String? ?? '',
      grandTotal: (json['grand_total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SalesInvoiceFormImplToJson(
        _$SalesInvoiceFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'customer': instance.customer,
      'posting_date': instance.postingDate,
      'due_date': instance.dueDate,
      'grand_total': instance.grandTotal,
    };
