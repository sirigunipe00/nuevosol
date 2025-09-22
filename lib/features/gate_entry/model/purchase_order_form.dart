
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_form.freezed.dart';
part 'purchase_order_form.g.dart';

@freezed
class PurchaseOrderForm with _$PurchaseOrderForm {
  const factory PurchaseOrderForm({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'workflow_state') String? workFlowState,
    @JsonKey(name: 'supplier_name') String? supplierName,
    @JsonKey(name: 'schedule_date',defaultValue: '') String? scheduleDate,
  }) = _PurchaseOrderForm;
factory PurchaseOrderForm.fromJson(Map<String, dynamic> json) => _$PurchaseOrderFormFromJson(json);
}