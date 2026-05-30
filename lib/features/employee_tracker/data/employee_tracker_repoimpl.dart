import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/employee_tracker/data/employee_tracker_repo.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_list.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_model.dart';
import 'package:nuevosol/features/employee_tracker/model/event_tracking.dart';
import 'package:nuevosol/features/employee_tracker/model/location_list.dart';
import 'package:nuevosol/features/employee_tracker/model/qr_code.dart';
import 'package:nuevosol/features/employee_tracker/model/reason_exit_type.dart';

@LazySingleton(as: EmployeeRepo)
class EmployeeRepoImpl extends BaseApiRepository implements EmployeeRepo {
  const EmployeeRepoImpl(super.client);

 @override
  AsyncValueOf<List<EmployeeTracker>> fetchEmployees(
    int start,
    String? docStatus,
    String? search,
  ) async {
    final filters = <List<dynamic>>[];

    // if (docStatus != null && docStatus != '2') {
    //   filters.add(['docstatus', '=', docStatus]);
    // }
    if (docStatus != null && docStatus.isNotEmpty && docStatus != '5') {
      filters..add(['workflow_state', '=', docStatus])
      ..add(['docstatus', '!=', 2]);
    }

    if (search != null && search.isNotEmpty) {
      filters.add(['name', 'like', '%$search%']);
    }
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'] as List<dynamic>;
        return data.map((e) => EmployeeTracker.fromJson(e)).toList();
      },
      reqParams: {
        'filters': jsonEncode(filters),
        'limit_start': start,
        'limit': 20,

        'order_by': 'creation desc',
        'doctype': 'Employee Gate Pass',
        'fields': jsonEncode(['*']),
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('requestConfig....$requestConfig');

    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }
  @override
AsyncValueOf<Pair<String, String>> createEmployee(
    EmployeeTracker form) async {

  final config = RequestConfig(
    url: Urls.createEmployee,

    parser: (json) {

      final message =
          json['message'] as String? ?? '';

      final data =
          json['data']
              as Map<String, dynamic>?;

      final name =
          data?['name'] as String? ?? '';

      return Pair(message, name);
    },

    body: jsonEncode({
      'employee': form.employeeNo,
      'hod': form.hod,
      'department': form.department,
      'reason_of_gate_exit':
          form.reasonOfGateExit,
      'from_location': form.fromLocation,
      'to_location': form.toLocation,
      'movement_type': form.movementType,
      'expected_exit_date_time':
          form.expectedExitDateTime,
      'expected_return_date_time':
          form.expectedReturnDateTime,
    }),

    headers: {
      HttpHeaders.contentTypeHeader:
          'application/json',
    },
  );

  final response = await post(config);

  return response.processAsync((r) async {
    return right(r.data!);
  });
}
@override
AsyncValueOf<QrCodeModel> qrData(
   String qrCode,
   String actualDateTime,
   String employeePhoto
) async {
  return executeSafely(() async {
    final config = RequestConfig(
      url: Urls.qrData,
      parser: (json) {
        return QrCodeModel.fromJson(json);
      },
      body: jsonEncode({
        'gate_pass_id': qrCode,
        'actual_date_time': actualDateTime,
        'employee_photo': employeePhoto,
      }),
    );

    final response = await post(config);
    return response.process((r) => right(r.data!));
  });
}
 @override
  AsyncValueOf<List<EventTracking>> fetchTracking(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
  final data = json['message'];
  final listdata = data as List<dynamic>;

  final items = listdata
      .map((e) => EventTracking.fromJson(e))
      .toList();

  items.sort(
    (a, b) => (a.idx ?? 0).compareTo(b.idx ?? 0),
  );

  return items;
},
        reqParams: {
          'filters': [
            ['parent', '=', name],
          ],
          'limit_start': 0,
          'limit_page_length': 'None',
          'oreder_by': 'idx asc',
          'doctype': 'Gate Pass Event',
          'parent': 'Employee Gate Pass',
          'fields': ['*'],
        },

        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await get(config);
      $logger.devLog('response.....$response');
      return response.processAsync((r) async {
        return right((r.data!));
      });
    });
  }
  @override
AsyncValueOf<Pair<String, String>> updateEmployee(
    EmployeeTracker form) async {

  final config = RequestConfig(
    url: Urls.createEmployee,

    parser: (json) {

      final message =
          json['message'] as String? ?? '';

      final data =
          json['data']
              as Map<String, dynamic>?;

      final name =
          data?['name'] as String? ?? '';

      return Pair(message, name);
    },

    body: jsonEncode({
      'gate_pass_id': form.name,
      'state': 'Pending For Approval',
      'employee': form.employeeName,
      'hod': form.hod,
      'department': form.department,
      'reason_of_gate_exit':
          form.reasonOfGateExit,
      'from_location': form.fromLocation,
      'to_location': form.toLocation,
      'movement_type': form.movementType,
      'expected_exit_date_time':
          form.expectedExitDateTime,
      'expected_return_date_time':
          form.expectedReturnDateTime,
    }),
    

    headers: {
      HttpHeaders.contentTypeHeader:
          'application/json',
    },
    
  );
  $logger.devLog('employee....$config');

  final response = await post(config);

  return response.processAsync((r) async {
    return right(r.data!);
  });
}
@override
AsyncValueOf<Pair<String,String>> approveEmployee(EmployeeTracker form) async {
  $logger.devLog('approving employee with name: $form');

  return await executeSafely(() async {

  final config = RequestConfig(
    url: Urls.approveGatePass,
    body: jsonEncode({
      'gate_pass_id': form.name,
    }),
    parser: (json) {
      final message = json['message'] as String? ?? 'Approved';
      final data = json['data']['gate_pass_id'] as String? ?? '';
      return Pair(message, data);
    },
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );
  final response = await post(config);
      $logger.devLog(response);
      return response.process((r) => right(Pair(r.data!.first, r.data!.second)));
});
}

@override
AsyncValueOf<Pair<String, String>> rejectEmployee(EmployeeTracker form) async {
  return await executeSafely(() async {

  $logger.devLog('rejecting employee with name: $form');

  final config = RequestConfig(
    url: Urls.rejectGatePass,
    body: jsonEncode({
      'gate_pass_id': form.name,
      'reject_reason': form.rejectReason,
    }),
    parser: (json) {
      final message = json['message'] as String? ?? 'Rejected';
      final data = json['data']['gate_pass_id'] as String?  ?? '';
      return Pair(message, data);
    },
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );
  final response = await post(config);
      $logger.devLog(response);
      return response.process((r) => right(Pair(r.data!.first, r.data!.second)));
});
}
  //  @override
  // AsyncValueOf<Pair<String, String>> createEmployee(EmployeeTracker form) async {
  //   final formJson = form.toJson();

  //   formJson['status'] = 'Draft';


  //   final config = RequestConfig(
  //     url: Urls.createEmployee,
  //     parser: (json) {
  //       final data = json['message']['data']['name'] as String;
  //       return Pair(data, '');
  //     },

  //     body: jsonEncode({
  //       'employee': form.employeeName,
  //       'hod': form.hod,
  //       'department': form.department,
  //       'reason_of_gate_exit': form.reasonOfGateExit,
  //       'from_location': form.fromLocation,
  //       'to_location': form.toLocation,
  //       'movement_type': form.movementType,
  //       'expected_exit_date_time': form.expectedExitDateTime,
  //       'expected_return_date_time':form.expectedReturnDateTime,
  //     }),
  //     headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  //   );

  //   $logger.devLog('requestConfig.....$config');

  //   final response = await post(config);
  //   return response.processAsync((r) async {
  //     return right(r.data!);
  //   });
  // }
    @override
  AsyncValueOf<List<ReasonExitType>> reasonExit(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => ReasonExitType
      .fromJson(e)).toList();
        },
        reqParams: {
          'limit_page_length': 'None',
          'order_by': 'creation desc',
          'doctype': 'Reason of gate exit',
          'fields': ['*'],
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await get(config);
      $logger.devLog('response.....$response');
      return response.processAsync((r) async {
        return right((r.data!));
      });
    });
  }@override
  AsyncValueOf<List<LocationList>> locationList(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => LocationList.fromJson(e)).toList();
        },
        reqParams: {
          'limit_page_length': 'None',
          'order_by': 'creation desc',
          'doctype': 'Location',
          'fields': ['*'],
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await get(config);
      $logger.devLog('response.....$response');
      return response.processAsync((r) async {
        return right((r.data!));
      });
    });
  }
   @override
  AsyncValueOf<List<EmployeeList>> fetchEmployeeList(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => EmployeeList.fromJson(e)).toList();
        },
        reqParams: {
          'limit_page_length': 'None',
          'order_by': 'creation desc',
          'doctype': 'Employee',
          'fields': ['*'],
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await get(config);
      $logger.devLog('response.....$response');
      return response.processAsync((r) async {
        return right((r.data!));
      });
    });
  }

}