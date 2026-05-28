import 'package:nuevosol/core/model/pair.dart';
import 'package:nuevosol/core/utils/typedefs.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_list.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_model.dart';
import 'package:nuevosol/features/employee_tracker/model/location_list.dart';
import 'package:nuevosol/features/employee_tracker/model/reason_exit_type.dart';


abstract interface class EmployeeRepo {
AsyncValueOf<List<EmployeeTracker>> fetchEmployees(
    int start,
    String? docStatus,
    String? search,
  );  
    AsyncValueOf<List<EmployeeList>> fetchEmployeeList(String name);
    AsyncValueOf<List<ReasonExitType>> reasonExit(String name);
    AsyncValueOf<List<LocationList>> locationList(String name);

  AsyncValueOf<Pair<String, String>> createEmployee(EmployeeTracker form);
   AsyncValueOf<Pair<String, String>> updateEmployee(EmployeeTracker form);
   AsyncValueOf<Pair<String,String>> approveEmployee(EmployeeTracker form);
   AsyncValueOf<Pair<String,String>> rejectEmployee(EmployeeTracker form);
}