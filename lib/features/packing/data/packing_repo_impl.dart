import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/packing/data/packing_repo.dart';
import 'package:nuevosol/features/packing/model/bom.dart';
import 'package:nuevosol/features/packing/model/bom_items.dart';
import 'package:nuevosol/features/packing/model/component_scanning_data.dart';
import 'package:nuevosol/features/packing/model/finished_component.dart';
import 'package:nuevosol/features/packing/model/machine_no.dart';
import 'package:nuevosol/features/packing/model/operator.dart';
import 'package:nuevosol/features/packing/model/packing_model.dart';
import 'package:nuevosol/features/packing/model/packing_scan_result.dart';
import 'package:nuevosol/features/packing/model/select_process.dart';

@LazySingleton(as: PackingRepo)
class PackingRepoImpl extends BaseApiRepository implements PackingRepo {
  const PackingRepoImpl(super.client);

  @override
  AsyncValueOf<List<PackingModel>> fetchPacking(
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
        return data.map((e) => PackingModel.fromJson(e)).toList();
      },
      reqParams: {
        'filters': jsonEncode(filters),
        'limit_start': start,
        'limit': 20,

        'order_by': 'creation desc',
        'doctype': 'Production Posting - FC and Packing',
        'fields': jsonEncode(['*']),
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('requestConfig....$requestConfig');

    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<Pair<String, String>> createPacking(PackingModel form) async {
    final config = RequestConfig(
      url: Urls.createPacking,

      parser: (json) {
        final messageObj = json['message'] as Map<String, dynamic>? ?? {};
        final data = messageObj['data'] as Map<String, dynamic>?;
        final name = data?['name'] as String? ?? '';
        final message = messageObj['message']?.toString() ?? '';
        return Pair(message, name);
      },

      body: jsonEncode({
        'company': form.company,
        'operator_name': form.operatorName ?? [],
        'machine_name_no': form.machineNameNo,
        'select_process': form.selectProcess,
        'production_start_time': DateFormat(
          'yyyy-MM-dd HH:mm:ss',
        ).format(DateTime.now()),
        'raw_material_name': form.rawMaterialName,
        'uom': form.uom,
        'bom_item': form.bomItem,
        'ok_qty': form.okQty,
        'rejected_qty': 0,
      }),

      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    final response = await post(config);
    $logger.devLog('config.....$config');

    return response.fold(
      (failure) => left(failure),
      (r) {
        if (r.error != null || r.data == null) {
          return left(
            Failure(
              title: 'Error',
              error: r.error ?? 'Failed to create Packing',
            ),
          );
        }
        return right(r.data!);
      },
    );
  }


  @override
  AsyncValueOf<List<MachineNo>> fetchMachine(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => MachineNo.fromJson(e)).toList();
        },
        reqParams: {
          'limit_page_length': 'None',
          'order_by': 'creation desc',
          'doctype': 'Workstation',
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
  AsyncValueOf<List<Bom>> fetchBom(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => Bom.fromJson(e)).toList();
        },
        reqParams: {
          'limit_page_length': 'None',
          'order_by': 'creation desc',
          'filters': jsonEncode([
            ['item', '=', name],
            ['is_active', '=', 1],
          ]),
          'doctype': 'BOM',
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
  AsyncValueOf<List<FinishedComponent>> fetchFinished(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => FinishedComponent.fromJson(e)).toList();
        },
        reqParams: {
          'limit_page_length': 'None',
          'order_by': 'creation desc',
          'doctype': 'Item',
          'filters': jsonEncode([
            ['default_bom', 'is', 'set'],
          ]),
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
  AsyncValueOf<List<SelectProcess>> fetchProcess(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => SelectProcess.fromJson(e)).toList();
        },
        reqParams: {
          'limit_page_length': 'None',
          'order_by': 'creation desc',
          'doctype': 'Operation',
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
  AsyncValueOf<List<Operator>> fetchOperator(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => Operator.fromJson(e)).toList();
        },
        reqParams: {
          'filters': [
            ['parent', '=', name],
          ],
          'limit_start': 0,
          'limit_page_length': 'None',
          'oreder_by': 'creat desc',
          'doctype': 'Operator name',
          'parent': 'Production Posting - FC and Packing',
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
  AsyncValueOf<List<BomItems>> fetchBomItems(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => BomItems.fromJson(e)).toList();
        },
        reqParams: {
          'filters': [
            ['parent', '=', name],
          ],
          'limit_start': 0,
          'limit_page_length': 'None',
          'oreder_by': 'creat desc',
          'doctype': 'BOM Item',
          'parent': 'BOM',
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
  AsyncValueOf<List<ComponentScanningData>> fetchComponentScanningData(
    String productionPosting,
  ) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,
        parser: (json) {
          final data = json['message'] as List<dynamic>? ?? [];
          return data
              .map(
                (e) => ComponentScanningData.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
        },
        reqParams: {
          'filters': jsonEncode([
            ['production_posting_fc_and_packing', '=', productionPosting],
          ]),
          'limit_page_length': 'None',
          'order_by': 'creation asc',
          'doctype': 'Component Scanning Data',
          'fields': ['*'],
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await get(config);
      $logger.devLog('fetchComponentScanningData.....$response');
      return response.processAsync((r) async {
        return right(r.data!);
      });
    });
  }

  @override
  AsyncValueOf<PackingScanResult> packingQrScanning({
    required String productionPosting,
    required String bom,
    required String item,
    required String scannedValue,
  }) async {
    final config = RequestConfig(
      url: Urls.packingqrScanning,
      parser: (json) {
        final messageObj = json['message'] as Map<String, dynamic>? ?? {};
        return PackingScanResult.fromMessage(messageObj);
      },
      body: jsonEncode({
        'production_posting_fc_and_packing': productionPosting,
        'bom': bom,
        'item': item,
        'scanned_value': scannedValue,
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    final response = await post(config);
    $logger.devLog('packingQrScanning config.....$config');

    return response.fold(
      (failure) => left(failure),
      (r) {
        if (r.error != null || r.data == null) {
          return left(
            Failure(
              title: 'Scan Error',
              error: r.error ?? 'Failed to validate scan',
            ),
          );
        }
        return right(r.data!);
      },
    );
  }
}
