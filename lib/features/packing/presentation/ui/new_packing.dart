import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/packing/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/packing/presentation/bloc/create_packing_cubit/create_packing_cubit.dart';
import 'package:nuevosol/features/packing/presentation/bloc/packing_filter_cubit.dart';
import 'package:nuevosol/features/packing/presentation/ui/packing_form_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/dailogs/app_dialogs.dart';
import 'package:nuevosol/widgets/simple_app_bar.dart';
import 'package:nuevosol/widgets/title_status_app_bar.dart';

class NewPacking extends StatefulWidget {
  const NewPacking({super.key});

  @override
  State<NewPacking> createState() => _NewPackingState();
}

class _NewPackingState extends State<NewPacking> {
  @override
  Widget build(BuildContext context) {
    final gateEntryState = context.read<CreatePackingCubit>().state;
    final form = gateEntryState.form;
    final status = form.docstatus;
    final name = form.name;

    final isNew = gateEntryState.view == PackingView.create;
    return Scaffold(
      appBar:
          isNew
              ? const SimpleAppBar(title: 'New Packing')
              : TitleStatusAppBar(
                    title: 'Packing Posting',
                    docNo: name.valueOrEmpty,
                    status: StringUtils.docStatus(status ?? 0),
                    textColor: AppColors.packing,
                  )
                  as PreferredSizeWidget,
      body: BlocListener<CreatePackingCubit, CreatePackingState>(
        listener: (_, state) async {
          if (state.isSuccess && state.successMsg.isNotNull) {
            AppDialog.showSuccessDialog(
              context,
              title: 'Success',
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            ).then((_) async {
              if (!context.mounted) return;
              context.cubit<CreatePackingCubit>().errorHandled();
              final filter = context.read<PackingFilterCubit>().state;
              context.cubit<PackingCubit>().fetchInitial(
                Pair(
                  StringUtils.docStatusInt(filter.status),
                  filter.query,
                ),
              );

              final packingForm = context.read<CreatePackingCubit>().state.form;
              context.read<OperatorCubit>().request(packingForm.name ?? '');
              await AppRoute.packingItemScan.push(
                context,
                extra: packingForm,
              );
            });
          }
          if (state.error.isNotNull) {
            await AppDialog.showErrorDialog(
              context,
              title: state.error!.title,
              content: state.error!.error,
              onTapDismiss: context.exit,
            );
            if (!context.mounted) return;
            context.cubit<CreatePackingCubit>().errorHandled();
            return;
          }
        },
        child: const SingleChildScrollView(child: PackingFormWidget()),
      ),
    );
  }
}
