import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/app/widgets/app_page_view2.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/trainingEvent/model/training_event.dart';
import 'package:nuevosol/features/trainingEvent/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/trainingEvent/presentation/bloc/traning_event_filter_cubit.dart';
import 'package:nuevosol/features/trainingEvent/presentation/widget/training_event_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_icons.dart';
import 'package:nuevosol/widgets/infinite_list_widget.dart';

class TrainingEventList extends StatelessWidget {
  const TrainingEventList({super.key});

  //  @override
  //   void initState() {
  //     status = 'Draft';
  //     context.read<GateExitFilterCubit>().onChangeStatus('Draft');
  //     context.read<GateExitFilterCubit>().onSearch(null);
  //     super.initState();
  //   }
  @override
  Widget build(BuildContext context) {
    return AppPageView2<TraningEventFilterCubit>(
      mode: PageMode2.trainingEvent,
      scaffoldBg: AppIcons.bgFrame4.path,
      backgroundColor: AppColors.event,
      onNew: () async {
        final refresh = await AppRoute.newTrainingEvent.push<bool?>(context);
        if (refresh == true) {
          fetchInital(context);
        }
      },
      onUpdateQuery: (value) {
        context.cubit<TraningEventFilterCubit>().onSearch(value);
        fetchInital(context);
      },
      onUpdateStatus: (value) {
        context.cubit<TraningEventFilterCubit>().onChangeStatus(value);
        fetchInital(context);
      },
      status: const ['All', 'Draft', 'Submitted'],
      child: RefreshIndicator(
        onRefresh: (){
          final filters = context.read<TraningEventFilterCubit>().state;
          return context.cubit<TrainingEventCubit>().fetchInitial(
            Pair(StringUtils.docStatusInt(filters.status), filters.query),
          );
        },
        child: InfiniteListViewWidget<TrainingEventCubit, TrainingEvent>(
          childBuilder:
              (context, entry) => TrainingWidget(
                gateEntry: entry,
                    onTap: () async {
                      final refresh = await AppRoute.newTrainingEvent
                          .push<bool?>(context, extra: entry);
                      if (refresh == true) {
                        fetchInital(context);
                      }
                    },
              ),
          fetchInitial: () => fetchInital(context),
          fetchMore: () => fetchMore(context),
          emptyListText: 'No Training Event Found',
        ),
      ),
    );                                                    
  }

  void fetchInital(BuildContext context) {
    final filter = context.read<TraningEventFilterCubit>().state;
    context.cubit<TrainingEventCubit>().fetchInitial(
      Pair(StringUtils.docStatusInt(filter.status), filter.query),
    );
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<TraningEventFilterCubit>().state;
    context.cubit<TrainingEventCubit>().fetchMore(
      Pair(StringUtils.docStatusInt(filter.status), filter.query),
    );
  }
}
