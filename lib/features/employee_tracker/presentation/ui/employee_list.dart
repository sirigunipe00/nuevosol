import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/app/widgets/app_page_view2.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_model.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/employee_filters.dart';
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
    void initState() {
      status = 'Draft';
      context.read<EmployeeFilters>().onChangeStatus('Draft');
      context.read<EmployeeFilters>().onSearch(null);
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return AppPageView2<EmployeeFilters>(
      mode: PageMode2.employeeTracker,
      scaffoldBg: AppIcons.bgFrame1.path,
      backgroundColor: AppColors.registration,
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
      status: const ['All', 'Draft','Pending For Approval', 'Approved', 'Rejected'],
      child: RefreshIndicator(
        onRefresh: (){
          final filters = context.read<EmployeeFilters>().state;
          return context.cubit<EmployeeEntriesCubit>().fetchInitial(
            Pair(StringUtils.docStatusEmployee(filters.status), filters.query),
          );
        },
        child: InfiniteListViewWidget<EmployeeEntriesCubit, EmployeeTracker>(
          childBuilder:
              (context, entry) => EmployeeWidget(
                employee: entry,
                    onTap: () async {
                      final refresh = await AppRoute.newEmployeeTracker
                          .push<bool?>(context, extra: entry);
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
      Pair(StringUtils.docStatusEmployee(filter.status), filter.query),
    );
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<EmployeeFilters>().state;
    context.cubit<EmployeeEntriesCubit>().fetchMore(
      Pair(StringUtils.docStatusEmployee(filter.status), filter.query),
    );
  }
}
