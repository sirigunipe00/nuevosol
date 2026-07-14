import 'package:nuevosol/core/core.dart';
import 'package:dartz/dartz.dart';
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
        emitSafeState(state.copyWith(isLoading: false, error: l));
      },
      (r) {
        emitSafeState(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            successMsg: '${r.first}\n${r.second}',
          ),
        );
      },
    );
  }

  // void save() async {
  //   final validation = _validate();
  //   return validation.fold(() async {
  //     emitSafeState(state.copyWith(isLoading: true, isSuccess: false));
  //     final nextMode = switch (state.view) {
  //       TraininView.create => TraininView.edit,
  //       TraininView.edit ||
  //       TraininView.completed => TraininView.completed,
  //     };

  //     final status = switch (state.view) {
  //       TraininView.create => 'Draft',
  //       TraininView.edit || TraininView.completed => 'Submitted',
  //     };

  //     if (state.view == TraininView.create) {
  //       final response = await repo.createEmployee(state.form);

  //       return response.fold(
  //         (l) => emitSafeState(
  //           state.copyWith(isLoading: false, error: l, isSuccess: false),
  //         ),
  //         (r) {
  //           if (r.first.isEmpty) {
  //             emitSafeState(
  //               state.copyWith(
  //                 isLoading: false,
  //                 isSuccess: false,
  //                 error: const Failure(
  //                   title: 'Validation Error',
  //                   error: 'Failed to create gate entry',
  //                 ),
  //               ),
  //             );
  //             return;
  //           }
  //           shouldAskForConfirmation.value = false;
  //           final docstatus = r.second;
  //           emitSafeState(
  //             state.copyWith(
  //               isLoading: false,
  //               isSuccess: true,
  //               form: state.form.copyWith(status: status, name: docstatus),
  //               successMsg: '${r.first}\n${r.second}',
  //               view: nextMode,
  //             ),
  //           );
  //         },
  //       );
  //     }
  //     //  else {
  //     //   final response = await repo.submitGateEntry(state.form);

  //     //   return response.fold(
  //     //     (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
  //     //     (r) {
  //     //       shouldAskForConfirmation.value = false;
  //     //       emitSafeState(
  //     //         state.copyWith(
  //     //           isLoading: false,
  //     //           isSuccess: true,
  //     //           form: state.form.copyWith(docStatus: 1),
  //     //           successMsg: r.first,
  //     //           view: TraininView.completed,
  //     //         ),
  //     //       );
  //     //     },
  //     //   );
  //     // }
  //   }, _emitError);
  // }

  void _emitError(Pair<String, int?> error) {
    final failure = Failure(
      error: error.first,
      title: 'Missing Fields',
      status: error.second,
    );
    emitSafeState(state.copyWith(error: failure, isLoading: false));
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

  Option<Pair<String, int?>> _validate() {
    final form = state.form;

    return const None();
  }
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
