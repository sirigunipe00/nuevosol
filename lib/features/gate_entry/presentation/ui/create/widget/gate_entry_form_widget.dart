import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/gate_entry/model/supplier_form.dart';
import 'package:nuevosol/features/gate_entry/model/purchase_order_form.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/create_gate_entry_cubit/create_gateentry_cubit.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/buttons/app_btn.dart';
import 'package:nuevosol/widgets/drop_down_options.dart';
import 'package:nuevosol/widgets/input_filed.dart';
import 'package:nuevosol/widgets/inputs/app_dropdown_widget.dart';
import 'package:nuevosol/widgets/inputs/compact_listtile.dart';
import 'package:nuevosol/widgets/inputs/date_selection_field.dart';
import 'package:nuevosol/widgets/inputs/image_selection_widget1.dart';
import 'package:nuevosol/widgets/inputs/time_picker.dart';
import 'package:nuevosol/widgets/spaced_column.dart';

class GateEntryFormWidget extends StatefulWidget {
  const GateEntryFormWidget({super.key});

  @override
  State<GateEntryFormWidget> createState() => _GateEntryFormWidgetState();
}

class _GateEntryFormWidgetState extends State<GateEntryFormWidget> {
  final TextEditingController scrollController = TextEditingController();
  final TextEditingController remarks = TextEditingController();
  final TextEditingController vehicleNo = TextEditingController();
  final TextEditingController invoiceNo = TextEditingController();

  final indianFormat = NumberFormat.decimalPattern('en_IN');
  final invoiceAmountController = TextEditingController();
  PurchaseOrderForm? purchaseOrderForm;
  SupplierForm? customerForm;
  @override
  void initState() {
    super.initState();
    final form = context.read<CreateGateEntryCubit>().state.form;

    if (form.invoiceAmount != null) {
      invoiceAmountController.text = indianFormat.format(form.invoiceAmount);
    }

    invoiceAmountController.addListener(() {
      final text = invoiceAmountController.text.replaceAll(',', '');
      final value = int.tryParse(text);

      if (value != null) {
        context.cubit<CreateGateEntryCubit>().onValueChanged(
          invoiceAmount: value,
        );

        // format back with commas
        final newText = indianFormat.format(value);
        if (invoiceAmountController.text != newText) {
          final selectionIndex =
              invoiceAmountController.selection.baseOffset +
              (newText.length - invoiceAmountController.text.length);

          invoiceAmountController.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(
              offset: selectionIndex.clamp(0, newText.length),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateGateEntryCubit>().state;
    final isCreating = formState.view == GateEntryView.create;
    final isCompleted = formState.view == GateEntryView.completed;
    final form = formState.form;

    final indianFormat = NumberFormat.decimalPattern('en_IN');

    return SpacedColumn(
      margin: const EdgeInsets.all(12.0),
      defaultHeight: 8,
      children: [
        // InputField(
        //   title: 'Purchase Order No',
        //   hintText: 'Enter Purchase Order No',
        //   readOnly: isCompleted,
        //   isRequired: true,
        //   borderColor: AppColors.grey,
        //   initialValue: form.purchaseOrder,
        //   onChanged:
        //       (p0) => context.cubit<CreateGateEntryCubit>().onValueChanged(
        //         purchaseOrder: p0,
        //       ),
        // ),
        BlocBuilder<PurchaseOrders, PurchaseOrdersState>(
          builder: (_, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (items) {
                return AppDropDownWidget<PurchaseOrderForm>(
                  title: 'PO Number',
                  items: items,
                  // color: Colors.black,
                  key: UniqueKey(),
                  readOnly: isCompleted,
                  hint: 'Select PO Number',
                  headerBuilder: (_, item, __) => Text(item.name ?? ''),
                  defaultSelection:
                      purchaseOrderForm ??
                      (form.purchaseOrder.containsValidValue
                          ? PurchaseOrderForm(name: form.purchaseOrder!)
                          : null),
                  futureRequest: (query) async {
                    if (query.isEmpty) return items;
                    return items.where((item) {
                      final orderNo = item.name?.toLowerCase() ?? '';
                      final customer = item.supplierName?.toLowerCase() ?? '';
                      final workflow = item.workFlowState?.toLowerCase() ?? '';
                      final search = query.toLowerCase();
                      return orderNo.contains(search) ||
                          customer.contains(search) ||
                          workflow.contains(search);
                    }).toList();
                  },
                  listItemBuilder:
                      (_, item, isSelected, __) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Purchase Order No: ${item.name ?? ''}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          AppSpacer.p4(),
                          Text(
                            "Schedules Date: ${DFU.ddMMyyyyFromStr(item.scheduleDate ?? '')}",
                          ),
                          Text("Supplier Name: ${item.supplierName ?? ''}"),
                          Text("WorkFlow: ${item.workFlowState ?? ''}"),
                        ],
                      ),
                  onSelected: (order) {
                    if (order.isNull) return;
                    context.cubit<CreateGateEntryCubit>().onValueChanged(
                      purchaseOrder: order!.name ?? '',
                    );
                  },
                  borderColor: AppColors.marigoldDDust,
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),

        InputField(
          title: 'Vehicle Number',
          readOnly: isCompleted,
          hintText: 'Enter Your Vehicle Number',
          isRequired: true,
          controller: vehicleNo,
          initialValue: form.vehicleNo,
          inputFormatters: [UpperCaseTextFormatter()],
          borderColor: AppColors.marigoldDDust,
          onChanged: (vehicleNum) {
            context.cubit<CreateGateEntryCubit>().onValueChanged(
              vehicleNo: vehicleNum,
            );
          },
        ),
        Row(
          children: [
            Expanded(
              child: BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
                buildWhen:
                    (pv, curr) =>
                        pv.form.vehiclePhoto != curr.form.vehiclePhoto,
                builder: (_, state) {
                  return ImageSelectionWidget1(
                    title: 'Vehicle Photo',
                    readOnly: isCompleted,
                    key: ValueKey(state.form.vehiclePhoto),
                    borderColor: AppColors.marigoldDDust,
                    defaultVal: state.form.vehiclePhoto,
                    placeholder: const Icon(
                      Icons.local_shipping,
                      size: 64,
                      color: AppColors.chimneySweep,
                    ),
                    onView: () {
                      final data = Pair(
                        form.name ?? 'Vehicle Photo',
                        state.form.vehiclePhoto,
                      );
                      AppRoute.newGateEntryPreview.push(context, extra: data);
                    },
                    onImage: (file) {
                      if (file.isNull) {
                        context
                            .cubit<CreateGateEntryCubit>()
                            .clearVehiclePhoto();
                      } else {
                        context.cubit<CreateGateEntryCubit>().onValueChanged(
                          vehiclePhoto: file,
                        );
                      }
                    },
                  );
                },
              ),
            ),
            AppSpacer.p12(),
            Expanded(
              child: BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
                buildWhen:
                    (pv, curr) =>
                        pv.form.invoicePhoto != curr.form.invoicePhoto,
                builder: (context, state) {
                  return ImageSelectionWidget1(
                    title: 'Invoice Photo',
                    readOnly: isCompleted,
                    key: ValueKey(state.form.invoicePhoto),
                    borderColor: AppColors.marigoldDDust,
                    defaultVal: state.form.invoicePhoto,
                    placeholder: const Icon(
                      Icons.description,
                      size: 64,
                      color: AppColors.chimneySweep,
                    ),
                    onView: () {
                      final data = Pair(
                        form.name ?? 'Vendor Invoice Photo',
                        state.form.invoicePhoto,
                      );
                      AppRoute.newGateEntryPreview.push(context, extra: data);
                    },
                    onImage: (file) {
                      if (file.isNull) {
                        context
                            .cubit<CreateGateEntryCubit>()
                            .clearInvoicePhoto();
                      } else {
                        context.cubit<CreateGateEntryCubit>().onValueChanged(
                          invoicePhoto: file,
                        );
                      }
                    },
                  );
                },
              ),
              // child: BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
              //   buildWhen:
              //       (pv, curr) =>
              //           pv.form.vehicleBackPhoto != curr.form.vehicleBackPhoto,
              //   builder: (_, state) {
              //     return ImageSelectionWidget1(
              //       title: 'Vechicle Back Photo',
              //       readOnly: isCompleted,
              //       key: ValueKey(state.form.vehicleBackPhoto),
              //       borderColor: AppColors.marigoldDDust,
              //       defaultVal: state.form.vehicleBackPhoto,
              //       placeholder: const Icon(
              //         Icons.local_shipping,
              //         size: 64,
              //         color: AppColors.chimneySweep,
              //       ),
              //       onView: () {
              //         final data = Pair(
              //           form.name ?? 'Vechicle Back Photo',
              //           state.form.vehicleBackPhoto,
              //         );
              //         AppRoute.newGateEntryPreview.push(context, extra: data);
              //       },
              //       onImage: (file) {
              //         if (file.isNull) {
              //           context
              //               .cubit<CreateGateEntryCubit>()
              //               .clearVehicleBackPhoto();
              //         } else {
              //           context.cubit<CreateGateEntryCubit>().onValueChanged(
              //             vehicleBackPhoto: file,
              //           );
              //         }
              //       },
              //     );
              //   },
              // ),
            ),
          ],
        ),

        InputField(
          title: 'DC/Invoice Number',
          readOnly: isCompleted,
          hintText: 'Enter Invoice Number',
          isRequired: true,
          initialValue: form.vendorInvoiceNo,
          borderColor: AppColors.marigoldDDust,
          onChanged: (invNumber) {
            context.cubit<CreateGateEntryCubit>().onValueChanged(
              vendorInvoiceNo: invNumber,
            );
          },
        ),
        DateSelectionField(
          title: 'DC/Invoice Date',
          hintText: 'Select Date',
          isRequired: true,
          initialValue: DFU.ddMMyyyyFromStr(form.vendorInvoiceDate ?? ''),
          readOnly: isCompleted,
          // startDate: DFU.now().subtract(const Duration(days: 60)),
          // endDate: DFU.now(),
          onDateSelect: (date) {
            setState(() {
              if (formState.form.docStatus == 0) {
                context.cubit<CreateGateEntryCubit>().onValueChanged(
                  vendorInvoiceDate: DateFormat('yyyy-MM-dd').format(date),
                );
              } else {
                context.cubit<CreateGateEntryCubit>().onValueChanged(
                  vendorInvoiceDate: DateFormat('dd-MM-yyyy').format(date),
                );
              }
            });
          },
          borderColor: AppColors.marigoldDDust,
          suffixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: AppColors.chimneySweep,
          ),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        ),
        AppDropDownWidget<String>(
          title: 'Unit Type',
          hint: 'Select Unit Type',
          readOnly: isCompleted,
          // color: AppColors.black,
          items: Dropdownoptions.untis,
          defaultSelection: form.customeUnit1,
          headerBuilder: (_, item, __) => Text(item),
          listItemBuilder: (_, item, __, ___) => CompactListTile(title: item),
          futureRequest: (searchText) async {
            const all = Dropdownoptions.untis;
            if (searchText.trim().isEmpty) return all;
            return all
                .where(
                  (item) => item.toLowerCase().contains(
                    searchText.trim().toLowerCase(),
                  ),
                )
                .toList();
          },
          onSelected: (selected) {
            context.cubit<CreateGateEntryCubit>().onValueChanged(
              customUnit1: selected,
            );
          },
          borderColor: AppColors.marigoldDDust,
        ),

        BlocBuilder<SupplierList, SupplierState>(
          buildWhen: (previous, current) => previous != current,

          builder: (_, state) {
            final allData = state.maybeWhen(
              orElse: () => <SupplierForm>[],
              success: (data) => data,
            );

            final names = allData.toList();

            return AppDropDownWidget<SupplierForm>(
              title: 'Supplier',
              hint: 'Search Supplier',
              key: UniqueKey(),
              items: names,
              readOnly: isCompleted,
              defaultSelection:
                  (context.read<CreateGateEntryCubit>().state.form.customSupplier != null &&
                          context.read<CreateGateEntryCubit>().state.form
                              .customSupplier! .isNotEmpty)
                      ? names.firstWhere(
                        (g) => g.name ==
                            context.read<CreateGateEntryCubit>().state.form.customSupplier,
                        orElse: () => const SupplierForm(),
                      ): null,

              futureRequest: (query) async {
                if (query.isEmpty) return names;

                return names.where((item) {
                  final orderNo = item.name?.toLowerCase() ?? '';
                  final supplierGruop = item.supplierGruop?.toLowerCase() ?? '';
                  final search = query.toLowerCase();

                  return orderNo.contains(search) ||
                      supplierGruop.contains(search);
                }).toList();
              },

              headerBuilder:
                  (_, item, __) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

              listItemBuilder:
                  (_, item, __, ___) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Supplier Name : ${item.name ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                      if (item.supplierGruop != null)
                        Text('Supplier Gruop : ${item.supplierGruop}'),
                      const Divider(height: 8),
                    ],
                  ),

              onSelected: (selected) {
                setState(() {
                  customerForm = selected;

                  context.cubit<CreateGateEntryCubit>().onValueChanged(
                    customSupplier: selected!.name,
                  );
                });
              },
              borderColor: AppColors.marigoldDDust,
            );
          },
        ),
        InputField(
          title: 'DC/Invoice Quantity',
          hintText: 'Enter Invoice Quantity',
          readOnly: isCompleted,
          initialValue:
              form.invoiceQuantity != null
                  ? form.invoiceQuantity.toString()
                  : '',
          borderColor: AppColors.marigoldDDust,
          inputType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (qty) {
            final intValue = int.tryParse(qty);
            context.cubit<CreateGateEntryCubit>().onValueChanged(
              invoiceQuantity: intValue,
            );
          },
        ),
        InputField(
          title: 'Invoice Amount',
          hintText: 'Enter Invoice Amount',
          readOnly: isCompleted,
          controller: invoiceAmountController,
          initialValue:
              form.invoiceAmount != null
                  ? indianFormat.format(form.invoiceAmount)
                  : '',
          borderColor: AppColors.marigoldDDust,
          inputType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (amount) {
            final cleaned = amount.replaceAll(',', '');
            final intValue = int.tryParse(cleaned);
            context.cubit<CreateGateEntryCubit>().onValueChanged(
              invoiceAmount: intValue,
            );
          },
        ),
        DateSelectionField(
          title: 'Gate Entry Date',
          filled: true,
          initialValue: form.gateEntryDate,
          firstDate: DFU.now(),
          lastDate: DFU.now(),
          onDateSelect: (date) {},
          readOnly: true,
          isRequired: true,
          borderColor: AppColors.marigoldDDust,
          suffixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: AppColors.black,
          ),
        ),
        TimeSelectionField(
          title: 'Gate Entry Time',
          initialValue: formatTime(form.createTime), 
          readOnly: true, 
          onTimeSelect: (_) {}, 
          borderColor: AppColors.marigoldDDust,
          suffixIcon: const Icon(
            Icons.access_time_filled,
            color: AppColors.black,
          ),
          isRequired: false,
        ),
        // InputField(
        //   title: 'Unit 1',
        //   hintText: 'Enter Unit 1',
        //   readOnly: isCompleted,
        //   initialValue: form.customeUnit1,
        //   borderColor: AppColors.marigoldDDust,

        //   onChanged: (qty) {
        //     context.cubit<CreateGateEntryCubit>().onValueChanged(
        //       customUnit1: qty,
        //     );
        //   },
        // ),
        // InputField(
        //   title: 'Unit 2',
        //   hintText: 'Enter Unit 2',
        //   readOnly: isCompleted,
        //   initialValue: form.customeUnit2,
        //   borderColor: AppColors.marigoldDDust,
        //   onChanged: (qty) {
        //     context.cubit<CreateGateEntryCubit>().onValueChanged(
        //       customUnit2: qty,
        //     );
        //   },
        // ),
        InputField(
          title: 'Remarks',
          hintText: 'Enter Your Remarks',
          readOnly: isCompleted,
          controller: remarks,
          initialValue: form.remarks,
          borderColor: AppColors.marigoldDDust,
          minLines: 3,
          onChanged: (remarks) {
            context.cubit<CreateGateEntryCubit>().onValueChanged(
              remarks: remarks,
            );
          },
        ),
        if (isCreating) ...[
          BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
            builder:
                (_, state) => AppButton(
                  label: isCreating ? 'Save' : 'Submit',
                  isLoading: state.isLoading,
                  bgColor: AppColors.haintBlue,
                  margin: const EdgeInsets.all(12.0),
                  onPressed: context.cubit<CreateGateEntryCubit>().save,
                ),
          ),
        ],
      ],
    );
  }

  // Future<List<PurchaseOrder>> _onSearch(
  //   List<PurchaseOrder> data,
  //   String query,
  // ) async {
  //   final filterData = data.where((e) => e.poNumber.contains(query)).toList();
  //   return filterData;
  // }

  //   Future<List<PurchaseOrderForm>> _onSearch(
  //     List<PurchaseOrderForm> data, String query) async {
  //   final filterData = data
  //       .where((e) => (e.name ?? '').toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  //   return filterData;
  // }
}

String? formatTime(String? backendTime) {
  if (backendTime == null || backendTime.isEmpty) return null;

  try {
    // Parse ISO 8601 string into DateTime
    final dateTime = DateTime.parse(backendTime);

    // Format as HH:mm (24hr) or hh:mm a (12hr with AM/PM)
    return DateFormat('HH:mm').format(dateTime);
    // return DateFormat('hh:mm a').format(dateTime); // if you want AM/PM
  } catch (e) {
    // If parsing fails, just return original
    return backendTime;
  }
}
