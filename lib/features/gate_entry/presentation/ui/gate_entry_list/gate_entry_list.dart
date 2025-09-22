import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/app/widgets/app_page_view2.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/gate_entry/model/gate_entry.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/gate_entry_filter.dart';
import 'package:nuevosol/features/gate_entry/presentation/widgets/gate_entry_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_icons.dart';
import 'package:nuevosol/widgets/infinite_list_widget.dart';

class GateEntryListScrn extends StatelessWidget {
  const GateEntryListScrn({super.key});

  //  @override
  //   void initState() {
  //     status = 'Draft';
  //     context.read<GateExitFilterCubit>().onChangeStatus('Draft');
  //     context.read<GateExitFilterCubit>().onSearch(null);
  //     super.initState();
  //   }
  @override
  Widget build(BuildContext context) {
    return AppPageView2<GateEntryFilterCubit>(
      mode: PageMode2.gateentry,
      scaffoldBg: AppIcons.bgFrame1.path,
      backgroundColor: AppColors.marigoldDDust,
      onNew: () async {
        final refresh = await AppRoute.newGateEntry.push<bool?>(context);
        if (refresh == true) {
          fetchInital(context);
        }
      },
      onUpdateQuery: (value) {
        context.cubit<GateEntryFilterCubit>().onSearch(value);
        fetchInital(context);
      },
      onUpdateStatus: (value) {
        context.cubit<GateEntryFilterCubit>().onChangeStatus(value);
        fetchInital(context);
      },
      status: const ['All', 'Draft', 'Submitted'],
      child: RefreshIndicator(
        onRefresh: (){
          final filters = context.read<GateEntryFilterCubit>().state;
          return context.cubit<GateEntriesCubit>().fetchInitial(
            Pair(StringUtils.docStatusInt(filters.status), filters.query),
          );
        },
        child: InfiniteListViewWidget<GateEntriesCubit, GateEntry>(
          childBuilder:
              (context, entry) => GateEntryWidget(
                gateEntry: entry,
                    onTap: () async {
                      final refresh = await AppRoute.newGateEntry
                          .push<bool?>(context, extra: entry);
                      if (refresh == true) {
                        fetchInital(context);
                      }
                    },
              ),
          fetchInitial: () => fetchInital(context),
          fetchMore: () => fetchMore(context),
          emptyListText: 'No GateEntries Found',
        ),
      ),
    );
  }

  void fetchInital(BuildContext context) {
    final filter = context.read<GateEntryFilterCubit>().state;
    context.cubit<GateEntriesCubit>().fetchInitial(
      Pair(StringUtils.docStatusInt(filter.status), filter.query),
    );
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<GateEntryFilterCubit>().state;
    context.cubit<GateEntriesCubit>().fetchMore(
      Pair(StringUtils.docStatusInt(filter.status), filter.query),
    );
  }
}
