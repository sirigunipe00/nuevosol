import 'package:flutter/material.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/doc_status_widget.dart';
import 'package:nuevosol/features/packing/model/packing_model.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_icons.dart';
import 'package:nuevosol/styles/app_text_styles.dart';
import 'package:nuevosol/widgets/buttons/app_view_btn.dart';
import 'package:nuevosol/widgets/spaced_column.dart';

class PackingWidget extends StatelessWidget {
  const PackingWidget({
    super.key,
    required this.packing,
    required this.onTap,
  });

  final PackingModel packing;
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
          side: const BorderSide(color: AppColors.packing, width: 2)
        ),
        child: Stack(
          children: [
            Positioned.fill(
              left: context.sizeOfWidth * 0.3,
              child: Image(
                image: AssetImage(AppIcons.gateEntryCurves.path),
                fit: BoxFit.fill,
              ),
            ),
            SpacedColumn(
              defaultHeight: 4,
              margin: const EdgeInsets.all(10),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(packing.name ?? '', style: AppTextStyles.titleMedium(context,AppColors.black).copyWith(color: AppColors.black)),
                    Text(DFU.ddMMyyyyFromStr(packing.creation ?? ''),style: AppTextStyles.titleLarge(context).copyWith(color: AppColors.black)),

                  ],
                ),
                // Text(packing.purchaseOrder ?? '', style: AppTextStyles.titleLarge(context).copyWith(color: AppColors.black)),
                // AppSpacer.p8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ViewBtn(onPressed: onTap),
                    DocStatusWidget(status: StringUtils.docStatus(packing.docstatus ?? 0),),
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
