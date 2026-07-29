import 'package:injectable/injectable.dart';
import 'package:nuevosol/core/cubit/infinite_list/infinite_list_cubit.dart';
import 'package:nuevosol/core/cubit/network_request/network_request_cubit.dart';
import 'package:nuevosol/core/di/injector.dart';
import 'package:nuevosol/core/model/pair.dart';
import 'package:nuevosol/features/packing/data/packing_repo.dart';
import 'package:nuevosol/features/packing/model/bom.dart';
import 'package:nuevosol/features/packing/model/bom_items.dart';
import 'package:nuevosol/features/packing/model/component_scanning_data.dart';
import 'package:nuevosol/features/packing/model/finished_component.dart';
import 'package:nuevosol/features/packing/model/machine_no.dart';
import 'package:nuevosol/features/packing/model/operator.dart';
import 'package:nuevosol/features/packing/model/packing_model.dart';
import 'package:nuevosol/features/packing/model/select_process.dart';

typedef PackingCubit =
    InfiniteListCubit<PackingModel, Pair<int?, String?>, Pair<int?, String?>>;
typedef PackingState = InfiniteListState<PackingModel>;
typedef MachineList = NetworkRequestCubit<List<MachineNo>, String>;
typedef MachineState = NetworkRequestState<List<MachineNo>>;
typedef BomCubit = NetworkRequestCubit<List<Bom>, String>;
typedef BomState = NetworkRequestState<List<Bom>>;
typedef FinishedList = NetworkRequestCubit<List<FinishedComponent>, String>;
typedef FinshedState = NetworkRequestState<List<FinishedComponent>>;
typedef SelectProcessList = NetworkRequestCubit<List<SelectProcess>, String>;
typedef SelectProcessState = NetworkRequestState<List<SelectProcess>>;
typedef OperatorCubit = NetworkRequestCubit<List<Operator>, String>;
typedef OperatorState = NetworkRequestState<List<Operator>>;
typedef BomItemsCubit = NetworkRequestCubit<List<BomItems>, String>;
typedef BomItemsState = NetworkRequestState<List<BomItems>>;
typedef ComponentScanningCubit =
    NetworkRequestCubit<List<ComponentScanningData>, String>;
typedef ComponentScanningState =
    NetworkRequestState<List<ComponentScanningData>>;

@lazySingleton
class PackingBlocProvider {
  const PackingBlocProvider(this.repo);

  final PackingRepo repo;

  static PackingBlocProvider get() => $sl.get<PackingBlocProvider>();

  PackingCubit fetchPacking() => PackingCubit(
    requestInitial:
        (params, state) => repo.fetchPacking(0, params!.first, params.second),
    requestMore:
        (params, state) =>
            repo.fetchPacking(state.curLength, params!.first, params.second),
  );

  MachineList fetchMachine() => MachineList(
    onRequest: (params, state) => repo.fetchMachine(params ?? ''),
  );

  BomCubit fetchBom() => BomCubit(
    onRequest: (params, state) => repo.fetchBom(params ?? ''),
  );

  FinishedList fetchFinished() => FinishedList(
    onRequest: (params, state) => repo.fetchFinished(params ?? ''),
  );

  SelectProcessList fetchProcess() => SelectProcessList(
    onRequest: (params, state) => repo.fetchProcess(params ?? ''),
  );

  OperatorCubit fetchOperator() => OperatorCubit(
    onRequest: (params, state) => repo.fetchOperator(params ?? ''),
  );

  BomItemsCubit fetchBomItems() => BomItemsCubit(
    onRequest: (params, state) => repo.fetchBomItems(params ?? ''),
  );

  ComponentScanningCubit fetchComponentScanning() => ComponentScanningCubit(
    onRequest:
        (params, state) => repo.fetchComponentScanningData(params ?? ''),
  );
}
