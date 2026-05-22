import 'package:nuevosol/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/features/employee_tracker/data/employee_tracker_repo.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_model.dart';




part 'create_employee_cubit.freezed.dart';

enum EmployeeView { create, edit, completed }

extension ActionType on EmployeeView {
  String toName() {
    return switch (this) {
      EmployeeView.create => 'Create',
      EmployeeView.edit => 'Submit',
      EmployeeView.completed => 'Submitted',
    };
  }
}

@injectable
class CreateEmployeeCubit extends AppBaseCubit<CreateEmployeeState> {
  CreateEmployeeCubit(this.repo) : super(CreateEmployeeState.initial());
  final EmployeeRepo repo;

  void onValueChanged({
    String? name,
    String? creationDate,
    String? owner,
    int? docStatus,
    String? modifiedBy,
    String? modifiedDate,
    String? workflowState,
    String? employeeNo,
    String? hod,
    String? vendorInvoiceNo,
    String? company,
    int? expectedDurationMin,
    String? expectedReturnDateTime,
    String? sendForApprovalDateTime,
    String? employeeName,
    String? department,
    String? reasonOfGateExit,
    String? fromLocation,
    String? toLocation,
    String? movementType,
    String? expectedExitDateTime,
    String? approvedDateTime,
    String? approvedBy,
    String? rejectReason,
    String? gateExitDateAndTime,
    int? expectedDurationT1Min,
    String? status1,
    String? gateEntryDateAndTime,
    int? actualDurationT1Min,
    String? gateExitDateAndTimeReturn,
    int? expectedDurationT2Min,
    String? status2,
    String? gateEntryDateAndTimeReturn,
    int? actualDurationT2Min,
}) async {
    shouldAskForConfirmation.value = true;
    final form = state.form;
     final newForm = form.copyWith(
      creation: creationDate ?? form.creation,
      name: name ?? form.name,
      owner: owner ?? form.owner ,
      workflowState: workflowState ?? form.workflowState,
      employeeNo: employeeNo ?? form.employeeNo,
      docstatus: docStatus ?? form.docstatus,
      modifiedBy: modifiedBy ?? form.modifiedBy,
      modified: modifiedDate ?? form.modified,
      hod: hod ?? form.hod,
      company: company ?? form.company,
      expectedDurationMin: expectedDurationMin ?? form.expectedDurationMin,
      sendForApprovalDateTime: sendForApprovalDateTime ?? form.sendForApprovalDateTime,
      expectedReturnDateTime: expectedReturnDateTime ?? form.expectedReturnDateTime,
      employeeName: employeeName ?? form.employeeName,
      department: department ?? form.department,
      movementType: movementType ?? form.movementType,
      reasonOfGateExit: reasonOfGateExit ?? form.reasonOfGateExit,
      fromLocation: fromLocation ?? form.fromLocation,
      toLocation: toLocation ?? form.toLocation,
      expectedExitDateTime: expectedExitDateTime ?? form.expectedExitDateTime,
      approvedDateTime: approvedDateTime ?? form.approvedDateTime,
      approvedBy: approvedBy ?? form.approvedBy,
      rejectReason: rejectReason ?? form.rejectReason,
      gateExitDateAndTime: gateExitDateAndTime ?? form.gateExitDateAndTime,
      expectedDurationT1Min: expectedDurationT1Min ?? form.expectedDurationT1Min,
      status1: status1 ?? form.status1, 
      gateEntryDateAndTime: gateEntryDateAndTime ?? form.gateEntryDateAndTime,
      actualDurationT1Min: actualDurationT1Min ?? form.actualDurationT1Min,
      gateExitDateAndTimeReturn: gateExitDateAndTimeReturn ?? form.gateExitDateAndTimeReturn,
      expectedDurationT2Min: expectedDurationT2Min ?? form.expectedDurationT2Min,
      status2: status2 ?? form.status2,
      gateEntryDateAndTimeReturn: gateEntryDateAndTimeReturn ?? form.gateEntryDateAndTimeReturn,
      actualDurationT2Min: actualDurationT2Min ?? form.actualDurationT2Min,
);

    emitSafeState(state.copyWith(form: newForm));
  }
void initDetails(Object? entry) {
    shouldAskForConfirmation.value = false;
    if (entry is EmployeeTracker) {


      // final parsedDate = DFU.toDateTime(
      //   entry.creation.valueOrEmpty,
      //   'yyyy-MM-dd',
      // );
      // final formattedStr = DFU.friendlyFormat(parsedDate);
      final form = state.form;
      final updatedForm = form.copyWith(
        name: entry.name,
        creation: entry.creation,
        owner: entry.owner,
        docstatus: entry.docstatus,
        modifiedBy: entry.modifiedBy,
        company: entry.company,
        expectedDurationMin: entry.expectedDurationMin,
        expectedReturnDateTime: entry.expectedReturnDateTime,
        sendForApprovalDateTime: entry.sendForApprovalDateTime,
        employeeName: entry.employeeName,
        department: entry.department,
        reasonOfGateExit: entry.reasonOfGateExit,
        fromLocation: entry.fromLocation,
        toLocation: entry.toLocation, 
        movementType: entry.movementType,
          expectedExitDateTime: entry.expectedExitDateTime, 
          approvedDateTime: entry.approvedDateTime,
          approvedBy: entry.approvedBy,
          rejectReason: entry.rejectReason,
          gateExitDateAndTime: entry.gateExitDateAndTime, 
          expectedDurationT1Min: entry.expectedDurationT1Min,
          status1: entry.status1,
          gateEntryDateAndTime: entry.gateEntryDateAndTime,   
          actualDurationT1Min: entry.actualDurationT1Min,
          gateExitDateAndTimeReturn: entry.gateExitDateAndTimeReturn,
          expectedDurationT2Min: entry.expectedDurationT2Min,
          status2: entry.status2,   
          gateEntryDateAndTimeReturn: entry.gateEntryDateAndTimeReturn,
          actualDurationT2Min: entry.actualDurationT2Min,
        
        

      );

      final status = entry.docstatus;

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
              ? EmployeeView.completed
              : EmployeeView.edit;
      emitSafeState(state.copyWith(form: updatedForm, view: mode));
    }
    if (entry == null) return;
  }

 void save() async {
    final validation = _validate();
    return validation.fold(() async {
      emitSafeState(state.copyWith(isLoading: true, isSuccess: false));
      final nextMode = switch (state.view) {
        EmployeeView.create => EmployeeView.edit,
        EmployeeView.edit ||
        EmployeeView.completed => EmployeeView.completed,
      };

      final status = switch (state.view) {
        EmployeeView.create => 'Draft',
        EmployeeView.edit || EmployeeView.completed => 'Submitted',
      };

      if (state.view == EmployeeView.create) {
        final response = await repo.createEmployee(state.form);

        return response.fold(
          (l) => emitSafeState(
            state.copyWith(isLoading: false, error: l, isSuccess: false),
          ),
          (r) {
            shouldAskForConfirmation.value = false;
            final docstatus = r.second;
            emitSafeState(
              state.copyWith(
                isLoading: false,
                isSuccess: true,
                form: state.form.copyWith(status: status, name: docstatus),
                successMsg: r.first,
                view: nextMode,
              ),
            );
          },
        );
      }
      //  else {
      //   final response = await repo.submitGateEntry(state.form);

      //   return response.fold(
      //     (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      //     (r) {
      //       shouldAskForConfirmation.value = false;
      //       emitSafeState(
      //         state.copyWith(
      //           isLoading: false,
      //           isSuccess: true,
      //           form: state.form.copyWith(docStatus: 1),
      //           successMsg: r.first,
      //           view: EmployeeView.completed,
      //         ),
      //       );
      //     },
      //   );
      // }
    }, _emitError);
  }

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


    if (form.employeeNo == null && form.employeeNo?.trim().isEmpty == true) {
      return optionOf(const Pair('Select Employee No', 0));
    } else 
    if (form.reasonOfGateExit == null && form.reasonOfGateExit?.trim().isEmpty == true) {
      return optionOf(const Pair('Missing Reason for Gate Exit', 0));
    } 
    else if (form.movementType == null && form.movementType?.trim().isEmpty == true) {
      return optionOf(const Pair('Missing Movement Type', 0));
    } 
    else if (form.fromLocation == null && form.fromLocation?.trim().isEmpty == true) {
      return optionOf(const Pair('Missing From Location', 0));
    } else if (form.toLocation == null && form.toLocation?.trim().isEmpty == true) {
      return optionOf(const Pair('Missing To Location', 0));
    } else if (form.expectedExitDateTime == null && form.expectedExitDateTime?.trim().isEmpty == true) {
      return optionOf(const Pair('Missing Expected Exit Date', 0));
    } 

    return const None();
  }
}

@freezed
class CreateEmployeeState with _$CreateEmployeeState {
  const factory CreateEmployeeState({
    required EmployeeTracker form,
    required bool isLoading,
    required bool isSuccess,
    required EmployeeView view,

    String? successMsg,
    Failure? error,
  }) = _CreateEmployeeState;

  factory CreateEmployeeState.initial() {
    // final now = DateTime.now();
    // final creationDate = DFU.friendlyFormat(DFU.now());
    // final entryDate = DFU.ddMMyyyy(DFU.now());

    return const CreateEmployeeState(
      form: EmployeeTracker(),
      view: EmployeeView.create,
      isLoading: false,
      isSuccess: false,
    );
  }
}
