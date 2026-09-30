import 'package:nuevosol/features/packing/model/packing_model.dart';

/// Args for opening Packing Posting (`newPacking`).
///
/// [asNewCreate] = true seeds the form with [packing] field values but keeps
/// [PackingView.create] so the Create button is shown (not Next).
class PackingFormArgs {
  const PackingFormArgs({
    required this.packing,
    this.asNewCreate = false,
  });

  /// Prefill create form from a completed packing / QI flow.
  factory PackingFormArgs.createFromPrevious(PackingModel source) {
    return PackingFormArgs(
      packing: PackingModel(
        company: source.company,
        machineNameNo: source.machineNameNo,
        selectProcess: source.selectProcess ?? 'Packing',
        rawMaterialName: source.rawMaterialName,
        uom: source.uom,
        bomItem: source.bomItem,
        bomQtyItem: source.bomQtyItem,
        okQty: source.okQty,
        rejectedQty: source.rejectedQty,
        totalQty: source.totalQty,
        okQtyWarehouse: source.okQtyWarehouse,
        rejectedQtyWarehouse: source.rejectedQtyWarehouse,
        batchNo: source.batchNo,
        operatorName: source.operatorName,
        qualityInspectionTemplate: source.qualityInspectionTemplate,
      ),
      asNewCreate: true,
    );
  }

  final PackingModel packing;
  final bool asNewCreate;
}
