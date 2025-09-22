import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/caption_text.dart';
import 'package:nuevosol/widgets/spaced_column.dart';

class TimeSelectionField extends StatefulWidget {
  const TimeSelectionField({
    super.key,
    required this.title,
    this.initialValue,
    this.readOnly = false,
    this.hintText,
    this.suffixIcon,
    required this.onTimeSelect,
    this.borderColor = AppColors.registration,
    this.isRequired =false,
  });

  final String title;
  final String? initialValue;
  final bool readOnly;
  final String? hintText;
  final Widget? suffixIcon;
  final Color? borderColor;
  final bool isRequired;
  final Function(TimeOfDay time) onTimeSelect;

  @override
  State<TimeSelectionField> createState() => _TimeSelectionFieldState();
}

class _TimeSelectionFieldState extends State<TimeSelectionField> {
  late TextEditingController controller;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue);
    if (widget.initialValue.containsValidValue) {
      final parts = widget.initialValue!.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      final timeOfDay = TimeOfDay(hour: hour, minute: minute);
      selectedTime = timeOfDay;
    }
  }

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
        // Text(
        //   widget.title,
        //   style: const TextStyle(color: Colors.black),
        // ),
         CaptionText(title: widget.title,isRequired: widget.isRequired,),
        Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.white, width: 0),
            boxShadow: [
              BoxShadow(
                color: widget.borderColor ?? AppColors.white,
                blurRadius: 0.8,
                offset: const Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: TextField(
            onTap: () {
              if (widget.readOnly) return;
              showTimePickerDialog();
            },
            controller: controller,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              border: textFieldBorder,
              enabledBorder: textFieldBorder,
              disabledBorder: textFieldBorder,
              focusedBorder: textFieldBorder,
              contentPadding: const EdgeInsets.all(16.0),
              suffixIcon: widget.suffixIcon,
              counterText: '',
              fillColor: widget.readOnly ? AppColors.himlayaPeeks : Colors.white,
              filled: widget.readOnly,
            ),
            //  obscuringCharacter: '*',
            textInputAction: TextInputAction.done,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            textCapitalization: TextCapitalization.none,
            readOnly: true,
            autocorrect: false,
          ),
        ),
      ],
    );
  }

  void showTimePickerDialog() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: this.selectedTime ?? TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        this.selectedTime = selectedTime;
        controller.text = formatTimeOfDay(selectedTime);
      });
      widget.onTimeSelect(selectedTime);
    }
  }

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    return DateFormat('HH:mm').format(DateTime(
      1970,
      1,
      1,
      timeOfDay.hour,
      timeOfDay.minute,
      0,
    ));
  }
}

