import 'package:freezed_annotation/freezed_annotation.dart';

part 'packing_model.freezed.dart';
part 'packing_model.g.dart';

@freezed
class PackingModel with _$PackingModel {
  const factory PackingModel({
    String? status,

    @JsonKey(name: 'name') String? name,

    @JsonKey(name: 'owner') String? owner,

    @JsonKey(name: 'creation') String? creation,

    @JsonKey(name: 'modified') String? modified,

    @JsonKey(name: 'modified_by') String? modifiedBy,

    @JsonKey(name: 'docstatus') int? docstatus,

    @JsonKey(name: 'idx') int? idx,

    @JsonKey(name: 'company') String? company,

    @JsonKey(name: 'machine_name_no') String? machineNameNo,

    @JsonKey(name: 'select_process') String? selectProcess,

    @JsonKey(name: 'production_start_time') String? productionStartTime,

    @JsonKey(name: 'production_end_time') String? productionEndTime,

    @JsonKey(name: 'raw_material_name') String? rawMaterialName,

    @JsonKey(name: 'uom') String? uom,

    @JsonKey(name: 'bom_item') String? bomItem,

    @JsonKey(name: 'bom_qty_item') double? bomQtyItem,

    @JsonKey(name: 'ok_qty') double? okQty,

    @JsonKey(name: 'rejected_qty') double? rejectedQty,

    @JsonKey(name: 'total_qty') double? totalQty,

    @JsonKey(name: 'ok_qty_warehouse') String? okQtyWarehouse,

    @JsonKey(name: 'rejected_qty_warehouse') String? rejectedQtyWarehouse,

    @JsonKey(name: 'batch_no') String? batchNo,
    @JsonKey(name: 'operator_name') List<String>? operatorName,

    @JsonKey(name: 'amended_from') String? amendedFrom,
    String? qualityInspectionTemplate,
  }) = _PackingModel;

  factory PackingModel.fromJson(Map<String, dynamic> json) =>
      _$PackingModelFromJson(json);
}
