import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_text_styles.dart';
import 'package:nuevosol/widgets/caption_text.dart';
import 'package:nuevosol/core/core.dart';

class AppDropDownWidget<T> extends StatefulWidget {
  const AppDropDownWidget({
    super.key,
    this.title,
    this.hint,
    required this.items,
    required this.onSelected,
    this.defaultSelection,
    this.isMandatory = false,
    this.readOnly = false,
    this.listItemBuilder,
    this.headerBuilder,
    this.futureRequest,
    this.borderColor,
    this.showScanner = false,
    this.onScannerTap,
  });

  final String? title;
  final String? hint;
  final List<T> items;
  final HeaderBuilder<T>? headerBuilder;
  final Future<List<T>> Function(String)? futureRequest;
  final Widget Function(BuildContext, T, bool, void Function())?
  listItemBuilder;
  final T? defaultSelection;
  final bool isMandatory;
  final bool readOnly;
  final Color? borderColor;
  final bool showScanner;
  final VoidCallback? onScannerTap;
  final dynamic Function(T? item)? onSelected;

  @override
  State<AppDropDownWidget<T>> createState() => _AppDropDownWidgetState<T>();
}

class _AppDropDownWidgetState<T> extends State<AppDropDownWidget<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.defaultSelection;
  }

  @override
  void didUpdateWidget(covariant AppDropDownWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If defaultSelection changes, update the internal _selectedValue
    if (widget.defaultSelection != oldWidget.defaultSelection) {
      setState(() {
        selectedValue = widget.defaultSelection;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.readOnly,
      child: Column(
        key: widget.key,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.title.containsValidValue) ...[
            CaptionText(title: widget.title!, isRequired: widget.isMandatory),
          ],
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: DefaultTextStyle(
                  style: AppTextStyles.titleLarge(
                    context,
                  ).copyWith(color: AppColors.black),
                  child: CustomDropdown<T>.searchRequest(
                    decoration: CustomDropdownDecoration(
                      hintStyle: AppTextStyles.titleLarge(
                        context,
                      ).copyWith(color: AppColors.black),
                      closedBorder: Border.all(
                        width: 0.8,
                        color: AppColors.black,
                      ),
                      expandedBorder: Border.all(
                        width: 0.8,
                        color: AppColors.black,
                      ),
                      closedShadow: [
                        BoxShadow(
                          color: (widget.borderColor ?? Colors.black),
                          blurRadius: 2,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),

                    futureRequest: widget.futureRequest,
                    hintText: widget.hint,
                    items: widget.items,
                    headerBuilder: widget.headerBuilder,
                    listItemBuilder: widget.listItemBuilder,
                    onChanged: widget.onSelected,
                    initialItem: widget.defaultSelection,
                  ),
                ),
              ),

              if (widget.showScanner) ...[
                const SizedBox(width: 8),
                InkWell(
                  onTap: widget.onScannerTap,
                  child: const Icon(
                    Icons.qr_code_scanner,
                    size: 52,
                    color: AppColors.black,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
