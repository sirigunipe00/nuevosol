import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/app/widgets/app_page_view2.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/gate_exit/model/gate_exit.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/gate_exit_filter.dart';
import 'package:nuevosol/features/gate_exit/presentation/widgets/gate_exit_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_icons.dart';
import 'package:nuevosol/widgets/infinite_list_widget.dart';

class GateExitListScrn extends StatelessWidget {
  const GateExitListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<GateExitFilterCubit>(
      mode: PageMode2.gateexit,
      scaffoldBg: AppIcons.bgFrame2.path,
      backgroundColor: AppColors.shyMoment,
      onNew: () async {
        final refresh = await AppRoute.newGateExit.push<bool?>(context);
        if (refresh == true) {
          fetchInital(context);
        }
      },
      onUpdateQuery: (value) {
        context.cubit<GateExitFilterCubit>().onSearch(value);
        fetchInital(context);
      },
      onUpdateStatus: (value) {
        context.cubit<GateExitFilterCubit>().onChangeStatus(value);
        fetchInital(context);
      },
      status: const ['All', 'Draft', 'Submitted'],
      child: RefreshIndicator(
        onRefresh: (){
          final filters = context.read<GateExitFilterCubit>().state;
          return context.cubit<GateExitCubit>().fetchInitial(
            Pair(StringUtils.docStatusInt(filters.status), filters.query),
          );
        },
        child: InfiniteListViewWidget<GateExitCubit, GateExit>(
          childBuilder:
              (context, exit) => GateExitWidget(
                gateExit: exit,
                onTap: () async {
                  final refresh = await AppRoute.newGateExit.push<bool?>(
                    context,
                    extra: exit,
                  );
                  if (refresh == true) {
                    fetchInital(context);
                  }
                },
              ),
          fetchInitial: () => fetchInital(context),
          fetchMore: () => fetchMore(context),
          emptyListText: 'No GateExits Found',
        ),
      ),
    );
  }

  void fetchInital(BuildContext context) {
    final filter = context.read<GateExitFilterCubit>().state;
    context.cubit<GateExitCubit>().fetchInitial(
      Pair(StringUtils.docStatusInt(filter.status), filter.query),
    );
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<GateExitFilterCubit>().state;
    context.cubit<GateExitCubit>().fetchMore(
      Pair(StringUtils.docStatusInt(filter.status), filter.query),
    );
  }
}
