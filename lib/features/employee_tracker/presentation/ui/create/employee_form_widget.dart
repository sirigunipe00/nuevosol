import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_list.dart';
import 'package:nuevosol/features/employee_tracker/model/location_list.dart';
import 'package:nuevosol/features/employee_tracker/model/reason_exit_type.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/create_employee_cubit/create_employee_cubit.dart';
import 'package:nuevosol/features/employee_tracker/presentation/ui/approve_reject_btn.dart';
import 'package:nuevosol/features/employee_tracker/presentation/widget/employee_qr_pass_widget.dart';
import 'package:nuevosol/features/employee_tracker/presentation/widget/image_preview.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/buttons/app_btn.dart';
import 'package:nuevosol/widgets/input_filed.dart';
import 'package:nuevosol/widgets/inputs/app_dropdown_widget.dart';
import 'package:nuevosol/widgets/inputs/compact_listtile.dart';
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
    final formState = context.watch<CreateEmployeeCubit>().state;
    final isCreating = formState.view == EmployeeView.create;
    final isCompleted = formState.view == EmployeeView.completed;

    final form = formState.form;
    final isRejected = form.workflowState?.toLowerCase().trim() == 'rejected';

    final isReadOnly = isCompleted || isRejected;
    final userRoles = context.user.role ?? [];
    final String base = Urls.baseUrl.replaceAll('/api', '');

    final isHod = userRoles.any(
      (r) => r.toString().toLowerCase().contains('hod (hr)'),
    );
    final issecurity = userRoles.any((r) {
      final role = r.toString().toLowerCase();
      return role.contains('nepl-unit-1-gate') ||
          role.contains('nepl-unit-2-gate') ||
          role.contains('nmpl-unit-1-gate') ||
          role.contains('nmpl-unit-2-gate') ||
          role.contains('head office gate');
    });
    final isPendingApproval =
        form.workflowState?.toLowerCase().trim() == 'pending for approval';
    final isOwner =
        form.owner?.toLowerCase() == context.user.email?.toLowerCase();

    final canApprove = isHod && isPendingApproval && !isOwner;
    // final canApprove = isHod && isPendingApproval;
    final isApproved = form.workflowState?.toLowerCase().trim() == 'approved';

    final showSafetyInstruction = isApproved && !isHod && !issecurity;
    return SpacedColumn(
      margin: const EdgeInsets.all(12.0),
      defaultHeight: 8,
      children: [
        if (showSafetyInstruction) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.orange),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Please follow Safety rules & regulations.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),
        ],
        // if (isApproved || isRejected) ...[
        BlocBuilder<AttachementCubit, AttachementState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (files) {
                if (files.isEmpty) {
                  return const SizedBox.shrink();
                }

                final imageUrl = '$base${files.first.fileUrl}';

                Widget imageWidget;

                if (imageUrl.toLowerCase().endsWith('.svg')) {
                  imageWidget = SvgPicture.network(
                    imageUrl,
                    width: 70,
                    height: 70,
                    placeholderBuilder:
                        (_) => const CircularProgressIndicator(),
                  );
                } else {
                  imageWidget = Image.network(
                    imageUrl,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.person),
                  );
                }

                return Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Employee Photo',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => EmployeeImagePreviewScreen(
                                    imageUrl: imageUrl,
                                  ),
                            ),
                          );
                        },

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: imageWidget,
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => EmployeeImagePreviewScreen(
                                    imageUrl: imageUrl,
                                  ),
                            ),
                          );
                        },
                        child: const Text('View'),
                      ),
                    ],
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),

        // ],
        if (isRejected &&
            form.rejectReason != null &&
            form.rejectReason!.trim().isNotEmpty) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.red.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.cancel_outlined, color: Colors.red),
                    SizedBox(width: 8),
                    Text(
                      'Rejected Reason',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  form.rejectReason ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
        ],
        Container(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.registration.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.directions_walk,
                    color: AppColors.registration,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Employee Details',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              BlocBuilder<EmployeeListCubit, EmployeeListState>(
                builder: (_, state) {
                  return state.maybeWhen(
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    success: (items) {
                      return AppDropDownWidget<EmployeeList>(
                        title: 'Employee No',
                        items: items,
                        isMandatory: true,
                        // key: UniqueKey(),
                        key: ValueKey(form.employeeNo),
                        readOnly: isReadOnly,
                        hint: 'Select Employee No',
                        headerBuilder:
                            (_, item, __) => Text(item.employeeName ?? ''),
                        defaultSelection: state.maybeWhen(
                          success: (data) {
                            final selectedReason =
                                context
                                    .read<CreateEmployeeCubit>()
                                    .state
                                    .form
                                    .employeeName;

                            if (selectedReason == null) return null;

                            return data.firstWhere(
                              (e) =>
                                  e.name == selectedReason ||
                                  e.employeeName == selectedReason,
                              orElse: () => const EmployeeList(),
                            );
                          },
                          orElse: () => null,
                        ),
                        futureRequest: (query) async {
                          if (query.isEmpty) return items;
                          return items.where((item) {
                            final orderNo = item.name?.toLowerCase() ?? '';
                            final employeeName =
                                item.employeeName?.toLowerCase() ?? '';

                            final search = query.toLowerCase();
                            return orderNo.contains(search) ||
                                employeeName.contains(search);
                          }).toList();
                        },
                        listItemBuilder:
                            (_, item, isSelected, __) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Employee No: ${item.name ?? ''}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                AppSpacer.p4(),
                                Text(
                                  "Employee Name: ${item.employeeName ?? ''}",
                                ),
                              ],
                            ),

                        onSelected: (order) {
                          if (order.isNull) return;
                          context.cubit<CreateEmployeeCubit>().onValueChanged(
                            employeeNo: order!.name ?? '',
                            employeeName: order.employeeName,
                            department: order.department,
                            company: order.company,
                            hod: order.reportsToName,
                          );
                          setState(() {});
                        },
                        borderColor: AppColors.registration,
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
              InputField(
                title: 'HOD',
                readOnly: true,
                hintText: 'Enter HOD Name',
                controller: hod,
                isRequired: true,
                initialValue: form.hod,
                borderColor: AppColors.registration,
                onChanged: (hodName) {
                  context.cubit<CreateEmployeeCubit>().onValueChanged(
                    hod: hodName,
                  );
                },
              ),
              InputField(
                title: 'Department',
                readOnly: true,
                hintText: 'Enter Department Name',
                isRequired: true,
                controller: department,
                initialValue: form.department,
                borderColor: AppColors.registration,
                onChanged: (departmentName) {
                  context.cubit<CreateEmployeeCubit>().onValueChanged(
                    department: departmentName,
                  );
                },
              ),
              InputField(
                title: 'Company',
                readOnly: true,
                hintText: 'Company',
                isRequired: true,
                // controller: employeeName,
                initialValue: form.company,

                borderColor: AppColors.registration,
                onChanged: (company) {
                  context.cubit<CreateEmployeeCubit>().onValueChanged(
                    company: company,
                  );
                },
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.cyan.shade50,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.registration.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.directions_walk,
                    color: AppColors.registration,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Movement Details',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

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
                    hint: 'Select Movement',
                    key: UniqueKey(),
                    items: names,
                    isMandatory: true,
                    readOnly: isReadOnly,
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
                        (_, item, __) => Text(
                          item.name ?? '',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                    listItemBuilder:
                        (_, item, __, ___) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            item.name ?? '',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                    onSelected: (selected) {
                      context.cubit<CreateEmployeeCubit>().onValueChanged(
                        reasonOfGateExit: selected?.name,
                        movementType: null,
                      );
                    },
                    borderColor: AppColors.registration,
                  );
                },
              ),

              const SizedBox(height: 5),

              BlocBuilder<CreateEmployeeCubit, CreateEmployeeState>(
                builder: (_, empState) {
                  final selectedReason = empState.form.reasonOfGateExit ?? '';

                  List<String> movementTypes;
                  if (selectedReason.toLowerCase() == 'inter plant movement') {
                    movementTypes = ['Exit - In', 'Exit - In & Exit - In'];
                  } else if (selectedReason.toLowerCase() == 'personal work') {
                    movementTypes = ['Exit', 'Exit - In'];
                  } else {
                    movementTypes = [
                      'Exit - In',
                      'Exit - In & Exit - In',
                      'Exit',
                      'Exit - In',
                    ];
                  }

                  return AppDropDownWidget<String>(
                    key: ValueKey(selectedReason),
                    title: 'Movement Type',
                    hint: 'Select Movement Type',
                    readOnly: isReadOnly,
                    borderColor: AppColors.registration,
                    items: movementTypes,
                    isMandatory: true,
                    defaultSelection:
                        movementTypes.contains(empState.form.movementType)
                            ? empState.form.movementType
                            : null,
                    headerBuilder: (_, item, __) => Text(item),
                    listItemBuilder:
                        (_, item, __, ___) => CompactListTile(title: item),
                    futureRequest: (searchText) async {
                      if (searchText.trim().isEmpty) return movementTypes;
                      return movementTypes
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
                        expectedReturnDateTime: null,
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 5),

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
                    hint: 'Select Location',
                    key: UniqueKey(),
                    items: names,
                    isMandatory: true,
                    readOnly: isReadOnly,
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
                    headerBuilder: (_, item, __) => Text(item.name ?? ''),
                    listItemBuilder:
                        (_, item, __, ___) => Text(item.name ?? ''),
                    onSelected: (selected) {
                      context.read<CreateEmployeeCubit>().onValueChanged(
                        fromLocation: selected?.name,
                      );
                    },
                    borderColor: AppColors.registration,
                  );
                },
              ),

              const SizedBox(width: 14),

              BlocBuilder<LocationCubit, LocationState>(
                buildWhen: (previous, current) => previous != current,
                builder: (_, state) {
                  final allData = state.maybeWhen(
                    orElse: () => <LocationList>[],
                    success: (data) => data,
                  );

                  final names = allData.toList();

                  return AppDropDownWidget<LocationList>(
                    title: 'To Location',
                    hint: 'Select Location',
                    key: UniqueKey(),
                    items: names,
                    isMandatory: true,
                    readOnly: isReadOnly,
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
                    headerBuilder: (_, item, __) => Text(item.name ?? ''),
                    listItemBuilder:
                        (_, item, __, ___) => Text(item.name ?? ''),
                    onSelected: (selected) {
                      context.read<CreateEmployeeCubit>().onValueChanged(
                        toLocation: selected?.name,
                      );
                    },
                    borderColor: AppColors.registration,
                  );
                },
              ),
            ],
          ),
        ),
        BlocBuilder<CreateEmployeeCubit, CreateEmployeeState>(
          buildWhen:
              (prev, curr) =>
                  prev.form.fromLocation != curr.form.fromLocation ||
                  prev.form.toLocation != curr.form.toLocation ||
                  prev.form.movementType != curr.form.movementType ||
                  prev.form.expectedExitDateTime !=
                      curr.form.expectedExitDateTime ||
                  prev.form.expectedReturnDateTime !=
                      curr.form.expectedReturnDateTime,
          builder: (_, empState) {
            final form = empState.form;
            final movementType = form.movementType ?? '';
            final fromLocation = form.fromLocation ?? '';
            final toLocation = form.toLocation ?? '';
            final exitDateTime = form.expectedExitDateTime ?? '';
            final returnDateTime = form.expectedReturnDateTime ?? '';

            final showReturnField = movementType == 'Exit - In & Exit - In';

            // final showSummary = fromLocation.isNotEmpty || toLocation.isNotEmpty;
            // final showSummary = movementType.isNotEmpty;

            // if (!showSummary) return const SizedBox.shrink();

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'ORIGIN',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              fromLocation.isNotEmpty ? fromLocation : '—',
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.registration,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                          size: 20,
                        ),
                        Column(
                          children: [
                            const Text(
                              'DESTINATION',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              toLocation.isNotEmpty ? toLocation : '—',
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.registration,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 1),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                      bottom: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: AppColors.registration,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Exit Timing',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (fromLocation.isNotEmpty)
                          Text(
                            '$fromLocation (Exit)',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        const SizedBox(height: 6),
                        RichText(
                          text: const TextSpan(
                            text: 'Expected Exit Date & Time ',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                            children: [
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),

                        GestureDetector(
                          onTap:
                              isReadOnly
                                  ? null
                                  : () async {
                                    final date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (date == null || !context.mounted) {
                                      return;
                                    }

                                    final time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (time == null) return;

                                    final combined = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                    );

                                    context
                                        .cubit<CreateEmployeeCubit>()
                                        .onValueChanged(
                                          expectedExitDateTime: DateFormat(
                                            'yyyy-MM-dd HH:mm:ss',
                                          ).format(combined),
                                        );
                                  },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    exitDateTime.isNotEmpty
                                        ? AppColors.registration
                                        : Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  isReadOnly
                                      ? Colors.grey.shade50
                                      : Colors.white,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    exitDateTime.isNotEmpty
                                        ? DFU.ddMMyyyyHHmmssFromStr(
                                          exitDateTime,
                                        )
                                        : 'Select Date & Time',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          exitDateTime.isNotEmpty
                                              ? Colors.black
                                              : Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey.shade400,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (showReturnField) ...[
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 16,
                        right: 16,
                        bottom: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: AppColors.registration,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Entry Timing',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          if (toLocation.isNotEmpty)
                            Text(
                              '$toLocation (Entry)',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          const SizedBox(height: 6),
                          const Text(
                            'Expected Entry Date & Time',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                          const SizedBox(height: 6),

                          GestureDetector(
                            onTap:
                                isReadOnly
                                    ? null
                                    : () async {
                                      final date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                      );
                                      if (date == null || !context.mounted) {
                                        return;
                                      }

                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );
                                      if (time == null) return;

                                      final combined = DateTime(
                                        date.year,
                                        date.month,
                                        date.day,
                                        time.hour,
                                        time.minute,
                                      );

                                      context
                                          .cubit<CreateEmployeeCubit>()
                                          .onValueChanged(
                                            expectedReturnDateTime: DateFormat(
                                              'yyyy-MM-dd HH:mm:ss',
                                            ).format(combined),
                                          );
                                    },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      returnDateTime.isNotEmpty
                                          ? AppColors.registration
                                          : Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    isReadOnly
                                        ? Colors.grey.shade50
                                        : Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      returnDateTime.isNotEmpty
                                          ? DFU.ddMMyyyyHHmmssFromStr(
                                            returnDateTime,
                                          )
                                          : 'Select Date & Time',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            returnDateTime.isNotEmpty
                                                ? Colors.black
                                                : Colors.grey.shade400,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.grey.shade400,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),

        BlocProvider(
          create: (_) => context.read<EventTrackingCubit>(),
          child: const EmployeeGatePassQRSection(),
        ),

        if (form.workflowState?.toLowerCase() == 'closed') ...[
          /// ONE WAY TRIP
          if ((form.gateExitDateAndTime ?? '').isNotEmpty ||
              (form.gateEntryDateAndTime ?? '').isNotEmpty ||
              (form.status1 ?? '').isNotEmpty)
            Card(
              elevation: 0,
              color: Colors.grey.shade300.withValues(alpha: 0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 5,
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.route, color: AppColors.registration),
                        SizedBox(width: 8),
                        Text(
                          'One Way Trip',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        if ((form.gateExitDateAndTime ?? '').isNotEmpty)
                          Expanded(
                            child: InputField(
                              title: 'Gate Exit Date & Time',
                              initialValue: DateFormat(
                                'dd/MM/yy hh:mm a',
                              ).format(
                                DateTime.parse(form.gateExitDateAndTime!),
                              ),
                              readOnly: true,
                              maxLines: 1,
                            ),
                          ),

                        if ((form.gateEntryDateAndTime ?? '').isNotEmpty)
                          Expanded(
                            child: InputField(
                              title: 'Gate Entry Date & Time',
                              initialValue: DateFormat(
                                'dd/MM/yy hh:mm a',
                              ).format(
                                DateTime.parse(form.gateEntryDateAndTime!),
                              ),
                              readOnly: true,
                              maxLines: 1,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        if ((form.expectedDurationT1Min ?? '').isNotNull)
                          Expanded(
                            child: InputField(
                              title: 'Expected Duration (Min)',
                              initialValue:
                                  form.expectedDurationT1Min.toString(),
                              readOnly: true,
                            ),
                          ),

                        if ((form.actualDurationT1Min ?? '').isNotNull)
                          Expanded(
                            child: InputField(
                              title: 'Actual Duration (Min)',
                              initialValue: form.actualDurationT1Min.toString(),
                              readOnly: true,
                            ),
                          ),
                      ],
                    ),

                    if ((form.status1 ?? '').isNotEmpty)
                      InputField(
                        title: 'Status',
                        initialValue: form.status1,
                        readOnly: true,
                      ),
                  ],
                ),
              ),
            ),

          /// RETURN TRIP
          if ((form.gateExitDateAndTimeReturn ?? '').isNotEmpty ||
              (form.gateEntryDateAndTimeReturn ?? '').isNotEmpty ||
              (form.status2 ?? '').isNotEmpty)
            Card(
              elevation: 0,
              color: Colors.green.withValues(alpha: 0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 5,
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.keyboard_return,
                          color: AppColors.registration,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Return Trip',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        if ((form.gateExitDateAndTimeReturn ?? '').isNotEmpty)
                          Expanded(
                            child: InputField(
                              title: 'Gate Exit Date & Time',
                              initialValue: DFU.ddMMyyyyHHmmssFromStr(
                                form.gateExitDateAndTimeReturn!,
                              ),
                              readOnly: true,
                            ),
                          ),

                        if ((form.gateEntryDateAndTimeReturn ?? '').isNotEmpty)
                          Expanded(
                            child: InputField(
                              title: 'Gate Entry Date & Time',
                              initialValue: DFU.ddMMyyyyHHmmssFromStr(
                                form.gateEntryDateAndTimeReturn!,
                              ),
                              readOnly: true,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        if ((form.expectedDurationT2Min ?? '').isNotNull)
                          Expanded(
                            child: InputField(
                              title: 'Expected Duration (Min)',
                              initialValue:
                                  form.expectedDurationT2Min.toString(),
                              readOnly: true,
                            ),
                          ),

                        if ((form.actualDurationT2Min ?? '').isNotNull)
                          Expanded(
                            child: InputField(
                              title: 'Actual Duration (Min)',
                              initialValue: form.actualDurationT2Min.toString(),
                              readOnly: true,
                            ),
                          ),
                      ],
                    ),

                    if ((form.status2 ?? '').isNotEmpty)
                      InputField(
                        title: 'Status',
                        initialValue: form.status2,
                        readOnly: true,
                      ),
                  ],
                ),
              ),
            ),
        ],
        if (isHod && isPendingApproval && isOwner)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'You cannot approve your own Gate Pass.',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        if (canApprove) ...[
          const ApproveRejectButtons(),
        ] else if (!isReadOnly) ...[
          BlocBuilder<CreateEmployeeCubit, CreateEmployeeState>(
            builder:
                (_, state) => AppButton(
                  label: isCreating ? 'Save' : 'Send For Approval',
                  isLoading: state.isLoading,
                  bgColor: AppColors.registration,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(12.0),
                  onPressed: context.cubit<CreateEmployeeCubit>().save,
                ),
          ),
        ],
      ],
    );
  }
}
