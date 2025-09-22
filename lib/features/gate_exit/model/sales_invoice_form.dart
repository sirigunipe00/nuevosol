
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_invoice_form.freezed.dart';
part 'sales_invoice_form.g.dart';

@freezed
class SalesInvoiceForm with _$SalesInvoiceForm {
  const factory SalesInvoiceForm({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'customer') String? customer,
    @JsonKey(name: 'posting_date',defaultValue: '') String? postingDate,
    @JsonKey(name: 'due_date',defaultValue: '') String? dueDate,
    @JsonKey(name: 'grand_total') int? grandTotal,
  }) = _SalesInvoiceForm;
factory SalesInvoiceForm.fromJson(Map<String, dynamic> json) => _$SalesInvoiceFormFromJson(json);
}