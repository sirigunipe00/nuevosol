import 'package:nuevosol/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/features/gate_exit/data/gate_exit_repo.dart';
import 'package:nuevosol/features/gate_exit/model/gate_exit.dart';
import 'package:nuevosol/features/gate_exit/model/sales_invoice_form.dart';

typedef GateExitCubit =
    InfiniteListCubit<GateExit, Pair<int?, String?>, Pair<int?, String?>>;
typedef GateExitCubitState = InfiniteListState<GateExit>;

// typedef GateExitDetails = NetworkRequestCubit<GateExit, String>;
// typedef GateExitDetailsState = NetworkRequestState<GateExit>;

// typedef GetVehicleNumber = NetworkRequestCubit<String?, String>;
// typedef GetVehicleNumberState = NetworkRequestState<String?>;

typedef SalesInvoiceList
    = NetworkRequestCubit<List<SalesInvoiceForm>, String>;
typedef SalesInvoiceState
    = NetworkRequestState<List<SalesInvoiceForm>>;

@lazySingleton
class GateExitBlocProvider {
  const GateExitBlocProvider(this.repo);

  final GateExitRepo repo;

  static GateExitBlocProvider get() => $sl.get<GateExitBlocProvider>();

 GateExitCubit fetchGateExit() => GateExitCubit(
    requestInitial:
        (params, state) => repo.fetchEntries(0, params!.first, params.second),
    requestMore:
        (params, state) =>
            repo.fetchEntries(state.curLength, params!.first, params.second),
  ); 

  // GateExitDetails getDetails() => GateExitDetails(
  //   onRequest: (params, _) => repo.getGateExit(params!),
  // );

  // GetVehicleNumber getVehicleNumber() => GetVehicleNumber(
  //   onRequest: (params, _) => repo.getvehicleNumber(params!),
  // );

  SalesInvoiceList salesInvoiceList() => SalesInvoiceList(
    onRequest: (params, state) => repo.fetchSalesInvoice(params ?? ''),
  );
}