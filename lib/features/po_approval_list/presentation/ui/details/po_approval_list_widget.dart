import 'package:flutter/material.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/doc_status_widget.dart';
import 'package:nuevosol/features/po_approval_list/model/po_approval.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_icons.dart';
import 'package:nuevosol/styles/app_text_styles.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/buttons/app_view_btn.dart';
import 'package:nuevosol/widgets/spaced_column.dart';


class PoApprovalListWidget extends StatelessWidget {
  const PoApprovalListWidget({
    super.key,
    required this.onTap,
    required this.poApproval,
  });

  final PoApprovalForm poApproval;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: AppColors.approvals, width: 1)),
        child: Stack(
          children: [
            Positioned.fill(
              left: context.sizeOfWidth * 0.3,
              child: Image(
                image: AssetImage(AppIcons.approval.path),
                fit: BoxFit.fill,
              ),
            ),
            SpacedColumn(
              defaultHeight: 4,
              margin: const EdgeInsets.all(12),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(poApproval.name,
                        style: AppTextStyles.titleLarge(context)
                            .copyWith(color: AppColors.black)),
                    Text(DFU.ddMMyyyyFromStr(poApproval.creationDate),
                        style: AppTextStyles.titleLarge(context)
                            .copyWith(color: AppColors.black)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(poApproval.vendorName,
                          style: AppTextStyles.titleLarge(context)
                              .copyWith(color: AppColors.black)),
                    ),
                    AppSpacer.p4(),
                             Text(DFU.timeLabelFromStr(poApproval.creationDate),
                        style: AppTextStyles.titleLarge(context)
                            .copyWith(color: AppColors.black)),
                  ],
                ),
                AppSpacer.p8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ViewBtn(onPressed: onTap),
                    DocStatusWidget(status: poApproval.status.valueOrEmpty)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
