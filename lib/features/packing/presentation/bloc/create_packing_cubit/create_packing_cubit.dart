import 'dart:io';
import 'package:nuevosol/core/core.dart';
import 'package:intl/intl.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/features/packing/data/packing_repo.dart';
import 'package:nuevosol/features/packing/model/packing_model.dart';

part 'create_packing_cubit.freezed.dart';

enum PackingView { create, edit, completed }

extension ActionType on PackingView {
  String toName() {
    return switch (this) {
      PackingView.create => 'Create',
      PackingView.edit => 'Submit',
      PackingView.completed => 'Submitted',
    };
  }
}

@injectable
class CreatePackingCubit extends AppBaseCubit<CreatePackingState> {
  CreatePackingCubit(this.repo) : super(CreatePackingState.initial());
  final PackingRepo repo;

  void onValueChanged({
    String? name,
    String? creationDate,
    String? owner,
    int? docStatus,
    String? qualityInspectionTemplate,
    String? company,
    String? modifiedDate,
    String? modifiedBy,
    String? machineNameNo,
    String? selectProcess,
    String? productionStartTime,
    String? productionEndTime,
    String? rawMaterialName,
    String? uom,
    String? bomItem,
    double? bomQtyItem,
    double? okQty,
    double? totalQty,
    String? batchNo,
    String? amendedFrom,
    List<String>? operatorName,
    File? vehiclePhoto,
  }) async {
    shouldAskForConfirmation.value = true;
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final form = state.form;
    final newForm = form.copyWith(
      company: company ?? form.company,
      name: name ?? form.name,
      machineNameNo: machineNameNo ?? form.machineNameNo,
      creation: today,
      owner: owner ?? form.owner,
      selectProcess: selectProcess ?? form.selectProcess,
      productionStartTime: productionStartTime ?? form.productionStartTime,
      productionEndTime: productionEndTime ?? form.productionEndTime,
      docstatus: docStatus ?? form.docstatus,
      qualityInspectionTemplate: qualityInspectionTemplate ?? form.qualityInspectionTemplate,
      modified: modifiedBy ?? form.modified,
      rawMaterialName: rawMaterialName ?? form.rawMaterialName,
      uom: uom ?? form.uom,
      bomItem: bomItem ?? form.bomItem,
      bomQtyItem: bomQtyItem ?? form.bomQtyItem,
      okQty: okQty ?? form.okQty,
      totalQty: totalQty ?? form.totalQty,
      batchNo: batchNo ?? form.batchNo,
      operatorName: operatorName ?? form.operatorName,
    );

    emitSafeState(state.copyWith(form: newForm));
  }

  //   String? getFullUrl(String? path) {
  //   if (path == null || path.isEmpty) return null;
  //   if (path.startsWith('http')) return path;
  //   return 'http://65.21.176.38:8000$path';
  // }
  String? getFullUrl(String? path) {
    if (path == null || path.isEmpty) return null;

    if (path.startsWith('http')) return path;

    return Urls.filepath(path);
  }

  void initDetails(Object? entry) {
    shouldAskForConfirmation.value = false;
    if (entry is PackingModel) {
      final form = state.form;
      final updatedForm = form.copyWith(
        docstatus: entry.docstatus,
        name: entry.name,
        creation: entry.creation,
        company: entry.company,
        machineNameNo: entry.machineNameNo,
        selectProcess: entry.selectProcess,
        productionStartTime: entry.productionStartTime,
        productionEndTime: entry.productionEndTime,
        rawMaterialName: entry.rawMaterialName,
        uom: entry.uom,
        bomItem: entry.bomItem,
        bomQtyItem: entry.bomQtyItem,
        okQty: entry.okQty,
        totalQty: entry.totalQty,
        batchNo: entry.batchNo,
        qualityInspectionTemplate: entry.qualityInspectionTemplate,
        operatorName: entry.operatorName,
        amendedFrom: entry.amendedFrom,
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
              ? PackingView.completed
              : PackingView.edit;
      emitSafeState(state.copyWith(form: updatedForm, view: mode));
    }
    if (entry == null) return;
  }

  // void clearVehiclePhoto() {
  //   final form = state.form.copyWith(vehiclePhoto: null);
  //   emitSafeState(state.copyWith(form: form));
  // }

  // void addpurchseorders({List<PurchaseOrder>? purchaseorder}) {
  //   final form = state.form.copyWith(purchaseOrder: purchaseorder);

  //   emitSafeState(state.copyWith(form: form));
  // }

  // void clearVehicleBackPhoto() {
  //   final form = state.form.copyWith(weighmentPhoto: null);
  //   emitSafeState(state.copyWith(form: form));
  // }

  // void clearInvoicePhoto() {
  //   final form = state.form.copyWith(invoicePhoto: null);
  //   emitSafeState(state.copyWith(form: form));
  // }

  void save() async {
    final validation = _validate();
    return validation.fold(() async {
      emitSafeState(state.copyWith(isLoading: true, isSuccess: false));
      final nextMode = switch (state.view) {
        PackingView.create => PackingView.edit,
        PackingView.edit ||
        PackingView.completed => PackingView.completed,
      };

      final status = switch (state.view) {
        PackingView.create => 'Draft',
        PackingView.edit || PackingView.completed => 'Submitted',
      };

      if (state.view == PackingView.create) {
        final response = await repo.createPacking(state.form);

        return response.fold(
          (l) => emitSafeState(
            state.copyWith(isLoading: false, error: l, isSuccess: false),
          ),
          (r) {
            if (r.first.isEmpty) {
              emitSafeState(
                state.copyWith(
                  isLoading: false,
                  isSuccess: false,
                  error: const Failure(
                    title: 'Validation Error',
                    error: 'Failed to create Packing',
                  ),
                ),
              );
              return;
            }
            shouldAskForConfirmation.value = false;
            final docstatus = r.second;
            emitSafeState(
              state.copyWith(
                isLoading: false,
                isSuccess: true,
                form: state.form.copyWith(status: status, name: docstatus),
                successMsg: '${r.first}\n${r.second}',
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
      //           view: PackingView.completed,
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
    if (form.operatorName.isNull || (form.operatorName?.isEmpty ?? true)) {
      return optionOf(const Pair('Please select at least one Employee', 0));
    }
    if (form.machineNameNo.doesNotHaveValue) {
      return optionOf(const Pair('Please select Machine No', 0));
    }
    if (form.selectProcess.doesNotHaveValue) {
      return optionOf(const Pair('Please select Process', 0));
    }
    if (form.rawMaterialName.doesNotHaveValue) {
      return optionOf(const Pair('Please select Finished Component', 0));
    }
    if (form.bomItem.doesNotHaveValue) {
      return optionOf(const Pair('Please select BOM Item', 0));
    }
    if (form.okQty.isNull || (form.okQty ?? 0) <= 0) {
      return optionOf(const Pair('Please enter Ok Quantity', 0));
    }

    return const None();
  }
}

@freezed
class CreatePackingState with _$CreatePackingState {
  const factory CreatePackingState({
    required PackingModel form,
    required bool isLoading,
    required bool isSuccess,
    required PackingView view,

    String? successMsg,
    Failure? error,
  }) = _CreatePackingState;

  factory CreatePackingState.initial() {
    // final now = DateTime.now();
    // final creationDate = DFU.friendlyFormat(DFU.now());
    // final entryDate = DFU.ddMMyyyy(DFU.now());

    return const CreatePackingState(
      form: PackingModel(selectProcess: 'Packing'),
      view: PackingView.create,
      isLoading: false,
      isSuccess: false,
    );
  }
}
