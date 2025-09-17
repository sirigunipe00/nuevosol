import 'package:injectable/injectable.dart';
import 'package:nuevosol/core/cubit/infinite_list/infinite_list_cubit.dart';
import 'package:nuevosol/core/cubit/network_request/network_request_cubit.dart';
import 'package:nuevosol/core/di/injector.dart';
import 'package:nuevosol/core/model/pair.dart';
import 'package:nuevosol/features/logistic_request/model/logistic_planning_form.dart';
import 'package:nuevosol/features/vehicle_reporting/data/vehicle_reporting_repo.dart';
import 'package:nuevosol/features/vehicle_reporting/model/vehicle_reporting_form.dart';

typedef VehicleReportingCubit =
    InfiniteListCubit<VehicleReportingForm, Pair<int?, String?>, Pair<int?, String?>>;
typedef VehicleReportingtState = InfiniteListState<VehicleReportingForm>;

typedef LogisticRequest
    = NetworkRequestCubit<List<LogisticPlanningForm>, String>;
typedef LogisticRequestState
    = NetworkRequestState<List<LogisticPlanningForm>>;


@lazySingleton
class VehicleBlocProvider {
  const VehicleBlocProvider(this.repo);

  final VehicleReportingRepo repo;

  static VehicleBlocProvider get() => $sl.get<VehicleBlocProvider>();

  VehicleReportingCubit fetchVehicle() => VehicleReportingCubit(
    requestInitial:
        (params, state) => repo.fetchVehicles(0, params!.first, params.second),
    requestMore:
        (params, state) =>
            repo.fetchVehicles(state.curLength, params!.first, params.second),
  );
    LogisticRequest logisticList() => LogisticRequest(
    onRequest: (params, state) => repo.fetchLogistics(params ?? ''),
  );
}