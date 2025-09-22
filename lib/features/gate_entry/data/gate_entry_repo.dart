import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/gate_entry/model/supplier_form.dart';
import 'package:nuevosol/features/gate_entry/model/gate_entry.dart';
import 'package:nuevosol/features/gate_entry/model/purchase_order_form.dart';


abstract interface class GateEntryRepo {
AsyncValueOf<List<GateEntry>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  );  

  AsyncValueOf<List<PurchaseOrderForm>> fetchPONumbers(String name);
  AsyncValueOf<List<SupplierForm>> fetchSuppliers(String name);

  AsyncValueOf<Pair<String, String>> createGateEntry(GateEntry form);
  
  // AsyncValueOf<Pair<String, String>> submitGateEntry(NewGateEntryForm form);
}
