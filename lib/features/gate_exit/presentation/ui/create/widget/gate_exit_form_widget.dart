import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/gate_exit/model/sales_invoice_form.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/create_gate_exit/create_gate_exit_cubit.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/buttons/app_btn.dart';
import 'package:nuevosol/widgets/input_filed.dart';
import 'package:nuevosol/widgets/inputs/app_dropdown_widget.dart';
import 'package:nuevosol/widgets/inputs/date_selection_field.dart';
import 'package:nuevosol/widgets/inputs/image_selection_widget1.dart';
import 'package:nuevosol/widgets/inputs/time_picker.dart';
import 'package:nuevosol/widgets/spaced_column.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class GateExitFormWidget extends StatefulWidget {
  const GateExitFormWidget({super.key});

  @override
  State<GateExitFormWidget> createState() => _GateExitFormWidgetState();
}

class _GateExitFormWidgetState extends State<GateExitFormWidget> {
  final TextEditingController scrollController = TextEditingController();
  final TextEditingController remarks = TextEditingController();
  final TextEditingController invoiceAmountController = TextEditingController();
  final TextEditingController vehicleNo = TextEditingController();
  final indianFormat = NumberFormat.decimalPattern('en_IN');
  SalesInvoiceForm? invoiceForm;

  // @override
  // void initState() {
  //   super.initState();
  //   final form = context.read<CreateGateExitCubit>().state.form;

  //   if (form.amount != null) {
  //     invoiceAmountController.text = indianFormat.format(form.amount);
  //   }

  //   invoiceAmountController.addListener(() {
  //     final text = invoiceAmountController.text.replaceAll(',', '');
  //     final value = int.tryParse(text);

  //     if (value != null) {
  //       context.cubit<CreateGateExitCubit>().onValueChanged(amount: value);

  //       // format back with commas
  //       final newText = indianFormat.format(value);
  //       if (invoiceAmountController.text != newText) {
  //         final selectionIndex =
  //             invoiceAmountController.selection.baseOffset +
  //             (newText.length - invoiceAmountController.text.length);

  //         invoiceAmountController.value = TextEditingValue(
  //           text: newText,
  //           selection: TextSelection.collapsed(
  //             offset: selectionIndex.clamp(0, newText.length),
  //           ),
  //         );
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateGateExitCubit>().state;
    final isCreating = formState.view == GateExitView.create;

    final isCompleted = formState.view == GateExitView.completed;
    final form = formState.form;
    final status = form.docStatus;
    final TextEditingController remarks = TextEditingController();
    // final indianFormat = NumberFormat.decimalPattern('en_IN');

    return SpacedColumn(
      defaultHeight: 10,
      margin: const EdgeInsets.all(12.0),
      children: [
        BlocBuilder<SalesInvoiceList, SalesInvoiceState>(
          buildWhen: (previous, current) => previous != current,
          builder: (_, state) {
            
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (items) {
                return AppDropDownWidget<SalesInvoiceForm>(
                  title: 'Sales Invoice Number',
                  items: items,
                  
                  // color: Colors.black,

            borderColor: AppColors.lavender,
                  readOnly: isCompleted,
                  hint: 'Select Invoice Number',
                  isMandatory: true,
                  headerBuilder: (_, item, __) => Text(item.name ?? ''),
                  defaultSelection:
                      invoiceForm ??
                      (form.salesInvoice.containsValidValue
                          ? SalesInvoiceForm(
                            name: form.salesInvoice!,
                            postingDate: '',
                            customer: form.customerName,
                            grandTotal: 0,
                            dueDate: '',
                          )
                          : null),
                  futureRequest: (query) async {
                    if (query.isEmpty) return items;

                    return items.where((item) {
                      final orderNo = item.name?.toLowerCase() ?? '';
                      final customer = item.customer?.toLowerCase() ?? '';
                      final workflow = item.postingDate?.toLowerCase() ?? '';
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
                            "Sales Invoice No: ${item.name ?? ''}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          AppSpacer.p4(),
                          Text(
                            "Posting Date: ${DFU.ddMMyyyyFromStr(item.postingDate ?? ' ')}",
                          ),
                          Text("Customer Name: ${item.customer ?? ''}"),
                          Text(
                            "Due Date: ${DFU.ddMMyyyyFromStr(item.dueDate ?? '')}",
                          ),
                        ],
                      ),
                  onSelected: (order) {
                    if (order.isNull) return;
                    setState(() {
                      invoiceForm = order;
                      context.cubit<CreateGateExitCubit>().onValueChanged(
                        salesInvoice: order!.name ?? '',
                        customerName: order.customer ?? '',
                      );
                    });
                  },
                  onScannerTap: () async {
                    if (status == 1) return;
                    final scanResult = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => const SimpleBarcodeScannerPage(
                              scanType: ScanType.qr,
                              appBarTitle: 'Scan IRN QR',
                              isShowFlashIcon: true,
                            ),
                      ),
                    );

                    if (scanResult != null) {
  final scannedValue =
      extractIrnFromQr(scanResult).trim().toUpperCase();
  final allPOs =
      context
          .read<SalesInvoiceList>()
          .state
          .maybeWhen(
            orElse: () => <SalesInvoiceForm>[],
            success: (data) => data,
          )
          .toList();

  try {
    SalesInvoiceForm matchedInvoice = allPOs.firstWhere(
      (po) =>
          (po.name ?? '').trim().toUpperCase() ==
          scannedValue,
    );

    // Update the dropdown's selected value
    setState(() {
      invoiceForm = matchedInvoice; // <-- this updates the selected item
    });

    // Update the cubit with customerName & invoice number
    context.cubit<CreateGateExitCubit>().onValueChanged(
      salesInvoice: matchedInvoice.name,
      customerName: matchedInvoice.customer,
    );
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Error',
          style: TextStyle(
            color: Colors.red,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Scanned Invoice Order Number is Not Matched With Existing Invoice Order.',
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
}

                  },
                  showScanner: true,
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
          
        ),

        InputField(
          title: 'Customer Name',
          readOnly: true,
          hintText: 'Enter Customer Name',
          initialValue: form.customerName,
          borderColor: AppColors.lavender,
          onChanged: (vehicleNum) {
            context.cubit<CreateGateExitCubit>().onValueChanged(
              customerName: vehicleNum,
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
          borderColor: AppColors.lavender,
          onChanged: (vehicleNum) {
            context.cubit<CreateGateExitCubit>().onValueChanged(
              vehicleNo: vehicleNum,
            );
          },
        ),
        // BlocConsumer<GetVehicleNumber, GetVehicleNumberState>(
        //   listener: (_, state) {
        //     state.maybeWhen(
        //       orElse: () {},
        //       success: (data) {
        //         context.cubit<CreateGateExitCubit>().onFieldChange(
        //           vehicleNo: data,
        //         );
        //         setState(() {});
        //       },
        //     );
        //   },
        //   builder: (_, state) {
        //     return InputField(
        //       title: 'Vechicle Number',
        //       readOnly: isCompleted,
        //       isRequired: true,
        //       suffixIcon:
        //           state.isLoading
        //               ? const CupertinoActivityIndicator()
        //               : const SizedBox.shrink(),
        //       inputFormatters: [UpperCaseTextFormatter()],
        //       initialValue: form.vehicleNo,
        //       borderColor: AppColors.lavender,
        //       onChanged: (text) {
        //         context.cubit<CreateGateExitCubit>().onFieldChange(
        //           vehicleNo: text,
        //         );
        //       },
        //     );
        //   },
        // ),
        Row(
          children: [
            Expanded(
              child: BlocBuilder<CreateGateExitCubit, CreateGateExitState>(
                buildWhen:
                    (pv, curr) =>
                        (pv.form.vehiclePhoto != curr.form.vehiclePhoto),
                builder:
                    (_, state) => ImageSelectionWidget1(
                      title: 'Vehicle Photo',
                      isRequired: true,
                      borderColor: AppColors.lavender,
                      readOnly: isCompleted,
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
                        AppRoute.newGateExitPreview.push(context, extra: data);
                      },
                      onImage: (file) {
                        if (file.isNull) {
                          context
                              .cubit<CreateGateExitCubit>()
                              .clearVehiclePhoto();
                        } else {
                          context.cubit<CreateGateExitCubit>().onValueChanged(
                            vehiclePhoto: file,
                          );
                        }
                      },
                    ),
              ),
            ),
            // const SizedBox(width: 10),
            // Expanded(
            //   child: BlocBuilder<CreateGateExitCubit, CreateGateExitState>(
            //     buildWhen:
            //         (pv, curr) =>
            //             (pv.form.vehicleBackPhoto !=
            //                 curr.form.vehicleBackPhoto),
            //     builder:
            //         (_, state) => ImageSelectionWidget1(
            //           title: 'Vechicle Back Photo',
            //           borderColor: AppColors.lavender,
            //           readOnly: isCompleted,
            //           defaultVal: state.form.vehicleBackPhoto,
            //           placeholder: const Icon(
            //             Icons.local_shipping,
            //             size: 64,
            //             color: AppColors.chimneySweep,
            //           ),
            //           onView: () {
            //             final data = Pair(
            //               form.name ?? 'Vehicle Photo',
            //               state.form.vehicleBackPhoto,
            //             );
            //             AppRoute.newGateExitPreview.push(context, extra: data);
            //           },
            //           onImage: (file) {
            //             if (file.isNull) {
            //               context
            //                   .cubit<CreateGateExitCubit>()
            //                   .clearVehicleBackPhoto();
            //             } else {
            //               context.cubit<CreateGateExitCubit>().onValueChanged(
            //                 vehicleBackPhoto: file,
            //               );
            //             }
            //           },
            //         ),
            //   ),
            // ),
          ],
        ),
        DateSelectionField(
          title: 'Gate Exit Date',
          filled: true,
          initialValue: form.gateExitDate,
          firstDate: DFU.now(),
          lastDate: DFU.now(),
          onDateSelect: (date) {},
          readOnly: true,
          isRequired: true,
          borderColor: AppColors.lavender,
          suffixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: AppColors.black,
          ),
        ),
      TimeSelectionField(
          title: 'Gate Exit Time',
          initialValue: formatTime(form.gateExitTime), 
          readOnly: true,
          onTimeSelect: (_) {}, 
          borderColor: AppColors.lavender,
          suffixIcon: const Icon(
            Icons.access_time_filled,
            color: AppColors.black,
          ),
          isRequired: false,
        ),
        // InputField(
        //   title: 'Invoice Quantity',
        //   readOnly: isCompleted,
        //   initialValue: form.quantity.toString(),
        //   borderColor: AppColors.marigoldDDust,
        //   inputType: const TextInputType.numberWithOptions(decimal: true),
        //   onChanged: (qty) {
        //     final intValue = int.tryParse(qty);
        //     context.cubit<CreateGateExitCubit>().onValueChanged(
        //       quantity: intValue,
        //     );
        //   },
        // ),
        // InputField(
        //   title: 'Invoice Amount',
        //   readOnly: isCompleted,
        //   initialValue:
        //       form.amount != null ? indianFormat.format(form.amount) : '',
        //   borderColor: AppColors.marigoldDDust,
        //   inputType: const TextInputType.numberWithOptions(decimal: true),
        //   onChanged: (amount) {
        //     final cleaned = amount.replaceAll(',', '');
        //     final intValue = int.tryParse(cleaned);
        //     context.cubit<CreateGateExitCubit>().onValueChanged(
        //       amount: intValue,
        //     );
        //   },
        // ),
        InputField(
          title: 'Remarks',
          readOnly: isCompleted,
          controller: remarks,
          initialValue: form.remarks,
          borderColor: AppColors.lavender,
          minLines: 3,
          onChanged: (text) {
            context.cubit<CreateGateExitCubit>().onValueChanged(remarks: text);
          },
        ),
        if (isCreating) ...[
          BlocBuilder<CreateGateExitCubit, CreateGateExitState>(
            buildWhen: (pv, curr) => pv.isLoading != curr.isLoading,
            builder:
                (_, state) => AppButton(
                  label: isCreating ? 'Save' : 'Submit',
                  isLoading: state.isLoading,
                  bgColor: AppColors.haintBlue,
                  margin: const EdgeInsets.all(12.0),
                  onPressed: context.cubit<CreateGateExitCubit>().save,
                ),
          ),
        ],
      ],
    );
  }

  //   void onScan(BuildContext context) async {
  //     final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.BARCODE);
  //     final isValidValue =
  //         barcodeScanRes.containsValidValue && barcodeScanRes != '-1';
  //     if (!context.mounted) return;
  //     if (isValidValue) {
  //       context
  //           .cubit<CreateGateExitCubit>()
  //           .onFieldChange(salesInvNo: barcodeScanRes);
  //       unawaited(context.cubit<GetVehicleNumber>().request(barcodeScanRes));
  //     }
  //   }
}

String extractIrnFromQr(String qrData) {
  try {
    final decoded = jsonDecode(qrData);
    if (decoded is Map<String, dynamic> && decoded.containsKey('irn')) {
      return decoded['irn'].toString();
    }
  } catch (_) {
    final match = RegExp(r'IRN[:\s]?(\w+)').firstMatch(qrData);
    if (match != null) {
      return match.group(1) ?? '';
    }
  }
  return qrData;
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
