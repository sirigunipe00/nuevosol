import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/create_gate_entry_cubit/create_gateentry_cubit.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/gate_entry_filter.dart';
import 'package:nuevosol/features/gate_entry/presentation/ui/create/widget/gate_entry_form_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/dailogs/app_dialogs.dart';
import 'package:nuevosol/widgets/simple_app_bar.dart';
import 'package:nuevosol/widgets/title_status_app_bar.dart';


class NewGateEntry extends StatefulWidget {
  const NewGateEntry({super.key});

  @override
  State<NewGateEntry> createState() => _NewGateEntryState();
}

class _NewGateEntryState extends State<NewGateEntry> {
  @override
  Widget build(BuildContext context) {
    final gateEntryState = context.read<CreateGateEntryCubit>().state;
    final form = gateEntryState.form;
    final status = form.status;
    final name = form.name;

    final isNew = gateEntryState.view == GateEntryView.create;
    return Scaffold(
      appBar: isNew
          ? const SimpleAppBar(title: 'New Gate Entry')
          : TitleStatusAppBar(
              title: 'Gate Entry',
              docNo: name.valueOrEmpty,
              status: status.valueOrEmpty,
              textColor: AppColors.marigoldDDust,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateGateEntryCubit, CreateGateEntryState>(
        listener: (_, state) async {
          if (state.isSuccess && state.successMsg.isNotNull) {
            AppDialog.showSuccessDialog(
              context,
              title: 'Success',
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            ).then(
              (_){
                if (!context.mounted) return;
                 context.cubit<CreateGateEntryCubit>().errorHandled();
                final filter = context.read<GateEntryFilterCubit>().state;
                context
                  .cubit<GateEntriesCubit>().fetchInitial(Pair(
                  StringUtils.docStatusInt(filter.status),
                  filter.query,
                ),
                );
                Navigator.pop(context,true);
            setState(() {});
                 
              }
            );
            // context.cubit<GateEntriesCubit>().fetchInitial();
            
          }
          if (state.error.isNotNull) {
            await AppDialog.showErrorDialog(
              context,
              title: state.error!.title,
              content: state.error!.error,
              onTapDismiss: context.exit,
            );
            if (!context.mounted) return;
            context.cubit<CreateGateEntryCubit>().errorHandled();
            return;
          }
        },
        child: GateEntryFormWidget(key: ValueKey(status),),
      ),
    );
  }
}
