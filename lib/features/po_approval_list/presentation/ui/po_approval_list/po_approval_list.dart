import 'package:flutter/material.dart';
import 'package:nuevosol/app/widgets/app_page_view2.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/po_approval_list/model/po_approval.dart';
import 'package:nuevosol/features/po_approval_list/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/po_approval_list/presentation/bloc/po_approval_filters_cubit.dart';
import 'package:nuevosol/features/po_approval_list/presentation/ui/details/po_approval_list_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_icons.dart';
import 'package:nuevosol/widgets/infinite_list_widget.dart';

class PoApprovalListScrn extends StatelessWidget {
  const PoApprovalListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<PoApprovalFiltersCubit>(
      mode: PageMode2.poapprovallist,
      backgroundColor: AppColors.imagecolor,
      scaffoldBg: AppIcons.bgFrame4.path,
      hideFAB: true,
      status: const ['Draft', 'Submitted', 'Rejected', 'Cancelled'],
      onUpdateStatus: (value) {
        context.cubit<PoApprovalFiltersCubit>().onChangeStatus(value);
        _fetchInitial(context);
      },
      onUpdateQuery: (value) {
        context.cubit<PoApprovalFiltersCubit>().onSearch(value);
        _fetchInitial(context);
      },
      child: RefreshIndicator(
        onRefresh: () {
          final filters = context.cubit<PoApprovalFiltersCubit>().state;
          return context.cubit<PoApprovalCubit>().fetchInitial(filters);
        },
        child: InfiniteListViewWidget<PoApprovalCubit, PoApprovalForm>(
          childBuilder:
              (_, list) => PoApprovalListWidget(
                poApproval: list,
                onTap:
                    () => AppRoute.poApprovalListPreview.push(
                      context,
                      extra: list,
                    ),
              ),
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () => _fetchMore(context),
          emptyListText: 'No PO Approvals Found',
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filters = context.cubit<PoApprovalFiltersCubit>().state;
    context.cubit<PoApprovalCubit>().fetchInitial(filters);
  }

  void _fetchMore(BuildContext context) {
    final filters = context.cubit<PoApprovalFiltersCubit>().state;
    context.cubit<PoApprovalCubit>().fetchMore(filters);
  }
}
