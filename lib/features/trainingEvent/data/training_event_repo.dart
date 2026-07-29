import 'package:dartz/dartz.dart';
import 'package:nuevosol/core/model/failure.dart';
import 'package:nuevosol/core/utils/typedefs.dart';
import 'package:nuevosol/features/trainingEvent/model/join_training_result.dart';
import 'package:nuevosol/features/trainingEvent/model/training_employee.dart';
import 'package:nuevosol/features/trainingEvent/model/training_event.dart';

abstract interface class TrainingEventRepo {
AsyncValueOf<List<TrainingEvent>> fetchTraning(
    int start,
    int? docStatus,
    String? search,
  );  
  AsyncValueOf<List<TrainingEmployee>> fetchEmployess(String name);
  // AsyncValueOf<Pair<String,String>> createEmployee(String eventName);
  Future<Either<Failure, JoinTrainingResult>> createEmployee(
  String trainingEvent,
);
}