import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_approval.freezed.dart';
part 'po_approval.g.dart';

@freezed
class PoApprovalForm with _$PoApprovalForm {
  const factory PoApprovalForm({
    String? status,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'supplier') required String vendor,
    @JsonKey(name: 'supplier_name') required String vendorName,
    @JsonKey(name: 'creation') required String creationDate,
    @JsonKey(name: 'company') required String requestedBy,
    @JsonKey(name: 'grand_total', defaultValue: 0.0) required double grandTotal,
    @JsonKey(name: 'total_qty', defaultValue: 0.0) required double totalQty,
    @JsonKey(name: 'total', defaultValue: 0.0) required double total,
    @JsonKey(name: 'payment_terms_template') String? paymentTerm,
    @JsonKey(name: 'schedule_date') String? requiredBy,
    @JsonKey(name: 'contact_person', defaultValue: '')
    required String vendorsContact,
    @JsonKey(name: 'workflow_state') required String state,
  }) = _PoApprovalForm;

  factory PoApprovalForm.fromJson(Map<String, Object?> json) =>
      _$PoApprovalFormFromJson(json);
}

extension PoApprovalFormExt on PoApprovalForm {
  String approvalAction(bool approve) {
    log('state....:$state');
    if (state == 'Draft') {
      return 'Send for Review';
    } else if (state == 'Reviewed') {
      return approve ? 'Send For Approval' : 'Reject';
    }
    // else if (state == 'Pending From Himanshu') {
    //   return approve ? 'Approve' : 'Reject';
    // } else if (state == 'Pending From Aman') {
    //   return approve ? 'Send For Himanshu Approval' : 'Reject';
    // }
    else if (state == 'Approved') {
      return 'Cancel';
    }
    return approve ? 'Approve' : 'Reject';
  }
}
