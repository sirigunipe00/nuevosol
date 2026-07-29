// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackingModelImpl _$$PackingModelImplFromJson(Map<String, dynamic> json) =>
    _$PackingModelImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creation: json['creation'] as String?,
      modified: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docstatus: (json['docstatus'] as num?)?.toInt(),
      idx: (json['idx'] as num?)?.toInt(),
      company: json['company'] as String?,
      machineNameNo: json['machine_name_no'] as String?,
      selectProcess: json['select_process'] as String?,
      productionStartTime: json['production_start_time'] as String?,
      productionEndTime: json['production_end_time'] as String?,
      rawMaterialName: json['raw_material_name'] as String?,
      uom: json['uom'] as String?,
      bomItem: json['bom_item'] as String?,
      bomQtyItem: (json['bom_qty_item'] as num?)?.toDouble(),
      okQty: (json['ok_qty'] as num?)?.toDouble(),
      rejectedQty: (json['rejected_qty'] as num?)?.toDouble(),
      totalQty: (json['total_qty'] as num?)?.toDouble(),
      okQtyWarehouse: json['ok_qty_warehouse'] as String?,
      rejectedQtyWarehouse: json['rejected_qty_warehouse'] as String?,
      batchNo: json['batch_no'] as String?,
      operatorName: (json['operator_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      amendedFrom: json['amended_from'] as String?,
    );

Map<String, dynamic> _$$PackingModelImplToJson(_$PackingModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creation,
      'modified': instance.modified,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docstatus,
      'idx': instance.idx,
      'company': instance.company,
      'machine_name_no': instance.machineNameNo,
      'select_process': instance.selectProcess,
      'production_start_time': instance.productionStartTime,
      'production_end_time': instance.productionEndTime,
      'raw_material_name': instance.rawMaterialName,
      'uom': instance.uom,
      'bom_item': instance.bomItem,
      'bom_qty_item': instance.bomQtyItem,
      'ok_qty': instance.okQty,
      'rejected_qty': instance.rejectedQty,
      'total_qty': instance.totalQty,
      'ok_qty_warehouse': instance.okQtyWarehouse,
      'rejected_qty_warehouse': instance.rejectedQtyWarehouse,
      'batch_no': instance.batchNo,
      'operator_name': instance.operatorName,
      'amended_from': instance.amendedFrom,
    };
