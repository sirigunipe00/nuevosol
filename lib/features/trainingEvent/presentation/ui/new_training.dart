import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/trainingEvent/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/trainingEvent/presentation/bloc/create_training_cubit/create_training_cubit.dart';
import 'package:nuevosol/features/trainingEvent/presentation/bloc/traning_event_filter_cubit.dart';
import 'package:nuevosol/features/trainingEvent/presentation/ui/training_form_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/dailogs/app_dialogs.dart';
import 'package:nuevosol/widgets/simple_app_bar.dart';
import 'package:nuevosol/widgets/title_status_app_bar.dart';


class NewTraining extends StatefulWidget {
  const NewTraining({super.key});

  @override
  State<NewTraining> createState() => _NewTrainingState();
}

class _NewTrainingState extends State<NewTraining> {
  @override
  Widget build(BuildContext context) {
    final gateEntryState = context.read<CreateTrainingCubit>().state;
    final form = gateEntryState.form;
    final status = form.docStatus;
    final name = form.name;

    final isNew = gateEntryState.view == TraininView.create;
    return Scaffold(
      appBar: isNew
          ? const SimpleAppBar(title: 'New Training Event')
          : TitleStatusAppBar(
              title: 'Training Event',
              docNo: name.valueOrEmpty,
              status: StringUtils.docStatus(status ?? 0),
              textColor: AppColors.event,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateTrainingCubit, CreateTrainingState>(
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
                 context.cubit<CreateTrainingCubit>().errorHandled();
                final filter = context.read<TraningEventFilterCubit>().state;
                context
                  .cubit<TrainingEventCubit>().fetchInitial(Pair(
                  StringUtils.docStatusInt(filter.status),
                  filter.query,
                ),
                );
                Navigator.pop(context,true);
            setState(() {});
                 
              }
            );
            // context.cubit<TrainingEventCubit>().fetchInitial();
            
          }
          if (state.error.isNotNull) {
            await AppDialog.showErrorDialog(
              context,
              title: state.error!.title,
              content: state.error!.error,
              onTapDismiss: context.exit,
            );
            if (!context.mounted) return;
            context.cubit<CreateTrainingCubit>().errorHandled();
            return;
          }
        },
        child: TrainingFormWidget(key: ValueKey(status),),
      ),
    );
  }
}
