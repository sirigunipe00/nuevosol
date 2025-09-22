import 'package:flutter/material.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_text_styles.dart';

class DocStatusWidget extends StatelessWidget {
  const DocStatusWidget({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, 
      height: 20, 
      alignment: Alignment.center, 
      decoration: BoxDecoration(
        color: toColor(),
        border: Border.all(color: toColor()),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppTextStyles.labelLarge(context).copyWith(
          color: toTextColor(),
          fontSize: 10,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

 Color toColor() => switch(status.trim()) {
    'Submitted' => const Color(0xFFEDF6FD),
    'Completed'|| 'Rejected' => const Color(0xFFe4f5e9),
    'Draft' || 'Cancelled' => const Color(0xFFFFF0F0),
    String() => AppColors.black,
  };

  Color toTextColor() => switch(status.trim()) {
    'Submitted' => const Color(0xFF1172C9),
    'Completed' || 'Rejected' => const Color(0xFF16794c),
    'Draft' || 'Cancelled' => const Color(0xFFFE6061),
    String() => AppColors.white,
  };
}
