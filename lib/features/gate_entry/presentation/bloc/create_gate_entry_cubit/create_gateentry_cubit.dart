import 'dart:developer';
import 'dart:io';
import 'package:nuevosol/core/core.dart';
import 'package:intl/intl.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/features/gate_entry/data/gate_entry_repo.dart';
import 'package:nuevosol/features/gate_entry/model/gate_entry.dart';


part 'create_gateentry_cubit.freezed.dart';

enum GateEntryView { create, edit, completed }

extension ActionType on GateEntryView {
  String toName() {
    return switch (this) {
      GateEntryView.create => 'Create',
      GateEntryView.edit => 'Submit',
      GateEntryView.completed => 'Submitted',
    };
  }
}

@injectable
class CreateGateEntryCubit extends AppBaseCubit<CreateGateEntryState> {
  CreateGateEntryCubit(this.repo) : super(CreateGateEntryState.initial());
  final GateEntryRepo repo;

  void onValueChanged({
    String? name,
    String? creationDate,
    String? owner,
    int? docStatus,
    String? modifiedBy,
    String? modifiedDate,
    String? purchaseOrder,
    String? vehicleNo,
    String? vendorInvoiceDate,
    String? vendorInvoiceNo,
    String? gateEntryDate,
    int? invoiceQuantity,
    int? invoiceAmount,
    int? receipt,
    String? remarks,
    String? customUnit1,
    String? customUnit2,
    String? createTime,
    String? customSupplier,

    File? vehiclePhoto,
    File? invoicePhoto,
    File? weighmentPhoto,
  }) async {
    shouldAskForConfirmation.value = true;
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    
    final form = state.form;

    final vehiclePhotos = vehiclePhoto ?? form.vehiclePhotoImg;

    final vendorInvoicePhotoBase64 = invoicePhoto ?? form.invoicePhotoImg;

    final weightmentPhotos = weighmentPhoto ?? form.weighmentPhotoImg;
    final newForm = form.copyWith(
      customSupplier: customSupplier ?? form.customSupplier,
      name: name ?? form.name,
      createTime: createTime ?? form.createTime ,
      creationDate: today,
      owner: owner ?? form.owner,
      customeUnit1: customUnit1 ?? form.customeUnit1,
      customeUnit2: customUnit2 ?? form.customeUnit2,
      docStatus: docStatus ?? form.docStatus,
      modifiedBy: modifiedBy ?? form.modifiedBy,
      modifiedDate: modifiedDate ?? form.modifiedDate,
      purchaseOrder: purchaseOrder ?? form.purchaseOrder,
      vehicleNo: vehicleNo ?? form.vehicleNo,
      vendorInvoiceDate: vendorInvoiceDate ?? form.vendorInvoiceDate,
      vendorInvoiceNo: vendorInvoiceNo ?? form.vendorInvoiceNo,
      gateEntryDate: gateEntryDate ?? form.gateEntryDate,
      invoiceQuantity: invoiceQuantity ?? form.invoiceQuantity,
      invoiceAmount: invoiceAmount ?? form.invoiceAmount,
      receipt: receipt ?? form.receipt,
      remarks: remarks ?? form.remarks,
      
      vehiclePhotoImg: vehiclePhotos,
      invoicePhotoImg: vendorInvoicePhotoBase64,
      weighmentPhotoImg: weightmentPhotos,
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
    if (entry is GateEntry) {
      log('entry.gateEntryDate loggg: ${state.form.purchaseOrder}');

      final parsedDate = DFU.toDateTime(
        entry.creationDate.valueOrEmpty,
        'yyyy-MM-dd',
      );
      final formattedStr = DFU.friendlyFormat(parsedDate);
      final form = state.form;
      final updatedForm = form.copyWith(
        docStatus: entry.docStatus,
        name: entry.name,
        remarks: entry.remarks,
        // plantName: entry.plantName,
        purchaseOrder: entry.purchaseOrder,
        gateEntryDate: entry.gateEntryDate,
        vendorInvoiceNo: entry.vendorInvoiceNo,
        vendorInvoiceDate: entry.vendorInvoiceDate,
        vehicleNo: entry.vehicleNo,
       vehiclePhoto: getFullUrl(entry.vehiclePhoto),
       weighmentPhoto: getFullUrl(entry.weighmentPhoto),
       invoicePhoto: getFullUrl(entry.invoicePhoto),
        invoiceAmount: entry.invoiceAmount,
        invoiceQuantity: entry.invoiceQuantity,
        customSupplier: entry.customSupplier,
        createTime: entry.createTime,
        customeUnit1: entry.customeUnit1,
        customeUnit2: entry.customeUnit2,
        
        
        creationDate: formattedStr,
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
              ? GateEntryView.completed
              : GateEntryView.edit;
      emitSafeState(state.copyWith(form: updatedForm, view: mode));
    }
    if (entry == null) return;
  }

  void clearVehiclePhoto() {
    final form = state.form.copyWith(vehiclePhoto: null);
    emitSafeState(state.copyWith(form: form));
  }

  // void addpurchseorders({List<PurchaseOrder>? purchaseorder}) {
  //   final form = state.form.copyWith(purchaseOrder: purchaseorder);

  //   emitSafeState(state.copyWith(form: form));
  // }

  void clearVehicleBackPhoto() {
    final form = state.form.copyWith(weighmentPhoto: null);
    emitSafeState(state.copyWith(form: form));
  }

  void clearInvoicePhoto() {
    final form = state.form.copyWith(invoicePhoto: null);
    emitSafeState(state.copyWith(form: form));
  }

  void save() async {
    final validation = _validate();
    return validation.fold(() async {
      emitSafeState(state.copyWith(isLoading: true, isSuccess: false));
      final nextMode = switch (state.view) {
        GateEntryView.create => GateEntryView.edit,
        GateEntryView.edit ||
        GateEntryView.completed => GateEntryView.completed,
      };

      final status = switch (state.view) {
        GateEntryView.create => 'Draft',
        GateEntryView.edit || GateEntryView.completed => 'Submitted',
      };

      if (state.view == GateEntryView.create) {
        final response = await repo.createGateEntry(state.form);

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
      //           view: GateEntryView.completed,
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


    // if (form.purchaseOrder == null) {
    //   return optionOf(const Pair('Select Purchase Order', 0));
    // } else 
    if (form.vehiclePhotoImg.isNull &&
        form.vehiclePhoto.doesNotHaveValue) {
      return optionOf(const Pair('Missing Vehicle Photo', 0));
    } 
    // else if (form.vehicleBackPhotoImg.isNull &&
    //     form.vehicleBackPhoto.doesNotHaveValue) {
    //   return optionOf(const Pair('Missing VehicleBack Photo', 0));
    // } 
    else if (form.invoicePhotoImg.isNull &&
        form.invoicePhoto.doesNotHaveValue) {
      return optionOf(const Pair('Missing VendorInvoice Photo', 0));
    } else if (form.vendorInvoiceDate.isNull ||
        (form.vendorInvoiceDate?.trim().isEmpty ?? true)) {
      return optionOf(const Pair('Missing VendorInvoice Date', 0));
    } else if (form.vendorInvoiceNo.isNull ||
        (form.vendorInvoiceNo?.trim().isEmpty ?? true)) {
      return optionOf(const Pair('Missing VendorInvoice No', 0));
    } else if (form.vehicleNo.isNull ||
        (form.vehicleNo?.trim().isEmpty ?? true)) {
      return optionOf(const Pair('Missing Vehicle Number', 0));
    }

    return const None();
  }
}

@freezed
class CreateGateEntryState with _$CreateGateEntryState {
  const factory CreateGateEntryState({
    required GateEntry form,
    required bool isLoading,
    required bool isSuccess,
    required GateEntryView view,

    String? successMsg,
    Failure? error,
  }) = _CreateGateEntryState;

  factory CreateGateEntryState.initial() {
    final now = DateTime.now();
    final creationDate = DFU.friendlyFormat(DFU.now());
    final entryDate = DFU.ddMMyyyy(DFU.now());

    return CreateGateEntryState(
      form: GateEntry(creationDate: creationDate, gateEntryDate: entryDate, createTime: now.toString(), ),
      view: GateEntryView.create,
      isLoading: false,
      isSuccess: false,
    );
  }
}
