import 'package:nuevosol/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/features/employee_tracker/data/employee_tracker_repo.dart';
import 'package:nuevosol/features/employee_tracker/model/attachement.dart';
import 'package:nuevosol/features/employee_tracker/model/department.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_list.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_model.dart';
import 'package:nuevosol/features/employee_tracker/model/event_tracking.dart';
import 'package:nuevosol/features/employee_tracker/model/location_list.dart';
import 'package:nuevosol/features/employee_tracker/model/reason_exit_type.dart';


typedef EmployeeEntriesCubit =
    InfiniteListCubit<EmployeeTracker, Triple<String?, String?,String?>, Triple<String?, String?,String?>>;
typedef EmployeeEntriesCubitState = InfiniteListState<EmployeeTracker>;
typedef EmployeeListCubit = NetworkRequestCubit<List<EmployeeList>, String>;
typedef EmployeeListState = NetworkRequestState<List<EmployeeList>>;

typedef ReasonExitCubit = NetworkRequestCubit<List<ReasonExitType>, String>;
typedef ReasonExitState = NetworkRequestState<List<ReasonExitType>>;
typedef LocationCubit = NetworkRequestCubit<List<LocationList>, String>;
typedef LocationState = NetworkRequestState<List<LocationList>>;

typedef EventTrackingCubit = NetworkRequestCubit<List<EventTracking>, String>;
typedef EventTrackingState = NetworkRequestState<List<EventTracking>>;

typedef AttachementCubit = NetworkRequestCubit<List<AttachementInvoices>, String>;
typedef AttachementState = NetworkRequestState<List<AttachementInvoices>>;

typedef DepartmentCubit = NetworkRequestCubit<List<Department>, String>;
typedef DepartmentState = NetworkRequestState<List<Department>>;

@lazySingleton
class EmployeeBlocProvider {
  const EmployeeBlocProvider(this.repo);

  final EmployeeRepo repo;

  static EmployeeBlocProvider get() => $sl.get<EmployeeBlocProvider>();

  EmployeeEntriesCubit fetchEmployeeEntries() => EmployeeEntriesCubit(
  
    requestInitial:
        (params, state) => repo.fetchEmployees(0, params!.first, params.second,params.third),
    requestMore:
        (params, state) =>
            repo.fetchEmployees(state.curLength, params!.first, params.second,params.third),
  );
  EmployeeListCubit fetchEmployeeList() => EmployeeListCubit(
    onRequest: (params, state) => repo.fetchEmployeeList(params ?? ''),
  );
  ReasonExitCubit fetchReasonExit() => ReasonExitCubit(
    onRequest: (params, state) => repo.reasonExit(params ?? ''),
  );
  LocationCubit getLocation() => LocationCubit(
    onRequest: (params, state) => repo.locationList(params ?? ''),
  );
  EventTrackingCubit getEventTracking() => EventTrackingCubit(
    onRequest: (params, state) => repo.fetchTracking(params ?? ''),
  );
  AttachementCubit getAttachments() => AttachementCubit(
    onRequest: (params, state) => repo.fetchAttachments(params ?? ''),
  );
   DepartmentCubit getDepartments() => DepartmentCubit(
    onRequest: (params, state) => repo.fetchDepartment( params ?? ''),
  );
}