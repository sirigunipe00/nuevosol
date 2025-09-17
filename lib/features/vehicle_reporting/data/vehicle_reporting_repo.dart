import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/logistic_request/model/logistic_planning_form.dart';
import 'package:nuevosol/features/vehicle_reporting/model/vehicle_reporting_form.dart';

abstract interface class VehicleReportingRepo {
  AsyncValueOf<List<VehicleReportingForm>> fetchVehicles(
    int start,
    int? docStatus,
    String? serach
  );
  AsyncValueOf<Pair<String,String>>  createVehicleReporting(VehicleReportingForm form);
  AsyncValueOf<List<LogisticPlanningForm>> fetchLogistics(String name);
}