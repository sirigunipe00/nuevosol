import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:nuevosol/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/features/gate_entry/data/gate_entry_repo.dart';
import 'package:nuevosol/features/gate_entry/model/supplier_form.dart';
import 'package:nuevosol/features/gate_entry/model/gate_entry.dart';
import 'package:nuevosol/features/gate_entry/model/purchase_order_form.dart';
import 'package:path/path.dart' as p;

@LazySingleton(as: GateEntryRepo)
class GateEntryRepoImpl extends BaseApiRepository implements GateEntryRepo {
  const GateEntryRepoImpl(super.client);

 @override
  AsyncValueOf<List<GateEntry>> fetchEntries(
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
        final data = json['message'] as List<dynamic>;
        return data.map((e) => GateEntry.fromJson(e)).toList();
      },
      reqParams: {
        'filters': jsonEncode(filters),
        'limit_start': start,
        'limit': 20,

        'order_by': 'creation desc',
        'doctype': 'Gate Entry',
        'fields': jsonEncode(['*']),
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('requestConfig....$requestConfig');

    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<List<SupplierForm>> fetchSuppliers(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => SupplierForm.fromJson(e)).toList();
        },
        reqParams: {
          'limit': 20,
          'order_by': 'creation desc',
          'doctype': 'Supplier',
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
  AsyncValueOf<Pair<String, String>> createGateEntry(GateEntry form) async {
    final formJson = form.toJson();

    formJson['status'] = 'Draft';

    Uint8List? vehiclefrontcompressedBytes;
    // Uint8List? vehiclebackcompressedBytes;
    Uint8List? invocecompressedBytes;

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

    // if (form.vehicleBackPhotoImg != null) {
    //   final filePath = form.vehicleBackPhotoImg!.path;
    //   vehiclebackcompressedBytes = await FlutterImageCompress.compressWithFile(
    //     filePath,
    //     quality: 50,
    //   );
    // } else if (form.vehicleBackPhoto != null) {
    //   vehiclebackcompressedBytes = await fetchAndConvertToBase64(
    //     form.vehicleBackPhoto ?? '',
    //   );
    // }

    if (form.invoicePhotoImg != null) {
      final filePath = form.invoicePhotoImg!.path;
      invocecompressedBytes = await FlutterImageCompress.compressWithFile(
        filePath,
        quality: 50,
      );
    } else if (form.invoicePhoto != null) {
      invocecompressedBytes = await fetchAndConvertToBase64(
        form.invoicePhoto ?? '',
      );
    }

    final config = RequestConfig(
      url: Urls.createGateEntry,
      parser: (json) {
        final data = json['message']['data']['name'] as String;
        return Pair(data, '');
      },

      body: jsonEncode({
        'po_number': form.purchaseOrder,
        'invoice_amount': form.invoiceAmount,
        'invoice_date': form.vendorInvoiceDate,
        'entry_date': form.gateEntryDate,
        'vendor_invoice_no': form.vendorInvoiceNo,
        'vehicle_photo':
            vehiclefrontcompressedBytes == null
                ? null
                : base64Encode(vehiclefrontcompressedBytes),
        'invoice_photo':
            invocecompressedBytes == null
                ? null
                : base64Encode(invocecompressedBytes),
        // 'vehicle_back_photo':
        //     vehiclebackcompressedBytes == null
        //         ? null
        //         : base64Encode(vehiclebackcompressedBytes),
        'vehicle_no': form.vehicleNo,
        'invoice_qty': form.invoiceQuantity,
        'supplier': form.customSupplier,
        'created_time': form.createTime,
        'remarks': form.remarks,
        'custom_unit_1': form.customeUnit1,
      //   'custom_unit_2':form.customeUnit2,
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
  AsyncValueOf<List<PurchaseOrderForm>> fetchPONumbers(String name) async {
    return await executeSafely(() async {
    

    //   final plantName = user().plantName;
    //    final filters = <List<dynamic>>[];

    // if (plantName != null && plantName.isNotEmpty) {
    //   filters.add(['company', '=', plantName]);
    // }
       final filters = [
      ['docstatus', '=', 1], 
      // if (name.isNotEmpty) ['supplier', 'like', '%$name%'],
    ];

      final reqParams = {
      'limit': 20,
      'order_by': 'creation desc',
      'doctype': 'Purchase Order',
      'fields': jsonEncode(['*']),   
      'filters': jsonEncode(filters), 
    };

     

      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => PurchaseOrderForm.fromJson(e)).toList();
        },

        reqParams: reqParams,

        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
            $logger.devLog('requestconfif......$config');


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
