import 'package:nuevosol/core/model/pair.dart';
import 'package:nuevosol/core/utils/typedefs.dart';
import 'package:nuevosol/features/packing/model/bom.dart';
import 'package:nuevosol/features/packing/model/bom_items.dart';
import 'package:nuevosol/features/packing/model/component_scanning_data.dart';
import 'package:nuevosol/features/packing/model/finished_component.dart';
import 'package:nuevosol/features/packing/model/machine_no.dart';
import 'package:nuevosol/features/packing/model/operator.dart';
import 'package:nuevosol/features/packing/model/packing_model.dart';
import 'package:nuevosol/features/packing/model/packing_scan_result.dart';
import 'package:nuevosol/features/packing/model/select_process.dart';

abstract interface class PackingRepo {
  AsyncValueOf<List<PackingModel>> fetchPacking(
    int start,
    int? docStatus,
    String? search,
  );
  AsyncValueOf<Pair<String, String>> createPacking(PackingModel form);
  AsyncValueOf<List<MachineNo>> fetchMachine(String name);
  AsyncValueOf<List<Bom>> fetchBom(String name);
  AsyncValueOf<List<FinishedComponent>> fetchFinished(String name);
  AsyncValueOf<List<SelectProcess>> fetchProcess(String name);
  AsyncValueOf<List<Operator>> fetchOperator(String name);
  AsyncValueOf<List<BomItems>> fetchBomItems(String name);
  AsyncValueOf<List<ComponentScanningData>> fetchComponentScanningData(
    String productionPosting,
  );
  AsyncValueOf<PackingScanResult> packingQrScanning({
    required String productionPosting,
    required String bom,
    required String item,
    required String scannedValue,
  });
}
