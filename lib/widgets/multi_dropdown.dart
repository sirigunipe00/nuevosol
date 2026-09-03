import 'package:flutter/material.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_list.dart';
import 'package:nuevosol/features/packing/model/operator.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/caption_text.dart';

class SearchMultiDropDownList<T> extends StatefulWidget {
  const SearchMultiDropDownList({
    super.key,
    this.title,
    this.hint,
    required this.items,
    required this.onSelected,
    this.defaultSelection = const [],
    this.isMandatory = false,
    this.readOnly = false,
    this.isloading = false,
    this.listItemBuilder,
    this.headerBuilder,
    this.futureRequest,
    this.fontSize,
    this.hintBuilder,
    this.closedFillColor,
    this.focusNode,
    this.color = AppColors.black,
    this.borderColor,
    this.showScanner = false,
    this.onScannerTap,
  });

  final String? title;
  final String? hint;
  final double? fontSize;
  final List<T> items;
  final HeaderBuilder<T>? headerBuilder;
  final ListMultiItemBuilder<T>? listItemBuilder;
  final HintBuilder? hintBuilder;
  final Future<List<T>> Function(String)? futureRequest;
  final List<T> defaultSelection;
  final bool isMandatory;
  final bool readOnly;
  final bool isloading;
  final Color color;
  final Color? borderColor;
  final Color? closedFillColor;
  final void Function(List<T> items) onSelected;
  final FocusNode? focusNode;
  final bool showScanner;
  final VoidCallback? onScannerTap;

  @override
  State<SearchMultiDropDownList<T>> createState() =>
      _SearchMultiDropDownListState<T>();
}

class _SearchMultiDropDownListState<T>
    extends State<SearchMultiDropDownList<T>> {
  late List<T> _selectedValues;
  final scrollCtlr = ScrollController();

  @override
  void initState() {
    super.initState();
    _selectedValues = List<T>.from(widget.defaultSelection);
  }

  @override
  void didUpdateWidget(covariant SearchMultiDropDownList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.defaultSelection != oldWidget.defaultSelection) {
      _selectedValues = List<T>.from(widget.defaultSelection);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final isReadOnlyMode = widget.readOnly;
    // final backgroundColor =
    //     isReadOnlyMode ? AppColors.grey.withValues(alpha: 0.20) : Colors.white;
    // final borderColor =
    //     isReadOnlyMode
    //         ? Colors.grey.withValues(alpha: 0.3)
    //         : AppColors.grey.withValues(alpha: 0.30);

    return Focus(
      focusNode: widget.focusNode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title?.isNotEmpty == true) ...[
            CaptionText(
              title: widget.title ?? '',
              color: widget.color,
              isRequired: widget.isMandatory,
            ),
            AppSpacer.p4(),
          ],
          Row(
            children: [
              Expanded(
                child: AbsorbPointer(
                  absorbing: widget.readOnly || widget.isloading,
                  child: GestureDetector(
                    onTap: _openBottomSheet,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color:
                            widget.readOnly
                                ? const Color(0xFFEEEEEE)
                                : Colors.white,
                       border: Border.all(color: AppColors.black),
                        boxShadow: [
                          BoxShadow(
                            color: widget.color,
                            blurRadius: 2,
                            offset: const Offset(2, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child:
                          widget.isloading
                              ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Loading...',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              )
                              : _selectedValues.isNotEmpty
                              ? Text(
                                _selectedValues
                                    .map(_displayName)
                                    .where((name) => name.isNotEmpty)
                                    .join(', '),
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Urbanist',
                                ),
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                              )
                              : Text(
                                widget.hint ?? 'Select items',
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.black.withValues(alpha: 0.6),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Urbanist',
                                ),
                              ),
                    ),
                  ),
                ),
              ),
              if (widget.showScanner) ...[
                const SizedBox(width: 8),
                InkWell(
                  onTap: widget.readOnly ? null : widget.onScannerTap,
                  child: Icon(
                    Icons.qr_code_scanner,
                    size: 52,
                    color: widget.readOnly ? AppColors.grey : AppColors.black,
                  ),
                ),
              ],
            ],
          ),
          AppSpacer.p4(),
        ],
      ),
    );
  }

  Future<void> _openBottomSheet() async {
    final tempSelected = List<T>.from(_selectedValues);
    final results = await showModalBottomSheet<List<T>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        final availableItems = widget.items;
        List<T> filteredItems = List.from(availableItems);
        final searchController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setModalState) {
            void filterItems(String query) {
              setModalState(() {
                filteredItems =
                    availableItems.where((item) {
                      String itemName = '';
                      if (item is EmployeeList) {
                        itemName = [
                          item.name ?? '',
                          item.employeeName ?? '',
                          item.company ?? '',
                        ].join(' ');
                      } else if (item is Operator) {
                        itemName = [
                          item.operatorName ?? '',
                          item.operatorUserName ?? '',
                          item.name ?? '',
                        ].join(' ');
                      } else {
                        itemName = item.toString();
                      }
                      return itemName.toLowerCase().contains(
                        query.toLowerCase(),
                      );
                    }).toList();
              });
            }

            return SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        bottom: 8.0,
                        top: 20.0,
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: filterItems,
                      ),
                    ),
                    Expanded(
                      child:
                          filteredItems.isNotEmpty
                              ? ListView.builder(
                                controller: scrollCtlr,
                                itemCount: filteredItems.length,
                                itemBuilder: (context, index) {
                                  final item = filteredItems[index];
                                  final isSelected = tempSelected.contains(
                                    item,
                                  );
                                  return CheckboxListTile(
                                    title:
                                        widget.listItemBuilder != null
                                            ? widget.listItemBuilder!(
                                              context,
                                              item,
                                              index,
                                              isSelected,
                                            )
                                            : Text(_displayName(item)),
                                    value: isSelected,
                                    onChanged: (checked) {
                                      setModalState(() {
                                        if (checked == true) {
                                          tempSelected.add(item);
                                        } else {
                                          tempSelected.remove(item);
                                        }
                                      });
                                    },
                                  );
                                },
                              )
                              : Center(
                                child: Text(
                                  'No results found',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.packing,
                        ),
                        onPressed: () {
                          Navigator.pop(context, tempSelected);
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (results != null) {
      setState(() {
        _selectedValues = results;
      });
      widget.onSelected(_selectedValues);
    }
  }

  String _displayName(T item) {
    if (item is EmployeeList) {
      return item.employeeName.containsValidValue
          ? '${item.name ?? ''} - ${item.employeeName}'
          : (item.name ?? '');
    }
    if (item is Operator) {
      return item.operatorName.containsValidValue
          ? (item.operatorName ?? '')
          : (item.name ?? '');
    }
    return item.toString();
  }
}
