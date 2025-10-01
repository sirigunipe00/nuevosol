import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_approval_attachments.freezed.dart';
part 'po_approval_attachments.g.dart';

@freezed
class PoApprovalAttachments with _$PoApprovalAttachments {
  const factory PoApprovalAttachments({
    
    @JsonKey(name: 'file_name', defaultValue: '')  String? fileName,
    @JsonKey(name: 'file_url',defaultValue: '')   String? fileUrl,
    
  }) = _PoApprovalAttachments;

  factory PoApprovalAttachments.fromJson(Map<String, dynamic> json)
      => _$PoApprovalAttachmentsFromJson(json);
}



