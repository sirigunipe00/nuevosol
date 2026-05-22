import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_list.dart';
import 'package:nuevosol/features/employee_tracker/model/location_list.dart';
import 'package:nuevosol/features/employee_tracker/model/reason_exit_type.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/create_employee_cubit/create_employee_cubit.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/create_gate_entry_cubit/create_gateentry_cubit.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/buttons/app_btn.dart';
import 'package:nuevosol/widgets/drop_down_options.dart';
import 'package:nuevosol/widgets/input_filed.dart';
import 'package:nuevosol/widgets/inputs/app_dropdown_widget.dart';
import 'package:nuevosol/widgets/inputs/compact_listtile.dart';
import 'package:nuevosol/widgets/inputs/date_selection_field.dart';
import 'package:nuevosol/widgets/spaced_column.dart';

class EmployeeFormWidget extends StatefulWidget {
  const EmployeeFormWidget({super.key});

  @override
  State<EmployeeFormWidget> createState() => _EmployeeFormWidgetState();
}

class _EmployeeFormWidgetState extends State<EmployeeFormWidget> {
  final TextEditingController scrollController = TextEditingController();
  final TextEditingController hod = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController approver = TextEditingController();
  final TextEditingController reason = TextEditingController();

  final indianFormat = NumberFormat.decimalPattern('en_IN');
  final invoiceAmountController = TextEditingController();
  EmployeeList? employeeList;
  ReasonExitType? reasonForm;
  LocationList? locationList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateEmployeeCubit>().state;
    final isCreating = formState.view == EmployeeView.create;
    final isCompleted = formState.view == EmployeeView.completed;
    final form = formState.form;
    return SpacedColumn(
      margin: const EdgeInsets.all(12.0),
      defaultHeight: 8,
      children: [
//         Container(
//   padding: const EdgeInsets.all(16),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(16),
//     border: Border.all(
//       color: Colors.grey.shade300,
//     ),
//   ),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [

//       const Row(
//         children: const [
//           Icon(
//             Icons.badge_outlined,
//             color: Colors.green,
//             size: 24,
//           ),
//           SizedBox(width: 8),
//           Text(
//             'Employee Details',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ],
//       ),

//       const SizedBox(height: 24),

//       Row(
//         children: [
//           Expanded(
//             child: _buildEmployeeItem(
//               'Employee ID',
//               ''
//               // context.user.employeeId ?? '',
//             ),
//           ),
//           Expanded(
//             child: _buildEmployeeItem(
//               'Employee Name',
//               ''
//               // context.user.employeeName ?? '',
//             ),
//           ),
//         ],
//       ),

//       const SizedBox(height: 20),

//       Row(
//         children: [
//           Expanded(
//             child: _buildEmployeeItem(
//               'HOD',
//               ''
//               // context.user.hod ?? '',
//             ),
//           ),
//           Expanded(
//             child: _buildEmployeeItem(
//               'Department',
//               ''
//               // context.user.department ?? '',
//             ),
//           ),
//         ],
//       ),

//       const SizedBox(height: 20),

//       Divider(color: Colors.grey.shade300),

//       const SizedBox(height: 12),

//       _buildEmployeeItem(
//         'Company',
//         ''
//         // context.user.company ?? '',
//       ),
//     ],
//   ),
// ),
      //  BlocBuilder<EmployeeListCubit, EmployeeListState>(
      //     builder: (_, state) {
      //       return state.maybeWhen(
      //         loading: () => const Center(child: CircularProgressIndicator()),
      //         success: (items) {
      //           return AppDropDownWidget<EmployeeList>(
      //             title: 'Employee No',
      //             items: items,
      //             key: UniqueKey(),
      //             readOnly: isCompleted,
      //             hint: 'Select Employee No',
      //             headerBuilder: (_, item, __) => Text(item.name ?? ''),
      //             defaultSelection:
      //                 employeeList ??
      //                 (form.name.containsValidValue
      //                     ? EmployeeList(name: form.name!)
      //                     : null),
      //             futureRequest: (query) async {
      //               if (query.isEmpty) return items;
      //               return items.where((item) {
      //                 final orderNo = item.name?.toLowerCase() ?? '';
      //                 final employeeName = item.employeeName?.toLowerCase() ?? '';

      //                 final search = query.toLowerCase();
      //                 return orderNo.contains(search) ||
      //                     employeeName.contains(search) ;

      //               }).toList();
      //             },
      //             listItemBuilder:
      //                 (_, item, isSelected, __) => Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "Employee No: ${item.name ?? ''}",
      //                       style: const TextStyle(fontWeight: FontWeight.bold),
      //                     ),
      //                     AppSpacer.p4(),
      //                     Text(
      //                       "Employee Name: ${item.employeeName ?? ''}",
      //                     ),
                          
      //                   ],
      //                 ),
      //             onSelected: (order) {
      //               if (order.isNull) return;
      //               context.cubit<CreateEmployeeCubit>().onValueChanged(
      //                 employeeNo: order!.name ?? '',
      //                 employeeName: order.employeeName,
      //               );
      //               setState(() {

      //               });
      //             },
      //             borderColor: AppColors.registration,
      //           );
      //         },
      //         orElse: () => const SizedBox.shrink(),
      //       );
      //     },
      //   ),

      //   InputField(
      //     title: 'Employee Name',
      //     readOnly: isCompleted,
      //     hintText: 'Enter Employee Name',
      //     isRequired: true,
      //     initialValue: form.employeeName,
      //     inputFormatters: [UpperCaseTextFormatter()],
      //     borderColor: AppColors.registration,
      //     onChanged: (employee) {
      //       context.cubit<CreateEmployeeCubit>().onValueChanged(
      //         employeeName: employee,
      //       );
      //     },
      //   ),
      //  InputField(
      //     title: 'HOD',
      //     readOnly: isCompleted,
      //     hintText: 'Enter HOD Name',
      //     controller: hod,
      //     isRequired: true,
      //     initialValue: form.hod,
      //     borderColor: AppColors.registration,
      //     onChanged: (hodName) {
      //       context.cubit<CreateEmployeeCubit>().onValueChanged(
      //         hod: hodName,
      //       );
      //     },
      //   ),
      //   InputField(
      //     title: 'Department',
      //     readOnly: isCompleted,
      //     hintText: 'Enter Department Name',
      //     isRequired: true,
      //     controller: department,
      //     initialValue: form.department,
      //     borderColor: AppColors.registration,
      //     onChanged: (departmentName) {
      //       context.cubit<CreateEmployeeCubit>().onValueChanged(
      //         department: departmentName,
      //       );
      //     },
      //   ),
      //   InputField(
      //     title: 'Company',
      //     readOnly: isCompleted,
      //     hintText: 'Company',
      //     isRequired: true,
      //     // controller: employeeName,
      //     initialValue: form.company,

      //     borderColor: AppColors.registration,
      //     onChanged: (company) {
      //       context.cubit<CreateEmployeeCubit>().onValueChanged(
      //         company: company,
      //       );
      //     },
      //   ),
        BlocBuilder<ReasonExitCubit, ReasonExitState>(
          buildWhen: (previous, current) => previous != current,

          builder: (_, state) {
            final allData = state.maybeWhen(
              orElse: () => <ReasonExitType>[],
              success: (data) => data,
            );

            final names = allData.toList();

            return AppDropDownWidget<ReasonExitType>(
              title: 'Reason of Gate Exit',
              hint: 'Search Reason',
              key: UniqueKey(),
              items: names,
              readOnly: isCompleted ,
              defaultSelection: state.maybeWhen(
                success: (data) {
                  final selectedReason =
                      context
                          .read<CreateEmployeeCubit>()
                          .state
                          .form
                          .reasonOfGateExit;

                  if (selectedReason == null) return null;

                  return data.firstWhere(
                    (e) => e.name == selectedReason,
                    orElse: () => const ReasonExitType(),
                  );
                },
                orElse: () => null,
              ),

              // defaultSelection:
              //     (context
              //                     .read<CreateGateEntryCubit>()
              //                     .state
              //                     .form
              //                     .customSupplier !=
              //                 null &&
              //             context
              //                 .read<CreateGateEntryCubit>()
              //                 .state
              //                 .form
              //                 .customSupplier!
              //                 .isNotEmpty)
              //         ? names.firstWhere(
              //           (g) =>
              //               g.name ==
              //               context
              //                   .read<CreateGateEntryCubit>()
              //                   .state
              //                   .form
              //                   .customSupplier,
              //           orElse: () => const SupplierForm(),
              //         )
              //         : null,
              futureRequest: (query) async {
                if (query.isEmpty) return names;

                return names.where((item) {
                  final orderNo = item.name?.toLowerCase() ?? '';
                  final reason = item.reason?.toLowerCase() ?? '';
                  final search = query.toLowerCase();

                  return orderNo.contains(search) ||
                      reason.contains(search);
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
                        item.name ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),


                      const Divider(height: 8),
                    ],
                  ),

              onSelected: (selected) {
                setState(() {
                  reasonForm = selected;

                  context.cubit<CreateEmployeeCubit>().onValueChanged(
                    reasonOfGateExit: selected!.name,
                  );
                });
              },
              borderColor: AppColors.registration,
            );
          },
        ),
        AppDropDownWidget<String>(
          title: 'Movement Type',
          hint: 'Select Movement Type',
          readOnly: isCompleted,
          // color: AppColors.black,
          items: Dropdownoptions.movementType,
          defaultSelection: form.movementType,
          headerBuilder: (_, item, __) => Text(item),
          listItemBuilder: (_, item, __, ___) => CompactListTile(title: item),
          futureRequest: (searchText) async {
            const all = Dropdownoptions.movementType;
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
            context.cubit<CreateEmployeeCubit>().onValueChanged(
              movementType: selected,
            );
          },
          borderColor: AppColors.registration,
        ),
       
        BlocBuilder<LocationCubit, LocationState>(
          buildWhen: (previous, current) => previous != current,

          builder: (_, state) {
            final allData = state.maybeWhen(
              orElse: () => <LocationList>[],
              success: (data) => data,
            );

            final names = allData.toList();

            return AppDropDownWidget<LocationList>(
              title: 'From Location',
              hint: 'Search Location',
              key: UniqueKey(),
              items: names,
              readOnly: isCompleted ,
              defaultSelection: state.maybeWhen(
                success: (data) {
                  final selectedReason =
                      context
                          .read<CreateEmployeeCubit>()
                          .state
                          .form
                          .fromLocation;

                  if (selectedReason == null) return null;

                  return data.firstWhere(
                    (e) => e.name == selectedReason,
                    orElse: () => const LocationList(),
                  );
                },
                orElse: () => null,
              ),

              // defaultSelection:
              //     (context
              //                     .read<CreateGateEntryCubit>()
              //                     .state
              //                     .form
              //                     .customSupplier !=
              //                 null &&
              //             context
              //                 .read<CreateGateEntryCubit>()
              //                 .state
              //                 .form
              //                 .customSupplier!
              //                 .isNotEmpty)
              //         ? names.firstWhere(
              //           (g) =>
              //               g.name ==
              //               context
              //                   .read<CreateGateEntryCubit>()
              //                   .state
              //                   .form
              //                   .customSupplier,
              //           orElse: () => const SupplierForm(),
              //         )
              //         : null,
              futureRequest: (query) async {
                if (query.isEmpty) return names;

                return names.where((item) {
                  final orderNo = item.name?.toLowerCase() ?? '';
                  final reason = item.location?.toLowerCase() ?? '';
                  final search = query.toLowerCase();

                  return orderNo.contains(search) ||
                      reason.contains(search);
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
                        'From Location : ${item.name ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),


                      const Divider(height: 8),
                    ],
                  ),

              onSelected: (selected) {
                setState(() {
                  locationList = selected;

                  context.cubit<CreateEmployeeCubit>().onValueChanged(
                    fromLocation: selected!.name,
                  );
                });
              },
              borderColor: AppColors.registration,
            );
          },
        ),
        BlocBuilder<LocationCubit, LocationState>(
          buildWhen: (previous, current) => previous != current,

          builder: (_, state) {
            final allData = state.maybeWhen(
              orElse: () => <LocationList>[],
              success: (data) => data,
            );

            final names = allData.toList();

            return AppDropDownWidget<LocationList>(
              title: 'From Location',
              hint: 'Search Location',
              key: UniqueKey(),
              items: names,
              readOnly: isCompleted ,
              defaultSelection: state.maybeWhen(
                success: (data) {
                  final selectedReason =
                      context
                          .read<CreateEmployeeCubit>()
                          .state
                          .form
                          .toLocation;

                  if (selectedReason == null) return null;

                  return data.firstWhere(
                    (e) => e.name == selectedReason,
                    orElse: () => const LocationList(),
                  );
                },
                orElse: () => null,
              ),

              // defaultSelection:
              //     (context
              //                     .read<CreateGateEntryCubit>()
              //                     .state
              //                     .form
              //                     .customSupplier !=
              //                 null &&
              //             context
              //                 .read<CreateGateEntryCubit>()
              //                 .state
              //                 .form
              //                 .customSupplier!
              //                 .isNotEmpty)
              //         ? names.firstWhere(
              //           (g) =>
              //               g.name ==
              //               context
              //                   .read<CreateGateEntryCubit>()
              //                   .state
              //                   .form
              //                   .customSupplier,
              //           orElse: () => const SupplierForm(),
              //         )
              //         : null,
              futureRequest: (query) async {
                if (query.isEmpty) return names;

                return names.where((item) {
                  final orderNo = item.name?.toLowerCase() ?? '';
                  final reason = item.location?.toLowerCase() ?? '';
                  final search = query.toLowerCase();

                  return orderNo.contains(search) ||
                      reason.contains(search);
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
                        'To Location : ${item.name ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),


                      const Divider(height: 8),
                    ],
                  ),

              onSelected: (selected) {
                setState(() {
                  locationList = selected;

                  context.cubit<CreateEmployeeCubit>().onValueChanged(
                    toLocation: selected!.name,
                  );
                });
              },
              borderColor: AppColors.registration,
            );
          },
        ),
        DateSelectionField(
          title: 'Expected Exit Date',
          hintText: 'Select Date',
          isRequired: true,
          initialValue: DFU.ddMMyyyyFromStr(form.expectedExitDateTime ?? ''),
          readOnly: isCompleted,
          // startDate: DFU.now().subtract(const Duration(days: 60)),
          // endDate: DFU.now(),
          onDateSelect: (date) {
            setState(() {
              if (formState.form.docstatus == 0) {
                context.cubit<CreateEmployeeCubit>().onValueChanged(
                  expectedExitDateTime: DateFormat('yyyy-MM-dd').format(date),
                );
              } else {
                context.cubit<CreateEmployeeCubit>().onValueChanged(
                  expectedExitDateTime: DateFormat('dd-MM-yyyy').format(date),
                );
              }
            });
          },
          borderColor: AppColors.registration,
          suffixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: AppColors.chimneySweep,
          ),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        ),

        InputField(
          title: 'Expected Duration (Min)',
          hintText: 'Enter Duration',
          readOnly: isCompleted,
          initialValue:
              form.expectedDurationMin != null
                  ? form.expectedDurationMin.toString()
                  : '',
          borderColor: AppColors.registration,
          onChanged: (qty) {
            final intValue = int.tryParse(qty);
            context.cubit<CreateEmployeeCubit>().onValueChanged(
              expectedDurationMin: intValue,
            );
          },
        ),
          DateSelectionField(
          title: 'Send for Approval Date Time',
          hintText: 'Select Date',
          isRequired: true,
          initialValue: DFU.ddMMyyyyFromStr(form.sendForApprovalDateTime ?? ''),
          readOnly: isCompleted,
          // startDate: DFU.now().subtract(const Duration(days: 60)),
          // endDate: DFU.now(),
          onDateSelect: (date) {
            setState(() {
              if (formState.form.docstatus == 0) {
                context.cubit<CreateEmployeeCubit>().onValueChanged(
                  sendForApprovalDateTime: DateFormat('yyyy-MM-dd').format(date),
                );
              } else {
                context.cubit<CreateEmployeeCubit>().onValueChanged(
                  sendForApprovalDateTime: DateFormat('dd-MM-yyyy').format(date),
                );
              }
            });
          },
          borderColor: AppColors.registration,
          suffixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: AppColors.chimneySweep,
          ),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        ),
        DateSelectionField(
          title: 'Approval Date Time',
          hintText: 'Select Date',
          isRequired: true,
          initialValue: DFU.ddMMyyyyFromStr(form.approvedDateTime ?? ''),
          readOnly: isCompleted,
          // startDate: DFU.now().subtract(const Duration(days: 60)),
          // endDate: DFU.now(),
          onDateSelect: (date) {
            setState(() {
              if (formState.form.docstatus == 0) {
                context.cubit<CreateEmployeeCubit>().onValueChanged(
                  approvedDateTime: DateFormat('yyyy-MM-dd').format(date),
                );
              } else {
                context.cubit<CreateEmployeeCubit>().onValueChanged(
                  approvedDateTime: DateFormat('dd-MM-yyyy').format(date),
                );
              }
            });
          },
          borderColor: AppColors.registration,
          suffixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: AppColors.chimneySweep,
          ),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        ),

        InputField(
          title: 'Approved By',
          hintText: 'Enter Approver',
          readOnly: isCompleted,
          controller: approver,
          initialValue:
              form.approvedBy != null
                  ? form.approvedBy.toString()
                  : '',
          borderColor: AppColors.registration,
          onChanged: (qty) {
            context.cubit<CreateEmployeeCubit>().onValueChanged(
              approvedBy: qty,
            );
          },
        ),
        InputField(
          title: 'Reject Reason',
          hintText: 'Enter Reason',
          controller: reason,
          readOnly: isCompleted,
          initialValue:
              form.rejectReason,
          borderColor: AppColors.registration,
          onChanged: (qty) {
            context.cubit<CreateEmployeeCubit>().onValueChanged(
              rejectReason: qty,
            );
          },
        ),
       
        if (isCreating) ...[
          BlocBuilder<CreateEmployeeCubit, CreateEmployeeState>(
            builder:
                (_, state) => AppButton(
                  label: isCreating ? 'Save' : 'Submit',
                  isLoading: state.isLoading,
                  bgColor: AppColors.haintBlue,
                  margin: const EdgeInsets.all(12.0),
                  onPressed: context.cubit<CreateEmployeeCubit>().save,
                ),
          ),
        ],
      ],
    );
  }
  Widget _buildEmployeeItem(String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey.shade600,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        value,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
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
