import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/create_employee_cubit/create_employee_cubit.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/employee_filters.dart';
import 'package:nuevosol/features/employee_tracker/presentation/ui/employee_form_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/dailogs/app_dialogs.dart';
import 'package:nuevosol/widgets/simple_app_bar.dart';
import 'package:nuevosol/widgets/title_status_app_bar.dart';


class NewEmployee extends StatefulWidget {
  const NewEmployee({super.key});

  @override
  State<NewEmployee> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  @override
  Widget build(BuildContext context) {
    final employeeState = context.read<CreateEmployeeCubit>().state;
    final form = employeeState.form;
    final status = form.docstatus;
    final name = form.name;

    final isNew = employeeState.view == EmployeeView.create;
    return Scaffold(
      appBar: isNew
          ? const SimpleAppBar(title: 'New Employee')
          : TitleStatusAppBar(
              title: 'Employee',
              docNo: name.valueOrEmpty,
              status: StringUtils.docStatus(status ?? 0),
              textColor: AppColors.registration,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateEmployeeCubit, CreateEmployeeState>(
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
                 context.cubit<CreateEmployeeCubit>().errorHandled();
                final filter = context.read<EmployeeFilters>().state;
                context
                  .cubit<EmployeeEntriesCubit>().fetchInitial(Pair(
                  StringUtils.docStatusEmployee(filter.status),
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
            context.cubit<CreateEmployeeCubit>().errorHandled();
            return;
          }
        },
        child: EmployeeFormWidget(key: ValueKey(status),),
      ),
    );
  }
}
