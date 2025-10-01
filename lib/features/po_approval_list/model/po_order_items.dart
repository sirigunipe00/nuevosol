import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_order_items.freezed.dart';
part 'po_order_items.g.dart';

@freezed
class PoOrderItemsForm with _$PoOrderItemsForm {
  const factory PoOrderItemsForm({
    String? status,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'quantity',defaultValue: 0.0) required  double quantity,
    @JsonKey(name: 'rate',defaultValue: 0.0) required double rate,
    @JsonKey(name: 'amount',defaultValue: 0.0) required double amount,
    @JsonKey(name: 'net_amount',defaultValue: 0.0)required double netAmount,
  }) = _PoOrderItemsForm;

  factory PoOrderItemsForm.fromJson(Map<String, Object?> json)
      => _$PoOrderItemsFormFromJson(json);
}