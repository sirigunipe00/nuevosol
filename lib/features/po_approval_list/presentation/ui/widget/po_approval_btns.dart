import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/po_approval_list/model/po_approval.dart';
import 'package:nuevosol/features/po_approval_list/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/po_approval_list/presentation/bloc/po_approval_filters_cubit.dart';
import 'package:nuevosol/features/po_approval_list/presentation/ui/widget/reject_reason_dialog.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/dailogs/app_dialogs.dart';


class POApprovalButtons extends StatelessWidget {
  const POApprovalButtons({
    super.key,
    required this.po,
    required this.canApprove,
    required this.form,
  });

  final String po;
  final bool canApprove;
  final PoApprovalForm form;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RejectPOCubit, RejectPOState>(
          listener: (_, state) {
            state.maybeWhen(
              orElse: () {},
              failure: (failure) => AppDialog.showErrorDialog(
                context,
                content: failure.error,
                onTapDismiss: context.exit,
              ),
              success: (_) => AppDialog.showSuccessDialog(
                context,
                content: 'PO Rejected Successfully...!',
                onTapDismiss: context.exit,
              ).then((_) {
                if (!context.mounted) return;
                final filters = context.read<PoApprovalFiltersCubit>().state;
                context
                  ..cubit<PoApprovalCubit>().fetchInitial(filters)
                  ..cubit<POPermissionCubit>().request(form.name);
              }),
            );
          },
        ),
        BlocListener<ApprovePOCubit, ApprovePOState>(
          listener: (_, state) {
            state.maybeWhen(
              orElse: () {},
              failure: (failure) => AppDialog.showErrorDialog(
                context,
                content: failure.error,
                onTapDismiss: context.exit,
              ),
              success: (_) => AppDialog.showSuccessDialog(
                context,
                content: 'PO Approved Successfully...!',
                onTapDismiss: context.exit,
              ).then((_) {
                if (!context.mounted) return;
                final filters = context.read<PoApprovalFiltersCubit>().state;
                context
                  ..cubit<PoApprovalCubit>().fetchInitial(filters)
                  ..cubit<POPermissionCubit>().request(form.name);
              }),
            );
          },
        ),
      ],
      child: _StateBuilder(
        builder: (isloading) {
          final disableBtn = isloading 
          || canApprove.isFalse;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (form.state.isNotNull && form.state != 'Draft') ...[
                Expanded(
                  child: _ApprovalBtnWidget(
                    label: 'Reject',
                    backgroundColor: const Color(0xFFFE6061),
                    onPressed: disableBtn
                        ? null
                        : () {
                            final action = form.approvalAction(false);
                            _rejectPO(context, po, action);
                          },
                  ),
                ),
                AppSpacer.p12(),
                Expanded(
                  child: _ApprovalBtnWidget(
                    label: 'Approve',
                    backgroundColor: const Color(0xFF1BBB67),
                    onPressed: disableBtn
                        ? null
                        : () {
                            final action = form.approvalAction(true);
                            _approvePO(context, po, action);
                          },
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }

  void _approvePO(BuildContext context, String order, String action) {
    context.cubit<ApprovePOCubit>().request(Pair(order, action));
  }

  void _rejectPO(BuildContext context, String order, String action) async {
    final reason = await showDialog<String>(
      context: context,
      builder: (_) => const RejectReasonDialog(),
    );
    if (reason.doesNotHaveValue || !context.mounted) return;
    final params = tuple3(order, reason!, action);
    context.cubit<RejectPOCubit>().request(params);
  }
}

class _ApprovalBtnWidget extends StatelessWidget {
  const _ApprovalBtnWidget({
    required this.label,
    required this.backgroundColor,
    this.onPressed,
  });

  final String label;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: const Color(0xFF9B9B9B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          foregroundColor: AppColors.white,
          textStyle: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          )),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class _StateBuilder extends StatelessWidget {
  const _StateBuilder({required this.builder});

  final Function(bool isloading) builder;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApprovePOCubit, ApprovePOState>(
      builder: (_, stateA) {
        return BlocBuilder<RejectPOCubit, RejectPOState>(
          builder: (__, stateB) {
            return builder(stateA.isLoading || stateB.isLoading);
          },
        );
      },
    );
  }
}
