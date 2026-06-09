import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/app/widgets/app_page_view2.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/core/model/page_view_filters.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_model.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/employee_filters.dart';
import 'package:nuevosol/features/employee_tracker/presentation/widget/department_btn.dart';
import 'package:nuevosol/features/employee_tracker/presentation/widget/employee_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_icons.dart';
import 'package:nuevosol/widgets/infinite_list_widget.dart';

class EmployeeListScrn extends StatefulWidget {
  const EmployeeListScrn({super.key});

  @override
  State<EmployeeListScrn> createState() => _EmployeeListScrnState();
}

class _EmployeeListScrnState extends State<EmployeeListScrn> {
  
  String? status;
  @override
  @override
  @override
  void initState() {
    final userRoles = context.user.role ?? [];

    final issecurity = userRoles.any((r) {
      final role = r.toString().toLowerCase();

      return role.contains('nepl-unit-1-gate') ||
          role.contains('nepl-unit-2-gate') ||
          role.contains('nmpl-unit-1-gate') ||
          role.contains('nmpl-unit-2-gate') ||
          role.contains('head office gate');
    });

    final isHod = userRoles.any(
      (r) => r.toString().toLowerCase().contains('hod (hr)'),
    );
debugPrint(
  'Logged User Department => ${context.user.department}',
);
    if (isHod) {
      status = 'Pending For Approval';
    } else if (issecurity) {
      status = 'Approved';
    } else {
      status = 'Draft';
    }

    context.read<EmployeeFilters>().onChangeStatus(status!);
    context.read<EmployeeFilters>().onSearch(null);
    if (isHod) {
    context.read<EmployeeFilters>().onChangeDepartment(
      context.user.department, 
    );
  }
  fetchInital(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userRoles = context.user.role ?? [];

    final issecurity = userRoles.any((r) {
      final role = r.toString().toLowerCase();
      return role.contains('nepl-unit-1-gate') ||
          role.contains('nepl-unit-2-gate') ||
          role.contains('nmpl-unit-1-gate') ||
          role.contains('nmpl-unit-2-gate') ||
          role.contains('head office gate');
    });

    final isHod = userRoles.any(
      (r) => r.toString().toLowerCase().contains('hod (hr)'),
    );

    final statusList =
        issecurity
            ? const ['Approved', 'Movement Ongoing', 'Closed']
            : isHod
            ? const [
              'All',
              'Draft',
              'Pending For Approval',
              'Approved',
              'Rejected',
              'Movement Ongoing',
              'Closed',
            ]
            : const [
              'All',
              'Draft',
              'Pending For Approval',
              'Approved',
              'Rejected',
              'Movement Ongoing',
              'Closed',
            ];
    return AppPageView2<EmployeeFilters>(
      mode: PageMode2.employeeTracker,
      scaffoldBg: AppIcons.bgFrame1.path,
      backgroundColor: AppColors.registration,
      trailingAction: BlocBuilder<EmployeeFilters, PageViewFilters>(
        builder:
            (context, filters) => BlocProvider(
              create:
                  (context) =>
                      EmployeeBlocProvider.get().getDepartments()..request(),
              child: DepartmentFilterButton(
                selectedDepartmenr: filters.department,
                onSelect: (so) {
                  context.read<EmployeeFilters>().onChangeDepartment(so);

                  fetchInital(context);
                },
                onClear: () {
                  context.read<EmployeeFilters>().onChangeDepartment('');
                  fetchInital(context);
                  setState(() {});
                },
              ),
            ),
      ),
      onNew: () async {
        final refresh = await AppRoute.newEmployeeTracker.push<bool?>(context);
        if (refresh == true) {
          fetchInital(context);
        }
      },
      onUpdateQuery: (value) {
        context.cubit<EmployeeFilters>().onSearch(value);
        fetchInital(context);
      },
      onUpdateStatus: (value) {
        context.cubit<EmployeeFilters>().onChangeStatus(value);
        fetchInital(context);
      },
      status: statusList,
      child: RefreshIndicator(
        onRefresh: () {
          final filters = context.read<EmployeeFilters>().state;
          return context.cubit<EmployeeEntriesCubit>().fetchInitial(
            Triple(
              StringUtils.docStatusEmployee(filters.status),
              filters.query,
              filters.department,
            ),
          );
        },
        child: InfiniteListViewWidget<EmployeeEntriesCubit, EmployeeTracker>(
          childBuilder:
              (context, entry) => EmployeeWidget(
                employee: entry,
                onTap: () async {
                  final refresh = await AppRoute.newEmployeeTracker.push<bool?>(
                    context,
                    extra: entry,
                  );
                  if (refresh == true) {
                    fetchInital(context);
                  }
                },
              ),
          fetchInitial: () => fetchInital(context),
          fetchMore: () => fetchMore(context),
          emptyListText: 'No EmployeeEntries Found',
        ),
      ),
    );
  }

  void fetchInital(BuildContext context) {
    final filter = context.read<EmployeeFilters>().state;
    context.cubit<EmployeeEntriesCubit>().fetchInitial(
      Triple(
        StringUtils.docStatusEmployee(filter.status),
        filter.query,
        filter.department,
      ),
    );
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<EmployeeFilters>().state;
    context.cubit<EmployeeEntriesCubit>().fetchMore(
      Triple(
        StringUtils.docStatusEmployee(filter.status),
        filter.query,
        filter.department,
      ),
    );
  }
}
