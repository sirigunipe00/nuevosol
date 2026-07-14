import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/trainingEvent/data/training_event_repo.dart';
import 'package:nuevosol/features/trainingEvent/model/training_employee.dart';
import 'package:nuevosol/features/trainingEvent/model/training_event.dart';

@LazySingleton(as: TrainingEventRepo)
class TrainingEventRepoImpl extends BaseApiRepository
    implements TrainingEventRepo {
  const TrainingEventRepoImpl(super.client);

  @override
  AsyncValueOf<List<TrainingEvent>> fetchTraning(
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
        return data.map((e) => TrainingEvent.fromJson(e)).toList();
      },
      reqParams: {
        'filters': jsonEncode(filters),
        'limit_start': start,
        'limit': 20,

        'order_by': 'creation desc',
        'doctype': 'Training Event',
        'fields': jsonEncode(['*']),
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('requestConfig....$requestConfig');

    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<List<TrainingEmployee>> fetchEmployess(String name) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,

        parser: (json) {
          $logger.devLog('repojson...----$json');

          final data = json['message'];
          final listdata = data as List<dynamic>;
          return listdata.map((e) => TrainingEmployee.fromJson(e)).toList();
        },
        reqParams: {
          'filters': [
            ['parent', '=', name],
          ],
          'limit_start': 0,
          'limit_page_length': 'None',
          'order_by': 'creation desc',
          'parent': 'Training Event',
          'doctype': 'Training Event Employee',
          'fields': ['*'],
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      final response = await get(config);
      $logger.devLog('reposales config........$response');
      return response.processAsync((r) async {
        return right((r.data!));
      });
    });
  }

  @override
  AsyncValueOf<Pair<String, String>> createEmployee(
    String trainingEvent,
  ) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.addEmployeeToTrainingEvent,
       parser: (json) {
  final data = json['message'] as Map<String, dynamic>;

  return Pair(
    data['employee_name']?.toString() ?? '',
    data['message']?.toString() ?? '',
  );
},
        reqParams: {
          'user_email': user().email,
          'training_event': trainingEvent,
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await post(config);
      $logger.devLog('requet.....>$config');
      $logger.devLog('addEmployeeToTrainingEvent response....$response');
      return response.processAsync((r) async => right(r.data!));
    });
  }
}
