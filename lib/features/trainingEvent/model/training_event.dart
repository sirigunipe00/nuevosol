import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_event.freezed.dart';
part 'training_event.g.dart';

@freezed
class TrainingEvent with _$TrainingEvent {
  const factory TrainingEvent({
    String? status,

    @JsonKey(name: 'name')
    String? name,

    @JsonKey(name: 'owner')
    String? owner,

    @JsonKey(name: 'creation')
    String? creationDate,

    @JsonKey(name: 'modified')
    String? modifiedDate,

    @JsonKey(name: 'modified_by')
    String? modifiedBy,

    @JsonKey(name: 'docstatus')
    int? docStatus,

    @JsonKey(name: 'idx')
    int? idx,

    @JsonKey(name: 'event_name')
    String? eventName,

    @JsonKey(name: 'training_program')
    String? trainingProgram,

    @JsonKey(name: 'event_status')
    String? eventStatus,

    @JsonKey(name: 'has_certificate')
    int? hasCertificate,

    @JsonKey(name: 'type')
    String? type,

    @JsonKey(name: 'level')
    String? level,

    @JsonKey(name: 'company')
    String? company,

    @JsonKey(name: 'trainer_name')
    String? trainerName,

    @JsonKey(name: 'trainer_email')
    String? trainerEmail,

    @JsonKey(name: 'supplier')
    String? supplier,

    @JsonKey(name: 'contact_number')
    String? contactNumber,

    @JsonKey(name: 'course')
    String? course,

    @JsonKey(name: 'location')
    String? location,

    @JsonKey(name: 'start_time')
    String? startTime,

    @JsonKey(name: 'end_time')
    String? endTime,

    @JsonKey(name: 'introduction')
    String? introduction,

    @JsonKey(name: 'amended_from')
    String? amendedFrom,

    @JsonKey(name: 'employee_emails')
    String? employeeEmails,
  }) = _TrainingEvent;

  factory TrainingEvent.fromJson(Map<String, dynamic> json) =>
      _$TrainingEventFromJson(json);
}