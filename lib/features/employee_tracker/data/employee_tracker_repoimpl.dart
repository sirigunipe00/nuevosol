import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/employee_tracker/data/employee_tracker_repo.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_list.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_model.dart';
import 'package:nuevosol/features/employee_tracker/model/location_list.dart';
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
  AsyncValueOf<Pair<String, String>> createEmployee(EmployeeTracker form) async {
    final formJson = form.toJson();

    formJson['status'] = 'Draft';


    final config = RequestConfig(
      url: Urls.createGateEntry,
      parser: (json) {
        final data = json['message']['data']['name'] as String;
        return Pair(data, '');
      },

      body: jsonEncode({
        // 'po_number': form.purchaseOrder,
        // 'invoice_amount': form.invoiceAmount,
      //   'invoice_date': form.vendorInvoiceDate,
      //   'entry_date': form.gateEntryDate,
      //   'vendor_invoice_no': form.vendorInvoiceNo,
      //   'vehicle_photo':
      //       vehiclefrontcompressedBytes == null
      //           ? null
      //           : base64Encode(vehiclefrontcompressedBytes),
      //   'invoice_photo':
      //       invocecompressedBytes == null
      //           ? null
      //           : base64Encode(invocecompressedBytes),
      //   'custom_weighment_slip':
      //       weightmentcompressedBytes == null
      //           ? null
      //           : base64Encode(weightmentcompressedBytes),
      //   'vehicle_no': form.vehicleNo,
      //   'invoice_qty': form.invoiceQuantity,
      //   'supplier': form.customSupplier,
      //   'created_time': form.createTime,
      //   'remarks': form.remarks,
      //   'custom_unit_1': form.customeUnit1,
      //   'by_mobile_app': 1,
      // //   'custom_unit_2':form.customeUnit2,
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('requestConfig.....$config');

    final response = await post(config);
    return response.processAsync((r) async {
      return right(r.data!);
    });
  }
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