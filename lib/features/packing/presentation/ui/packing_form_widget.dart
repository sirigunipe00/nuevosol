import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_list.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/packing/model/bom.dart';
import 'package:nuevosol/features/packing/model/finished_component.dart';
import 'package:nuevosol/features/packing/model/machine_no.dart';
import 'package:nuevosol/features/packing/model/operator.dart';
import 'package:nuevosol/features/packing/model/select_process.dart';
import 'package:nuevosol/features/packing/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/packing/presentation/bloc/create_packing_cubit/create_packing_cubit.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/buttons/app_btn.dart';
import 'package:nuevosol/widgets/input_filed.dart';
import 'package:nuevosol/widgets/inputs/app_dropdown_widget.dart';
import 'package:nuevosol/widgets/multi_dropdown.dart';
import 'package:nuevosol/widgets/spaced_column.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class PackingFormWidget extends StatefulWidget {
  const PackingFormWidget({super.key});

  @override
  State<PackingFormWidget> createState() => _PackingFormWidgetState();
}

class _PackingFormWidgetState extends State<PackingFormWidget> {
  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreatePackingCubit>().state;
    final isCreating = formState.view == PackingView.create;
    final isReadOnly = !isCreating;
    final form = formState.form;

    return SpacedColumn(
      margin: const EdgeInsets.all(12.0),
      defaultHeight: 8,
      children: [
        if (isCreating)
          BlocBuilder<EmployeeListCubit, EmployeeListState>(
            builder: (_, state) {
              return state.maybeWhen(
                loading:
                    () => const Center(child: CircularProgressIndicator()),
                success: (items) {
                  final selectedIds = form.operatorName ?? [];
                  final defaultSelection =
                      items
                          .where((e) => selectedIds.contains(e.name))
                          .toList();
                  return SearchMultiDropDownList<EmployeeList>(
                    title: 'Employees',
                    items: items,
                    isMandatory: true,
                    readOnly: isReadOnly,
                    hint: 'Select Employees',
                    color: AppColors.packing,
                    defaultSelection: defaultSelection,
                    showScanner: !isReadOnly,
                    headerBuilder:
                        (_, item, __) => Text(item.employeeName ?? ''),
                    listItemBuilder:
                        (_, item, __, ___) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AppSpacer.p4(),
                            Text(item.employeeName ?? ''),
                          ],
                        ),
                    onSelected: (selected) {
                      context.cubit<CreatePackingCubit>().onValueChanged(
                        operatorName:
                            selected
                                .map((e) => e.name ?? '')
                                .where((e) => e.isNotEmpty)
                                .toList(),
                        company:
                            selected.isNotEmpty
                                ? selected.first.company
                                : form.company,
                      );
                      setState(() {});
                    },
                    onScannerTap: () async {
                      if (isReadOnly) return;
                      final scanResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => const SimpleBarcodeScannerPage(
                                scanType: ScanType.barcode,
                                appBarTitle: 'Scan Employee',
                                isShowFlashIcon: true,
                              ),
                        ),
                      );

                      if (scanResult == null || !context.mounted) return;
                      final scannedValue =
                          scanResult.toString().trim().toUpperCase();
                      final matched = items.cast<EmployeeList?>().firstWhere(
                        (e) {
                          final name = (e?.name ?? '').trim().toUpperCase();
                          final empName =
                              (e?.employeeName ?? '').trim().toUpperCase();
                          return name == scannedValue ||
                              empName == scannedValue;
                        },
                        orElse: () => null,
                      );

                      if (matched == null) {
                        _showScanMismatchDialog(
                          context,
                          'Scanned Employee is not matched with existing employees.',
                        );
                        return;
                      }

                      final currentIds = List<String>.from(
                        form.operatorName ?? [],
                      );
                      final empId = matched.name ?? '';
                      if (empId.isNotEmpty && !currentIds.contains(empId)) {
                        currentIds.add(empId);
                      }
                      context.cubit<CreatePackingCubit>().onValueChanged(
                        operatorName: currentIds,
                        company: matched.company ?? form.company,
                      );
                      setState(() {});
                    },
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          )
        else
          BlocBuilder<OperatorCubit, OperatorState>(
            builder: (_, state) {
              return state.maybeWhen(
                loading:
                    () => const Center(child: CircularProgressIndicator()),
                success: (items) {
                  return SearchMultiDropDownList<Operator>(
                    title: 'Operators',
                    items: items,
                    readOnly: true,
                    hint: 'Operators',
                    color: AppColors.packing,
                    defaultSelection: items,
                    listItemBuilder:
                        (_, item, __, ___) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.operatorName ?? item.name ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (item.operatorUserName.containsValidValue)
                              Text(item.operatorUserName ?? ''),
                          ],
                        ),
                    onSelected: (_) {},
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        InputField(
          title: 'Company',
          readOnly: true,
          hintText: 'Company',
          isRequired: true,
          initialValue: form.company,
          borderColor: AppColors.packing,
          onChanged: (company) {
            context.cubit<CreatePackingCubit>().onValueChanged(
              company: company,
            );
          },
        ),
        BlocBuilder<MachineList, MachineState>(
          builder: (_, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (items) {
                return AppDropDownWidget<MachineNo>(
                  title: 'Machine No',
                  items: items,
                  isMandatory: true,
                  showScanner: !isReadOnly,
                  key: ValueKey(form.machineNameNo),
                  readOnly: isReadOnly,
                  hint: 'Select Machine No',
                  headerBuilder: (_, item, __) => Text(item.name ?? ''),
                  defaultSelection: state.maybeWhen(
                    success: (data) {
                      final selectedReason =
                          context
                              .read<CreatePackingCubit>()
                              .state
                              .form
                              .machineNameNo;

                      if (selectedReason == null) return null;

                      return data.firstWhere(
                        (e) => e.name == selectedReason,
                        orElse: () => const MachineNo(),
                      );
                    },
                    orElse: () => null,
                  ),
                  futureRequest: (query) async {
                    if (query.isEmpty) return items;
                    return items.where((item) {
                      final orderNo = item.name?.toLowerCase() ?? '';
                      final search = query.toLowerCase();
                      return orderNo.contains(search);
                    }).toList();
                  },
                  listItemBuilder:
                      (_, item, isSelected, __) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                  onSelected: (order) {
                    if (order.isNull) return;
                    context.cubit<CreatePackingCubit>().onValueChanged(
                      machineNameNo: order!.name ?? '',
                    );
                    setState(() {});
                  },
                  onScannerTap: () async {
                    if (isReadOnly) return;
                    final scanResult = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => const SimpleBarcodeScannerPage(
                              scanType: ScanType.barcode,
                              appBarTitle: 'Scan Machine No',
                              isShowFlashIcon: true,
                            ),
                      ),
                    );

                    if (scanResult == null || !context.mounted) return;
                    final scannedValue =
                        scanResult.toString().trim().toUpperCase();
                    final matched = items.cast<MachineNo?>().firstWhere(
                      (m) =>
                          (m?.name ?? '').trim().toUpperCase() == scannedValue,
                      orElse: () => null,
                    );

                    if (matched != null) {
                      context.cubit<CreatePackingCubit>().onValueChanged(
                        machineNameNo: matched.name ?? '',
                      );
                      setState(() {});
                    } else {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text(
                                'Error',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: const Text(
                                'Scanned Machine No is not matched with existing machines.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    }
                  },
                  borderColor: AppColors.packing,
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
        BlocBuilder<SelectProcessList, SelectProcessState>(
          builder: (_, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (items) {
                return AppDropDownWidget<SelectProcess>(
                  title: 'Select Process',
                  items: items,
                  isMandatory: true,
                  showScanner: !isReadOnly,
                  key: ValueKey(form.selectProcess),
                  readOnly: isReadOnly,
                  hint: 'Select Process',
                  headerBuilder: (_, item, __) => Text(item.processName ?? ''),
                  defaultSelection: state.maybeWhen(
                    success: (data) {
                      final selectedReason =
                          context
                              .read<CreatePackingCubit>()
                              .state
                              .form
                              .selectProcess;

                      if (selectedReason == null) return null;

                      return data.firstWhere(
                        (e) => e.processName == selectedReason,
                        orElse: () => const SelectProcess(),
                      );
                    },
                    orElse: () => null,
                  ),
                  futureRequest: (query) async {
                    if (query.isEmpty) return items;
                    return items.where((item) {
                      final orderNo = item.processName?.toLowerCase() ?? '';
                      final search = query.toLowerCase();
                      return orderNo.contains(search);
                    }).toList();
                  },
                  listItemBuilder:
                      (_, item, isSelected, __) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.processName ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                  onSelected: (order) {
                    if (order.isNull) return;
                    context.cubit<CreatePackingCubit>().onValueChanged(
                      selectProcess: order!.processName ?? '',
                    );
                    setState(() {});
                  },
                  onScannerTap: () async {
                    if (isReadOnly) return;
                    final scanResult = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => const SimpleBarcodeScannerPage(
                              scanType: ScanType.barcode,
                              appBarTitle: 'Scan Process',
                              isShowFlashIcon: true,
                            ),
                      ),
                    );

                    if (scanResult == null || !context.mounted) return;
                    final scannedValue =
                        scanResult.toString().trim().toUpperCase();
                    final matched = items.cast<SelectProcess?>().firstWhere(
                      (m) =>
                          (m?.processName ?? '').trim().toUpperCase() ==
                          scannedValue,
                      orElse: () => null,
                    );

                    if (matched != null) {
                      context.cubit<CreatePackingCubit>().onValueChanged(
                        selectProcess: matched.processName ?? '',
                      );
                      setState(() {});
                    } else {
                      _showScanMismatchDialog(
                        context,
                        'Scanned Process is not matched with existing processes.',
                      );
                    }
                  },
                  borderColor: AppColors.packing,
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
        // DateSelectionField(
        //   title: 'Production Start Time',
        //   hintText: 'Select Date & Time',
        //   isRequired: true,
        //   includeTime: true,
        //   initialValue: DFU.ddMMyyyyHHmmssFromStr(
        //     form.productionStartTime ?? '',
        //   ),
        //   readOnly: isReadOnly,
        //   onDateSelect: (date) {
        //     setState(() {
        //       context.cubit<CreatePackingCubit>().onValueChanged(
        //         productionStartTime: DateFormat(
        //           'yyyy-MM-dd HH:mm:ss',
        //         ).format(date),
        //       );
        //     });
        //   },
        //   borderColor: AppColors.packing,
        //   suffixIcon: const Icon(
        //     Icons.calendar_month_outlined,
        //     color: AppColors.chimneySweep,
        //   ),
        //   firstDate: DateTime(2000),
        //   lastDate: DateTime.now(),
        // ),
        // DateSelectionField(
        //   title: 'Production End Time',
        //   hintText: 'Select Date & Time',
        //   isRequired: true,
        //   includeTime: true,
        //   initialValue: DFU.ddMMyyyyHHmmssFromStr(form.productionEndTime ?? ''),
        //   readOnly: isReadOnly,
        //   onDateSelect: (date) {
        //     setState(() {
        //       context.cubit<CreatePackingCubit>().onValueChanged(
        //         productionEndTime: DateFormat(
        //           'yyyy-MM-dd HH:mm:ss',
        //         ).format(date),
        //       );
        //     });
        //   },
        //   borderColor: AppColors.packing,
        //   suffixIcon: const Icon(
        //     Icons.calendar_month_outlined,
        //     color: AppColors.chimneySweep,
        //   ),
        //   firstDate: DateTime(2000),
        //   lastDate: DateTime.now(),
        // ),
        BlocBuilder<FinishedList, FinshedState>(
          builder: (_, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (items) {
                return AppDropDownWidget<FinishedComponent>(
                  title: 'Finished Component',
                  items: items,
                  showScanner: !isReadOnly,
                  isMandatory: true,
                  key: ValueKey(form.rawMaterialName),
                  readOnly: isReadOnly,
                  hint: 'Select Finished Component',
                  headerBuilder:
                      (_, item, __) => Text(item.componentName ?? ''),
                  defaultSelection: state.maybeWhen(
                    success: (data) {
                      final selectedReason =
                          context
                              .read<CreatePackingCubit>()
                              .state
                              .form
                              .rawMaterialName;

                      if (selectedReason == null) return null;

                      return data.firstWhere(
                        (e) => e.componentName == selectedReason,
                        orElse: () => const FinishedComponent(),
                      );
                    },
                    orElse: () => null,
                  ),
                  futureRequest: (query) async {
                    if (query.isEmpty) return items;
                    return items.where((item) {
                      final orderNo = item.componentName?.toLowerCase() ?? '';
                      final search = query.toLowerCase();
                      return orderNo.contains(search);
                    }).toList();
                  },
                  listItemBuilder:
                      (_, item, isSelected, __) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.componentName ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                  onSelected: (order) {
                    if (order.isNull) return;
                    context.cubit<CreatePackingCubit>().onValueChanged(
                      rawMaterialName: order!.componentName ?? '',
                    );
                    context.read<BomCubit>().request(order.componentName ?? '');
                    setState(() {});
                  },
                  onScannerTap: () async {
                    if (isReadOnly) return;
                    final scanResult = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => const SimpleBarcodeScannerPage(
                              scanType: ScanType.barcode,
                              appBarTitle: 'Scan Finished Component',
                              isShowFlashIcon: true,
                            ),
                      ),
                    );

                    if (scanResult == null || !context.mounted) return;
                    final scannedValue =
                        scanResult.toString().trim().toUpperCase();
                    final matched = items.cast<FinishedComponent?>().firstWhere(
                      (m) =>
                          (m?.componentName ?? '').trim().toUpperCase() ==
                          scannedValue,
                      orElse: () => null,
                    );

                    if (matched != null) {
                      context.cubit<CreatePackingCubit>().onValueChanged(
                        rawMaterialName: matched.componentName ?? '',
                      );
                      context.read<BomCubit>().request(
                        matched.componentName ?? '',
                      );
                      setState(() {});
                    } else {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text(
                                'Error',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: const Text(
                                'Scanned Finished Component is not matched.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    }
                  },
                  borderColor: AppColors.packing,
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
        BlocBuilder<BomCubit, BomState>(
          builder: (_, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (items) {
                return AppDropDownWidget<Bom>(
                  title: 'BOM Item',
                  items: items,
                  isMandatory: true,
                  key: ValueKey(form.bomItem),
                  readOnly: isReadOnly,
                  hint: 'Select Bom Item',
                  headerBuilder: (_, item, __) => Text(item.bomName ?? ''),
                  defaultSelection: state.maybeWhen(
                    success: (data) {
                      final selectedReason =
                          context.read<CreatePackingCubit>().state.form.bomItem;

                      if (selectedReason == null) return null;

                      return data.firstWhere(
                        (e) => e.bomName == selectedReason,
                        orElse: () => const Bom(),
                      );
                    },
                    orElse: () => null,
                  ),
                  futureRequest: (query) async {
                    if (query.isEmpty) return items;
                    return items.where((item) {
                      final orderNo = item.bomName?.toLowerCase() ?? '';
                      final search = query.toLowerCase();
                      return orderNo.contains(search);
                    }).toList();
                  },
                  listItemBuilder:
                      (_, item, isSelected, __) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bom Item: ${item.bomName ?? ''}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                  onSelected: (order) {
                    if (order.isNull) return;
                    context.cubit<CreatePackingCubit>().onValueChanged(
                      bomItem: order!.bomName ?? '',
                      bomQtyItem: order.bomqty ?? 0,
                    );
                    setState(() {});
                  },
                  borderColor: AppColors.packing,
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
        InputField(
          title: 'Bom Qty Item',
          hintText: 'Item qty',
          readOnly: true,
          isRequired: true,
          borderColor: AppColors.packing,
          initialValue:
              form.bomQtyItem == null ? '' : form.bomQtyItem.toString(),
          onChanged:
              (p0) => context.cubit<CreatePackingCubit>().onValueChanged(
                bomQtyItem: double.parse(p0),
              ),
        ),
        InputField(
          title: 'Ok Quantity',
          hintText: 'Enter qty',
          readOnly: isReadOnly,
          isRequired: true,
          inputType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          borderColor: AppColors.packing,
          initialValue: form.okQty == null ? '' : form.okQty.toString(),
          onChanged:
              (p0) => context.cubit<CreatePackingCubit>().onValueChanged(
                okQty: double.tryParse(p0) ?? 0,
              ),
        ),
        if (isCreating) ...[
          BlocBuilder<CreatePackingCubit, CreatePackingState>(
            builder:
                (_, state) => AppButton(
                  label: 'Save',
                  isLoading: state.isLoading,
                  bgColor: AppColors.haintBlue,
                  margin: const EdgeInsets.all(12.0),
                  onPressed: context.cubit<CreatePackingCubit>().save,
                ),
          ),
        ] else ...[
          AppButton(
            label: 'Next',
            bgColor: AppColors.haintBlue,
            margin: const EdgeInsets.all(12.0),
            onPressed: () {
              final packingForm =
                  context.read<CreatePackingCubit>().state.form;
              AppRoute.packingItemScan.push(context, extra: packingForm);
            },
          ),
        ],
      ],
    );
  }

  void _showScanMismatchDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text(
              'Error',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }
}
