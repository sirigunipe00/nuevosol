import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/gate_exit/data/gate_exit_repo.dart';
import 'package:nuevosol/features/gate_exit/model/gate_exit.dart';
import 'package:nuevosol/features/gate_exit/model/sales_invoice_form.dart';
import 'package:path/path.dart' as p;


@LazySingleton(as: GateExitRepo)
class GateExitRepoImpl extends BaseApiRepository implements GateExitRepo {
  const GateExitRepoImpl(super.client);

  @override
  AsyncValueOf<List<GateExit>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  ) async {
    final filters = <List<dynamic>>[];

    if (docStatus != null && docStatus != 2) {
      filters.add(['docstatus', '=', docStatus]);
    }

    if (search != null && search.isNotEmpty) {
      filters.add(['name', 'like', '%$search%']);
    }


    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];
        final listData = data as List<dynamic>;
        return listData.map((e) => GateExit.fromJson(e)).toList();
      },
      reqParams: {
        'filters': jsonEncode(filters),
        'limit_start': start,
        'limit': 20,
        'order_by': 'creation desc',
        'doctype': 'Gate Exit',
        'fields': jsonEncode(['*']),
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('requestConfig....$requestConfig');

    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }
@override
  AsyncValueOf<Pair<String, String>> createGateExit(GateExit form) async {
    final formJson = form.toJson();

    formJson['status'] = 'Draft';
    Uint8List? vehiclefrontcompressedBytes;
    Uint8List? vehiclebackcompressedBytes;
    

    if (form.vehiclePhotoImg != null) {
      final filePath = form.vehiclePhotoImg!.path;
      vehiclefrontcompressedBytes = await FlutterImageCompress.compressWithFile(
        filePath,
        quality: 50,
      );
    } else if (form.vehiclePhoto != null) {
      vehiclefrontcompressedBytes = await fetchAndConvertToBase64(
        form.vehiclePhoto ?? '',
      );
    }

    if (form.vehicleBackPhotoImg != null) {
      final filePath = form.vehicleBackPhotoImg!.path;
      vehiclebackcompressedBytes = await FlutterImageCompress.compressWithFile(
        filePath,
        quality: 50,
      );
    } else if (form.vehicleBackPhoto != null) {
      vehiclefrontcompressedBytes = await fetchAndConvertToBase64(
        form.vehicleBackPhoto ?? '',
      );
    }

    final cleanedJson = removeNullValues(form.toJson());
    cleanedJson['status'] = 'Draft';

    final config = RequestConfig(
      url: Urls.createGateExit,
      parser: (json) {
        final data = json['message']['data']['name'] as String;
        return Pair(data, '');
      },

      body: jsonEncode({
        'sales_invoice_scanner': form.salesInvoice,
        'vehicle_no': form.vehicleNo,
        'custom_customer_name': form.customerName,
        'vehicle_back_photo':
            vehiclebackcompressedBytes == null
                ? null
                : base64Encode(vehiclebackcompressedBytes),
        'vehicle_photo':
            vehiclefrontcompressedBytes == null
                ? null
                : base64Encode(vehiclefrontcompressedBytes),

        'exit_date': form.gateExitDate,
        'custom_gate_exit_time': form.gateExitTime,
        // 'quantity': form.quantity,
        // 'amount': form.amount,
        'remarks': form.remarks,
        'by_mobile_app': 1,
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    final response = await post(config);
    $logger.devLog('response.....$config');
    return response.processAsync((r) async {
      return right(Pair(r.data!.first, r.data!.second));
    });
  }


  @override
  AsyncValueOf<List<SalesInvoiceForm>> fetchSalesInvoice(String name) async {
    return await executeSafely(() async {
      //     final plantName = user().plantName;
       final filters = [
      ['docstatus', '=', 1], 

      // if (name.isNotEmpty) ['customer', 'like', '%$name%'],
    ];

      final reqParams = {
        'limit': 20,
          'oreder_by': 'create desc',
          'doctype': 'Sales Invoice',
          'fields': ['*'],
          'filters': jsonEncode(filters), 

      };
     
      // if (plantName != null && plantName.isNotEmpty) {
      //   reqParams['filters'] = [
      //     ['company', '=', plantName],
      //   ];
      // }
     
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => SalesInvoiceForm.fromJson(e)).toList();
        },
        reqParams:reqParams,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      $logger.devLog('salesinvoice.....$config');
      final response = await get(config);
      return response.processAsync((r) async {
        return right((r.data!));
      });
    });
  }
    Future<Uint8List?> fetchAndConvertToBase64(String relativePath) async {
    if (p.extension(relativePath).isEmpty) {
      return null;
    }

    final String url = 'http://65.21.176.38:8000$relativePath';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Uint8List bytes = response.bodyBytes;
      return bytes;
    } else {
      throw Exception('Failed to load file: ${response.statusCode}');
    }
  }
  

  
}
