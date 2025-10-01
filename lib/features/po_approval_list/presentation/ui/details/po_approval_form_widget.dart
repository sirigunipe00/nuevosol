import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/core/utils/file_card.dart';
import 'package:nuevosol/features/po_approval_list/model/po_approval.dart';
import 'package:nuevosol/features/po_approval_list/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/po_approval_list/presentation/ui/widget/po_data_table_details.dart';
import 'package:nuevosol/features/po_approval_list/presentation/ui/widget/po_details_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/caption_text.dart';
import 'package:nuevosol/widgets/spaced_column.dart';
import 'package:nuevosol/widgets/title_status_app_bar.dart';

class PoApprovalFormWidegt extends StatelessWidget {
  const PoApprovalFormWidegt({super.key, required this.form});
  final PoApprovalForm form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TitleStatusAppBar(
        docNo: form.name,
        status: form.status!,
        textColor: AppColors.approvals,
        alignment: DocNoAlignment.vertical,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: SpacedColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          defaultHeight: 4.0,
          children: [
            const CaptionText(isRequired: false, title: 'PO Details'),
            PoDetailsWidget(form: form),
            AppSpacer.p8(),
            const CaptionText(title: 'Line Item Details', isRequired: false),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: PoDataTableDetails(),
            ),
            AppSpacer.p8(),
            const CaptionText(isRequired: false, title: 'Purchase Order Info'),
            Card(
              elevation: 15,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: SpacedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                margin: const EdgeInsets.all(12.0),
                divider: const Divider(color: AppColors.titlecolor),
                children: [
                  _TitleValueWidget('Total Quantity', '${form.totalQty}'),
                  _TitleValueWidget('Total (Exclusive of Tax) ',
                      (NumUtils.inRupeesFormat(form.total))),
                  _TitleValueWidget('Payment Term', form.paymentTerm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TitleValueWidget('Total Quantity', '${form.totalQty}'),
                      _TitleValueWidget('Total (Exclusive of Tax)',
                          NumUtils.inRupeesFormat(form.total)),
                      _TitleValueWidget('Payment Term', form.paymentTerm),
                      const SizedBox(height: 16),
                      const Text(
                        'Attachments',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      BlocBuilder<PoApprovalAttachmentsCubit,
                          PoApprovalAttachmentsState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () => const Center(child: CircularProgressIndicator()),
                            failure: (failure) => Center(child: Text(failure.error)),
                            success: (data) => SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final attachment = data[index];
                                  return MultiBlocProvider(
                                    providers: [
                                      BlocProvider(create: (context) => PoApprovalBlocProvider.get().loadPDFCubit()),
                                      BlocProvider(create: (context) => PoApprovalBlocProvider.get().downloadFiles()),
                                    ],
                                    child: FileCard(
                                        filename: attachment.fileName ?? '',
                                        report: 'http://65.21.176.38:8000${attachment.fileUrl}'),
                                  );
                                },
                              ),
                            ),
                            orElse: () => const SizedBox(),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleValueWidget extends StatelessWidget {
  const _TitleValueWidget(this.label, this.value);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        Text(
          value.valueOrEmpty,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.subtitlecolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
     