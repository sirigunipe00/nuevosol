import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/create_gate_exit/create_gate_exit_cubit.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/gate_exit_filter.dart';
import 'package:nuevosol/features/gate_exit/presentation/ui/create/widget/gate_exit_form_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/dailogs/app_dialogs.dart';
import 'package:nuevosol/widgets/simple_app_bar.dart';
import 'package:nuevosol/widgets/title_status_app_bar.dart';


class NewGateExit extends StatefulWidget {
  const NewGateExit({super.key});

  @override
  State<NewGateExit> createState() => _NewGateExitState();
}

class _NewGateExitState extends State<NewGateExit> {
  @override
  Widget build(BuildContext context) {
    final gateExitState = context.read<CreateGateExitCubit>().state;
    final form = gateExitState.form;
    final status = form.docStatus;
    final name = form.name;
    final isNew = gateExitState.view == GateExitView.create;

    return Scaffold(
      appBar: isNew
          ? const SimpleAppBar(title: 'New Gate Exit')
          : TitleStatusAppBar(
              title: 'Gate Exit',
              docNo: name.valueOrEmpty,
              status: StringUtils.docStatus(status ?? 0),
              textColor: AppColors.shyMoment,
            ) as PreferredSizeWidget,
      backgroundColor: AppColors.white,
      body: BlocListener<CreateGateExitCubit, CreateGateExitState>(
        listener: (_, state) async {
          if (state.isSuccess && state.successMsg.isNotNull) {
            AppDialog.showSuccessDialog(
              context,
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            ).then((_){
               if (!context.mounted) return;
              context.cubit<CreateGateExitCubit>().errorHandled();

              final gateEntryFilters =
                  context.read<GateExitFilterCubit>().state;
            context.cubit<GateExitCubit>().fetchInitial(
              Pair(
                  StringUtils.docStatusInt(gateEntryFilters.status),
                  gateEntryFilters.query,
                ),
            );
            Navigator.pop(context,true);
            setState(() {});
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
            context.cubit<CreateGateExitCubit>().errorHandled();
            return;
          }
        },
        child: GateExitFormWidget(key: ValueKey(status),),
      ),
    );
  }
}


