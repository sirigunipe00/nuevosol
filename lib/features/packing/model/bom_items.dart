import 'package:freezed_annotation/freezed_annotation.dart';

part 'bom_items.freezed.dart';
part 'bom_items.g.dart';

@freezed
class BomItems with _$BomItems {
  const factory BomItems({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation') String? creation,
    @JsonKey(name: 'modified') String? modified,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docstatus,
    @JsonKey(name: 'idx') int? idx,
    @JsonKey(name: 'parent') String? parent,
    @JsonKey(name: 'parentfield') String? parentfield,
    @JsonKey(name: 'parenttype') String? parenttype,

    @JsonKey(name: 'item_code') String? itemCode,
    @JsonKey(name: 'item_name') String? itemName,
    @JsonKey(name: 'operation') String? operation,

    @JsonKey(name: 'custom_component_scanning')
    String? customComponentScanning,

    @JsonKey(name: 'custom_package_qty')
    double? customPackageQty,

    @JsonKey(name: 'custom_no_of_scan')
    double? customNoOfScan,

    @JsonKey(name: 'do_not_explode')
    int? doNotExplode,

    @JsonKey(name: 'bom_no')
    String? bomNo,

    @JsonKey(name: 'source_warehouse')
    String? sourceWarehouse,

    @JsonKey(name: 'allow_alternative_item')
    int? allowAlternativeItem,

    @JsonKey(name: 'is_stock_item')
    int? isStockItem,

    @JsonKey(name: 'description')
    String? description,

    @JsonKey(name: 'image')
    String? image,

    @JsonKey(name: 'qty')
    double? qty,

    @JsonKey(name: 'uom')
    String? uom,

    @JsonKey(name: 'stock_qty')
    double? stockQty,

    @JsonKey(name: 'stock_uom')
    String? stockUom,

    @JsonKey(name: 'conversion_factor')
    double? conversionFactor,

    @JsonKey(name: 'rate')
    double? rate,

    @JsonKey(name: 'base_rate')
    double? baseRate,

    @JsonKey(name: 'amount')
    double? amount,

    @JsonKey(name: 'base_amount')
    double? baseAmount,

    @JsonKey(name: 'qty_consumed_per_unit')
    double? qtyConsumedPerUnit,

    @JsonKey(name: 'has_variants')
    int? hasVariants,

    @JsonKey(name: 'include_item_in_manufacturing')
    int? includeItemInManufacturing,

    @JsonKey(name: 'original_item')
    String? originalItem,

    @JsonKey(name: 'sourced_by_supplier')
    int? sourcedBySupplier,
  }) = _BomItems;

  factory BomItems.fromJson(Map<String, dynamic> json) =>
      _$BomItemsFromJson(json);
}