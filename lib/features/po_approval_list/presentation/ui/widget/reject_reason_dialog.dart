import 'package:flutter/material.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/caption_text.dart';


class RejectReasonDialog extends StatefulWidget {
  const RejectReasonDialog({super.key});

  @override
  State<RejectReasonDialog> createState() => _RejectReasonDialogState();
}

class _RejectReasonDialogState extends State<RejectReasonDialog> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText = 'Reject reason is mandatory';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(18.0),
      contentPadding: const EdgeInsets.all(18.0),
      titlePadding: const EdgeInsets.all(18.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      content: SizedBox(
        width: context.sizeOfWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CaptionText(title: 'Reject Reason'),
            AppSpacer.p12(),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter your reject reason here...',
                alignLabelWithHint: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                errorText: _errorText,
              ),
              maxLength: 64,
              minLines: 3,
              maxLines: 6,
              onChanged: (value) {
                if (value.doesNotHaveValue) {
                  setState(() {
                    _errorText = 'Reject reason is mandatory';
                  });
                } else {
                  setState(() {
                    _errorText = null;
                  });
                }
              },
              validator: (value) {
                if (value.doesNotHaveValue) {
                  return 'Reject reason is mandatory';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: const Text('REJECT', style: TextStyle(color: AppColors.red)),
        ),
        OutlinedButton(
            child: const Text('CANCEL'),
            onPressed: () => Navigator.of(context).pop('')),
      ],
    );
  }
}
