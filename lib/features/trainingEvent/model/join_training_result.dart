import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nuevosol/features/trainingEvent/model/training_event.dart';

part 'join_training_result.freezed.dart';
part 'join_training_result.g.dart';

@freezed
class JoinTrainingResult with _$JoinTrainingResult {
  const factory JoinTrainingResult({
    int? status,
    String? message,

    @JsonKey(name: 'user_email')
    String? userEmail,

    @JsonKey(name: 'employee')
    String? employee,

    @JsonKey(name: 'employee_name')
    String? employeeName,

    @JsonKey(name: 'training_events')
    @Default(<TrainingEvent>[])
    List<TrainingEvent> trainingEvents,

    int? count,
  }) = _JoinTrainingResult;

  factory JoinTrainingResult.fromJson(Map<String, dynamic> json) =>
      _$JoinTrainingResultFromJson(json);
}