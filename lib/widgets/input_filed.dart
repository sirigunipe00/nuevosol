import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_text_styles.dart';
import 'package:nuevosol/widgets/caption_text.dart';
import 'package:nuevosol/widgets/spaced_column.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.title,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.inputType = TextInputType.text,
    this.maxLength = 255,
    this.readOnly = false,
    this.hintText,
    this.suffixIcon,
    this.autofocus = false,
    this.borderColor,
    this.minLines,
    this.maxLines,
    this.inputFormatters,
    this.isRequired = false,
    TextEditingController? controller,
  }) {
    this.controller = controller ?? TextEditingController();
    if (initialValue?.isNotEmpty == true) {
      this.controller?.text = initialValue!;
    }
  }

  final String title;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputType inputType;
  final int maxLength;
  final bool readOnly;
  final String? hintText;
  final Widget? suffixIcon;
  final Color? borderColor;
  late final TextEditingController? controller;
  final bool autofocus;
  final bool isRequired;
  final int? minLines;
   final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  
  

  @override
  Widget build(BuildContext context) {
    final textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: AppColors.black, width: 0.8),
    );

    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4.0,
      children: [
        CaptionText(title: title, isRequired: isRequired),
        Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.white),
            boxShadow: [
              BoxShadow(
                color: borderColor ?? AppColors.white,
                blurRadius: 2,
                offset: const Offset(2, 2)
              ),
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: TextField(
            style:  AppTextStyles.textEntryStyle(context).copyWith(color: Colors.grey[800]),

            controller: controller,
            decoration: InputDecoration(
              border: textFieldBorder,
              enabledBorder: textFieldBorder,
              focusedBorder: textFieldBorder,
              contentPadding: const EdgeInsets.all(16.0),
              suffixIcon: suffixIcon,
              counterText: '',
              filled: readOnly, 
              fillColor: readOnly ? AppColors.himlayaPeeks : Colors.white,

            ),
            obscuringCharacter: '*',
            textInputAction: TextInputAction.done,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            keyboardType: inputType,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            textCapitalization: TextCapitalization.none,
            readOnly: readOnly,
            minLines: minLines,
            maxLines: minLines,
            autocorrect: false,
            autofocus: autofocus,
          ),
        ),
      ],
    );
  }
}