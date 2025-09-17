import 'package:nuevosol/core/model/pair.dart';
import 'package:nuevosol/core/utils/utils.dart';
import 'package:nuevosol/features/gate_entry/model/gate_entry_form.dart';
import 'package:nuevosol/features/gate_entry/model/purchase_order_form.dart';

abstract interface class GateEntryRepo {
  AsyncValueOf<List<GateEntryForm>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
    
  );



  AsyncValueOf<Pair<String,String>> createGateEntry(GateEntryForm form);
  AsyncValueOf<Pair<String,String>> submitGateEntry(GateEntryForm form);
    AsyncValueOf<List<PurchaseOrderForm>> fetchPurchaseOrders(String name);

}
