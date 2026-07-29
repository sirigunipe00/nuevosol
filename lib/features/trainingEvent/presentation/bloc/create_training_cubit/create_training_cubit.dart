// import 'package:nuevosol/core/core.dart';
// import 'package:dartz/dartz.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:nuevosol/features/trainingEvent/data/training_event_repo.dart';
// import 'package:nuevosol/features/trainingEvent/model/training_event.dart';

// part 'create_training_cubit.freezed.dart';

// enum TraininView { create, edit, completed }

// extension ActionType on TraininView {
//   String toName() {
//     return switch (this) {
//       TraininView.create => 'Create',
//       TraininView.edit => 'Submit',
//       TraininView.completed => 'Submitted',
//     };
//   }
// }

// @injectable
// class CreateTrainingCubit extends AppBaseCubit<CreateTrainingState> {
//   CreateTrainingCubit(this.repo) : super(CreateTrainingState.initial());
//   final TrainingEventRepo repo;

//   void onValueChanged({
//     String? name,
//     String? owner,
//     String? creationDate,
//     String? modifiedDate,
//     String? modifiedBy,
//     int? docStatus,
//     int? idx,
//     String? eventName,
//     String? trainingProgram,
//     String? eventStatus,
//     int? hasCertificate,
//     String? type,
//     String? level,
//     String? company,
//     String? trainerName,
//     String? trainerEmail,
//     String? supplier,
//     String? contactNumber,
//     String? course,
//     String? location,
//     String? startTime,
//     String? endTime,
//     String? introduction,
//     String? amendedFrom,
//     String? employeeEmails,
//   }) {
//     shouldAskForConfirmation.value = true;

//     final form = state.form;

//     emitSafeState(
//       state.copyWith(
//         form: form.copyWith(
//           name: name ?? form.name,
//           owner: owner ?? form.owner,
//           creationDate: creationDate ?? form.creationDate,
//           modifiedDate: modifiedDate ?? form.modifiedDate,
//           modifiedBy: modifiedBy ?? form.modifiedBy,
//           docStatus: docStatus ?? form.docStatus,
//           idx: idx ?? form.idx,
//           eventName: eventName ?? form.eventName,
//           trainingProgram: trainingProgram ?? form.trainingProgram,
//           eventStatus: eventStatus ?? form.eventStatus,
//           hasCertificate: hasCertificate ?? form.hasCertificate,
//           type: type ?? form.type,
//           level: level ?? form.level,
//           company: company ?? form.company,
//           trainerName: trainerName ?? form.trainerName,
//           trainerEmail: trainerEmail ?? form.trainerEmail,
//           supplier: supplier ?? form.supplier,
//           contactNumber: contactNumber ?? form.contactNumber,
//           course: course ?? form.course,
//           location: location ?? form.location,
//           startTime: startTime ?? form.startTime,
//           endTime: endTime ?? form.endTime,
//           introduction: introduction ?? form.introduction,
//           amendedFrom: amendedFrom ?? form.amendedFrom,
//           employeeEmails: employeeEmails ?? form.employeeEmails,
//         ),
//       ),
//     );
//   }

//   String? getFullUrl(String? path) {
//     if (path == null || path.isEmpty) return null;

//     if (path.startsWith('http')) return path;

//     return Urls.filepath(path);
//   }

//   void initDetails(Object? entry) {
//     shouldAskForConfirmation.value = false;
//     if (entry is TrainingEvent) {
//       final parsedDate = DFU.toDateTime(
//         entry.creationDate.valueOrEmpty,
//         'yyyy-MM-dd',
//       );
//       final formattedStr = DFU.friendlyFormat(parsedDate);
//       final form = state.form;
//       final updatedForm = form.copyWith(
//         name: entry.name,
//         owner: entry.owner,
//         creationDate: formattedStr,
//         modifiedDate: entry.modifiedDate,
//         modifiedBy: entry.modifiedBy,
//         docStatus: entry.docStatus,
//         idx: entry.idx,
//         eventName: entry.eventName,
//         trainingProgram: entry.trainingProgram,
//         eventStatus: entry.eventStatus,
//         hasCertificate: entry.hasCertificate,
//         type: entry.type,
//         level: entry.level,
//         company: entry.company,
//         trainerName: entry.trainerName,
//         trainerEmail: entry.trainerEmail,
//         supplier: entry.supplier,
//         contactNumber: entry.contactNumber,
//         course: entry.course,
//         location: entry.location,
//         startTime: entry.startTime,
//         endTime: entry.endTime,
//         introduction: entry.introduction,
//         amendedFrom: entry.amendedFrom,
//         employeeEmails: entry.employeeEmails,
//       );

//       final status = entry.docStatus;

//       final isSubmitted = StringUtils.equalsIgnoreCase(
//         StringUtils.docStatus(status!),
//         'Submitted',
//       );
//       final isCancelled = StringUtils.equalsIgnoreCase(
//         StringUtils.docStatus(status).trim(),
//         'Cancelled',
//       );

//       final mode =
//           (isSubmitted || isCancelled)
//               ? TraininView.completed
//               : TraininView.edit;
//       emitSafeState(state.copyWith(form: updatedForm, view: mode));
//     }
//     if (entry == null) return;
//   }

//   Future<void> joinTraining(String trainingEvent) async {
//     emitSafeState(state.copyWith(isLoading: true));

//     final response = await repo.createEmployee(trainingEvent);

//     response.fold(
//       (l) {
//         $logger.devLog('Failure: ${l.error}');
//         emitSafeState(state.copyWith(isLoading: false, error: l));
//       },
//       (r) {
//         $logger.devLog('Success: ${r.first} ${r.second}');

//         emitSafeState(
//           state.copyWith(
//             isLoading: false,
//             isSuccess: true,
//             successMsg: '${r.first}\n${r.second}',
//           ),
//         );

//         $logger.devLog('Success state emitted');
//       },
//     );
//   }

//   void _emitError(Pair<String, int?> error) {
//     final failure = Failure(
//       error: error.first,
//       title: 'Missing Fields',
//       status: error.second,
//     );
//     emitSafeState(state.copyWith(error: failure, isLoading: false));
//   }

//   void errorHandled() {
//     emitSafeState(
//       state.copyWith(
//         error: null,
//         isLoading: false,
//         isSuccess: false,
//         successMsg: null,
//       ),
//     );
//   }

//   Option<Pair<String, int?>> _validate() {
//     final form = state.form;

//     return const None();
//   }
// }

// @freezed
// class CreateTrainingState with _$CreateTrainingState {
//   const factory CreateTrainingState({
//     required TrainingEvent form,
//     required bool isLoading,
//     required bool isSuccess,
//     required TraininView view,

//     String? successMsg,
//     Failure? error,
//   }) = _CreateTrainingState;

//   factory CreateTrainingState.initial() {
//     return const CreateTrainingState(
//       form: TrainingEvent(),
//       view: TraininView.create,
//       isLoading: false,
//       isSuccess: false,
//     );
//   }
// }

import 'package:nuevosol/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/features/trainingEvent/data/training_event_repo.dart';
import 'package:nuevosol/features/trainingEvent/model/training_event.dart';

part 'create_training_cubit.freezed.dart';

enum TraininView { create, edit, completed }

extension ActionType on TraininView {
  String toName() {
    return switch (this) {
      TraininView.create => 'Create',
      TraininView.edit => 'Submit',
      TraininView.completed => 'Submitted',
    };
  }
}

@injectable
class CreateTrainingCubit extends AppBaseCubit<CreateTrainingState> {
  CreateTrainingCubit(this.repo) : super(CreateTrainingState.initial());
  final TrainingEventRepo repo;

  void onValueChanged({
    String? name,
    String? owner,
    String? creationDate,
    String? modifiedDate,
    String? modifiedBy,
    int? docStatus,
    int? idx,
    String? eventName,
    String? trainingProgram,
    String? eventStatus,
    int? hasCertificate,
    String? type,
    String? level,
    String? company,
    String? trainerName,
    String? trainerEmail,
    String? supplier,
    String? contactNumber,
    String? course,
    String? location,
    String? startTime,
    String? endTime,
    String? introduction,
    String? amendedFrom,
    String? employeeEmails,
  }) {
    shouldAskForConfirmation.value = true;

    final form = state.form;

    emitSafeState(
      state.copyWith(
        form: form.copyWith(
          name: name ?? form.name,
          owner: owner ?? form.owner,
          creationDate: creationDate ?? form.creationDate,
          modifiedDate: modifiedDate ?? form.modifiedDate,
          modifiedBy: modifiedBy ?? form.modifiedBy,
          docStatus: docStatus ?? form.docStatus,
          idx: idx ?? form.idx,
          eventName: eventName ?? form.eventName,
          trainingProgram: trainingProgram ?? form.trainingProgram,
          eventStatus: eventStatus ?? form.eventStatus,
          hasCertificate: hasCertificate ?? form.hasCertificate,
          type: type ?? form.type,
          level: level ?? form.level,
          company: company ?? form.company,
          trainerName: trainerName ?? form.trainerName,
          trainerEmail: trainerEmail ?? form.trainerEmail,
          supplier: supplier ?? form.supplier,
          contactNumber: contactNumber ?? form.contactNumber,
          course: course ?? form.course,
          location: location ?? form.location,
          startTime: startTime ?? form.startTime,
          endTime: endTime ?? form.endTime,
          introduction: introduction ?? form.introduction,
          amendedFrom: amendedFrom ?? form.amendedFrom,
          employeeEmails: employeeEmails ?? form.employeeEmails,
        ),
      ),
    );
  }

  String? getFullUrl(String? path) {
    if (path == null || path.isEmpty) return null;

    if (path.startsWith('http')) return path;

    return Urls.filepath(path);
  }

  void initDetails(Object? entry) {
    shouldAskForConfirmation.value = false;
    if (entry is TrainingEvent) {
      final parsedDate = DFU.toDateTime(
        entry.creationDate.valueOrEmpty,
        'yyyy-MM-dd',
      );
      final formattedStr = DFU.friendlyFormat(parsedDate);
      final form = state.form;
      final updatedForm = form.copyWith(
        name: entry.name,
        owner: entry.owner,
        creationDate: formattedStr,
        modifiedDate: entry.modifiedDate,
        modifiedBy: entry.modifiedBy,
        docStatus: entry.docStatus,
        idx: entry.idx,
        eventName: entry.eventName,
        trainingProgram: entry.trainingProgram,
        eventStatus: entry.eventStatus,
        hasCertificate: entry.hasCertificate,
        type: entry.type,
        level: entry.level,
        company: entry.company,
        trainerName: entry.trainerName,
        trainerEmail: entry.trainerEmail,
        supplier: entry.supplier,
        contactNumber: entry.contactNumber,
        course: entry.course,
        location: entry.location,
        startTime: entry.startTime,
        endTime: entry.endTime,
        introduction: entry.introduction,
        amendedFrom: entry.amendedFrom,
        employeeEmails: entry.employeeEmails,
      );

      final status = entry.docStatus;

      final isSubmitted = StringUtils.equalsIgnoreCase(
        StringUtils.docStatus(status!),
        'Submitted',
      );
      final isCancelled = StringUtils.equalsIgnoreCase(
        StringUtils.docStatus(status).trim(),
        'Cancelled',
      );

      final mode =
          (isSubmitted || isCancelled)
              ? TraininView.completed
              : TraininView.edit;
      emitSafeState(state.copyWith(form: updatedForm, view: mode));
    }
    if (entry == null) return;
  }

  Future<void> joinTraining(String trainingEvent) async {
    emitSafeState(state.copyWith(isLoading: true));

    final response = await repo.createEmployee(trainingEvent);

    response.fold(
      (l) {
        $logger.devLog('Failure: ${l.error}');
        emitSafeState(state.copyWith(isLoading: false, error: l));
      },
      (r) {

        emitSafeState(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            successMsg: r.message ?? '${r.employeeName} joined the training',
            scannedEvents: r.trainingEvents,
            employeeName: r.employeeName,
            employeeCode: r.employee,
          ),
        );

        $logger.devLog('Success state emitted');
      },
    );
  }

  // void _emitError(Pair<String, int?> error) {
  //   final failure = Failure(
  //     error: error.first,
  //     title: 'Missing Fields',
  //     status: error.second,
  //   );
  //   emitSafeState(state.copyWith(error: failure, isLoading: false));
  // }
  void resetScan() {
  emitSafeState(
    state.copyWith(
      scannedEvents: const [],
      employeeName: null,
      employeeCode: null,
      successMsg: null,
      isSuccess: false,
      error: null,
    ),
  );
}

  void errorHandled() {
    emitSafeState(
      state.copyWith(
        error: null,
        isLoading: false,
        isSuccess: false,
        successMsg: null,
      ),
    );
  }

  // Option<Pair<String, int?>> _validate() {
  //   final form = state.form;

  //   return const None();
  // }
}

@freezed
class CreateTrainingState with _$CreateTrainingState {
  const factory CreateTrainingState({
    required TrainingEvent form,
    required bool isLoading,
    required bool isSuccess,
    required TraininView view,

    String? successMsg,
    Failure? error,

    @Default(<TrainingEvent>[])
    List<TrainingEvent> scannedEvents,
    String? employeeName,
    String? employeeCode,
  }) = _CreateTrainingState;

  factory CreateTrainingState.initial() {
    return const CreateTrainingState(
      form: TrainingEvent(),
      view: TraininView.create,
      isLoading: false,
      isSuccess: false,
    );
  }
}