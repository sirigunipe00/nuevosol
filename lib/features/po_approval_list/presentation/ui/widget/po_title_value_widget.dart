import 'package:flutter/material.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/spaced_column.dart';


class POTitleValueWidget extends StatelessWidget {
  const POTitleValueWidget({
    super.key,
    required this.title,
    this.leading,
    required this.subtitle,
    this.trailing,
  });

  final String title;
  final IconData? leading;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SpacedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (leading != null) ...[
                    Icon(leading, color: AppColors.titlecolor, size: 18),
                    AppSpacer.p8()
                  ],
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.titlecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  if (leading != null) ...[const SizedBox(width: 26)],
                  Expanded(
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.subtitlecolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        if (trailing != null) ...[trailing!]
      ],
    );
  }
}
