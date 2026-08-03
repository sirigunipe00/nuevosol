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
import 'package:nuevosol/features/packing/model/quality_inspection_reading.dart';
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
    return await executeSafely(() async {
      final submittedFcIds = await _fetchSubmittedInspectionDocumentNos();

      final filters = <List<dynamic>>[];

      if (docStatus == 0) {
        // Draft: packing still open for QI (no submitted inspection lot yet)
        filters.add([
          'docstatus',
          'in',
          [0, 1],
        ]);
        if (submittedFcIds.isNotEmpty) {
          filters.add(['name', 'not in', submittedFcIds]);
        }
      } else if (docStatus == 1) {
        // Submitted: only after quality inspection is submitted
        if (submittedFcIds.isEmpty) {
          return right(<PackingModel>[]);
        }
        filters.add(['name', 'in', submittedFcIds]);
      } else {
        // All: exclude cancelled
        filters.add(['docstatus', '!=', 2]);
      }

      if (search != null && search.isNotEmpty) {
        filters.add(['name', 'like', '%$search%']);
      }

      final requestConfig = RequestConfig(
        url: Urls.getList,
        parser: (json) {
          final data = json['message'] as List<dynamic>? ?? [];
          return data
              .map((e) => PackingModel.fromJson(e as Map<String, dynamic>))
              .toList();
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
      return response.process((r) {
        final submittedSet = submittedFcIds.toSet();
        final list =
            (r.data ?? []).map((packing) {
              final isQiSubmitted = submittedSet.contains(packing.name);
              return packing.copyWith(
                status: isQiSubmitted ? 'Submitted' : 'Draft',
              );
            }).toList();
        return right(list);
      });
    });
  }

  Future<List<String>> _fetchSubmittedInspectionDocumentNos() async {
    final config = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'] as List<dynamic>? ?? [];
        return data
            .map((e) {
              final map = e as Map<String, dynamic>;
              return map['document_no']?.toString() ?? '';
            })
            .where((e) => e.isNotEmpty)
            .toSet()
            .toList();
      },
      reqParams: {
        'fields': jsonEncode(['document_no']),
        'filters': jsonEncode([
          ['docstatus', '=', 1],
          [
            'document_type',
            '=',
            'Production Posting - FC and Packing',
          ],
        ]),
        'doctype': 'Inspection Lot And Decision',
        'limit_page_length': 'None',
        'order_by': 'creation desc',
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    final response = await get(config);
    return response.fold((_) => <String>[], (r) => r.data ?? <String>[]);
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
  AsyncValueOf<Pair<String, String>> submitPacking(String name) async {
    final config = RequestConfig(
      url: Urls.submitPacking,
      parser: (json) {
        final messageObj = json['message'];
        if (messageObj is Map<String, dynamic>) {
          final message = messageObj['message']?.toString() ?? '';
          final data = messageObj['data'] as Map<String, dynamic>?;
          final docNo = data?['name']?.toString() ?? name;
          return Pair(message, docNo);
        }
        return Pair(messageObj?.toString() ?? '', name);
      },
      body: jsonEncode({'name': name}),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('submitPacking....$config');

    final response = await post(config);
    return response.fold(
      (failure) => left(failure),
      (r) {
        if (r.error != null || r.data == null) {
          return left(
            Failure(
              title: 'Error',
              error: r.error ?? 'Failed to submit Packing',
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
          'doctype': 'Workstation Type',
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
      // Parent docs for this packing posting
      final parentConfig = RequestConfig(
        url: Urls.getList,
        parser: (json) {
          final data = json['message'] as List<dynamic>? ?? [];
          return data
              .map((e) => (e as Map<String, dynamic>)['name']?.toString() ?? '')
              .where((name) => name.isNotEmpty)
              .toList();
        },
        reqParams: {
          'filters': jsonEncode([
            ['production_posting_fc_and_packing', '=', productionPosting],
          ]),
          'limit_page_length': 'None',
          'order_by': 'creation asc',
          'doctype': 'Component Scanning Data',
          'fields': jsonEncode(['name']),
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final parentResponse = await get(parentConfig);
      final parentNames = parentResponse.fold<List<String>>(
        (_) => <String>[],
        (r) => r.data ?? <String>[],
      );

      if (parentNames.isEmpty) {
        return right(<ComponentScanningData>[]);
      }

      // Child table rows hold item + scanned_value
      final detailConfig = RequestConfig(
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
            ['parent', 'in', parentNames],
          ]),
          'limit_page_length': 'None',
          'order_by': 'idx asc',
          'doctype': 'Component Scanning Detail',
          'parent': 'Component Scanning Data',
          'fields': ['*'],
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final detailResponse = await get(detailConfig);
      $logger.devLog('fetchComponentScanningDetail.....$detailResponse');
      return detailResponse.processAsync((r) async {
        return right(r.data ?? <ComponentScanningData>[]);
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

  @override
  AsyncValueOf<Pair<String, String>> createInspectionLot(
    String productionPosting,
  ) async {
    final config = RequestConfig(
      url: Urls.createInspectionLot,
      parser: (json) {
        final messageObj = json['message'];
        if (messageObj is Map<String, dynamic>) {
          final message = messageObj['message']?.toString() ?? '';
          final data = messageObj['data'];
          String docNo = '';
          if (data is Map<String, dynamic>) {
            docNo =
                data['name']?.toString() ??
                data['inspection_lot']?.toString() ??
                '';
          } else if (data is String) {
            docNo = data;
          }
          if (docNo.isEmpty) {
            // Some APIs return name at message root
            docNo = messageObj['name']?.toString() ?? '';
          }
          return Pair(message, docNo);
        }
        return Pair(messageObj?.toString() ?? '', '');
      },
      body: jsonEncode({
        'production_posting_fc_and_packing': productionPosting,
        'inspection_type': 'Production Posting - FC and Packing',
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('createInspectionLot....$config');

    final response = await post(config);
    return response.fold(
      (failure) => left(failure),
      (r) {
        if (r.error != null || r.data == null || r.data!.second.isEmpty) {
          return left(
            Failure(
              title: 'Error',
              error: r.error ??
                  (r.data?.first.isNotEmpty == true
                      ? r.data!.first
                      : 'Failed to create Quality Inspection'),
            ),
          );
        }
        return right(r.data!);
      },
    );
  }

  @override
  AsyncValueOf<String?> fetchInspectionLotId(String productionPosting) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,
        parser: (json) {
          final data = json['message'] as List<dynamic>? ?? [];
          if (data.isEmpty) return null;
          final first = data.first as Map<String, dynamic>;
          return first['name']?.toString();
        },
        reqParams: {
          'fields': ['name'],
          'filters': [
            ['document_no', '=', productionPosting],
            [
              'document_type',
              '=',
              'Production Posting - FC and Packing',
            ],
          ],
          'doctype': 'Inspection Lot And Decision',
          'limit_page_length': 1,
          'order_by': 'creation desc',
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await get(config);
      $logger.devLog('fetchInspectionLotId....$response');
      return response.processAsync((r) async => right(r.data));
    });
  }

  @override
  AsyncValueOf<List<QualityInspectionReading>> fetchQualityInspectionReadings(
    String inspectionLotId,
  ) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,
        parser: (json) {
          final data = json['message'] as List<dynamic>? ?? [];
          final readings =
              data
                  .map(
                    (e) => QualityInspectionReading.fromJson(
                      e as Map<String, dynamic>,
                    ),
                  )
                  .toList()
                ..sort((a, b) => (a.idx ?? 0).compareTo(b.idx ?? 0));
          return readings;
        },
        reqParams: {
          'fields': ['*'],
          'filters': [
            ['parent', '=', inspectionLotId],
          ],
          'parent': 'Inspection Lot And Decision',
          'doctype': 'Quality Inspection Reading',
          'limit_page_length': 'None',
          'order_by': 'idx asc',
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await get(config);
      $logger.devLog('fetchQualityInspectionReadings....$response');
      return response.processAsync((r) async => right(r.data!));
    });
  }

  @override
  AsyncValueOf<Pair<String, String>> submitInspectionLot({
    required String name,
    required List<Map<String, dynamic>> readings,
  }) async {
    final config = RequestConfig(
      url: Urls.submitInspectionLot,
      parser: (json) {
        final messageObj = json['message'];
        if (messageObj is Map<String, dynamic>) {
          final message = messageObj['message']?.toString() ?? '';
          final data = messageObj['data'];
          String docNo = name;
          if (data is Map<String, dynamic>) {
            docNo = data['name']?.toString() ?? name;
          } else if (data is String && data.isNotEmpty) {
            docNo = data;
          }
          return Pair(message.isNotEmpty ? message : 'Submitted successfully', docNo);
        }
        return Pair(messageObj?.toString() ?? 'Submitted successfully', name);
      },
      body: jsonEncode({
        'name': name,
        'readings': readings,
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('submitInspectionLot....$config');

    final response = await post(config);
    return response.fold(
      (failure) => left(failure),
      (r) {
        if (r.error != null || r.data == null) {
          return left(
            Failure(
              title: 'Error',
              error: r.error ?? 'Failed to submit Quality Inspection',
            ),
          );
        }
        return right(r.data!);
      },
    );
  }
}
