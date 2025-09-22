import 'package:nuevosol/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/features/gate_entry/data/gate_entry_repo.dart';
import 'package:nuevosol/features/gate_entry/model/supplier_form.dart';
import 'package:nuevosol/features/gate_entry/model/gate_entry.dart';
import 'package:nuevosol/features/gate_entry/model/purchase_order_form.dart';

typedef GateEntriesCubit =
    InfiniteListCubit<GateEntry, Pair<int?, String?>, Pair<int?, String?>>;
typedef GateEntriesCubitState = InfiniteListState<GateEntry>;



typedef PurchaseOrders = NetworkRequestCubit<List<PurchaseOrderForm>, String>;
typedef PurchaseOrdersState = NetworkRequestState<List<PurchaseOrderForm>>;

typedef SupplierList
    = NetworkRequestCubit<List<SupplierForm>, String>;
typedef SupplierState
    = NetworkRequestState<List<SupplierForm>>;

@lazySingleton
class GateEntryBlocProvider {
  const GateEntryBlocProvider(this.repo);

  final GateEntryRepo repo;

  static GateEntryBlocProvider get() => $sl.get<GateEntryBlocProvider>();

  GateEntriesCubit fetchGateEntries() => GateEntriesCubit(
  
    requestInitial:
        (params, state) => repo.fetchEntries(0, params!.first, params.second),
    requestMore:
        (params, state) =>
            repo.fetchEntries(state.curLength, params!.first, params.second),
  );

  

  PurchaseOrders fetchPONumbers() => PurchaseOrders(
    onRequest: (params, state) => repo.fetchPONumbers(params ?? ''),
  );
   SupplierList supplietList() => SupplierList(
    onRequest: (params, state) => repo.fetchSuppliers(params ?? ''),
  );
}