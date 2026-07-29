import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/app/widgets/app_page_view2.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/packing/model/packing_model.dart';
import 'package:nuevosol/features/packing/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/packing/presentation/bloc/packing_filter_cubit.dart';
import 'package:nuevosol/features/packing/presentation/widget/packing_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_icons.dart';
import 'package:nuevosol/widgets/infinite_list_widget.dart';

class PackingList extends StatelessWidget {
  const PackingList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<PackingFilterCubit>(
      mode: PageMode2.packing,
      scaffoldBg: AppIcons.bgFrame5.path,
      backgroundColor: AppColors.packing,
      onNew: () async {
        final refresh = await AppRoute.newPacking.push<bool?>(context);
        if(!context.mounted) return;
        if (refresh == true) {
          fetchInital(context);
        }
      },
      onUpdateQuery: (value) {
        context.cubit<PackingFilterCubit>().onSearch(value);
        fetchInital(context);
      },
      onUpdateStatus: (value) {
        context.cubit<PackingFilterCubit>().onChangeStatus(value);
        fetchInital(context);
      },
      status: const ['All', 'Draft', 'Submitted'],
      child: RefreshIndicator(
        onRefresh: (){
          final filters = context.read<PackingFilterCubit>().state;
          return context.cubit<PackingCubit>().fetchInitial(
            Pair(StringUtils.docStatusInt(filters.status), filters.query),
          );
        },
        child: InfiniteListViewWidget<PackingCubit, PackingModel>(
          childBuilder:
              (context, exit) => PackingWidget(
                packing: exit,
                onTap: () async {
                  final refresh = await AppRoute.newPacking.push<bool?>(
                    context,
                    extra: exit,
                  );
                  if(!context.mounted) return;
                  if (refresh == true) {
                    fetchInital(context);
                  }
                },
              ),
          fetchInitial: () => fetchInital(context),
          fetchMore: () => fetchMore(context),
          emptyListText: 'No Packings Found',
        ),
      ),
    );
  }

  void fetchInital(BuildContext context) {
    final filter = context.read<PackingFilterCubit>().state;
    context.cubit<PackingCubit>().fetchInitial(
      Pair(StringUtils.docStatusInt(filter.status), filter.query),
    );
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<PackingFilterCubit>().state;
    context.cubit<PackingCubit>().fetchMore(
      Pair(StringUtils.docStatusInt(filter.status), filter.query),
    );
  }
}
