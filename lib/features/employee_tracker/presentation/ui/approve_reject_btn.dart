import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/create_employee_cubit/create_employee_cubit.dart';
import 'package:nuevosol/widgets/buttons/app_btn.dart';

class ApproveRejectButtons extends StatefulWidget {
  const ApproveRejectButtons({super.key});

  @override
  State<ApproveRejectButtons> createState() => ApproveRejectButtonsState();
}

class ApproveRejectButtonsState extends State<ApproveRejectButtons> {
  final _rejectReasonController = TextEditingController();

  @override
  void dispose() {
    _rejectReasonController.dispose();
    super.dispose();
  }

  void _showRejectDialog() {
    _rejectReasonController.clear();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (dialogContext) => StatefulBuilder(
            builder:
                (_, setDialogState) => Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Reason of Rejection:',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _rejectReasonController,
                          maxLines: 4,
                          onChanged: (_) => setDialogState(() {}),
                          decoration: InputDecoration(
                            hintText: 'Enter Reject reason......',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            contentPadding: const EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(dialogContext),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  side: BorderSide(color: Colors.grey.shade400),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Manrope',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  disabledBackgroundColor: Colors.red.shade200,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed:
                                    _rejectReasonController.text.trim().isEmpty
                                        ? null
                                        : () {
                                          Navigator.pop(dialogContext);
                                          context
                                              .cubit<CreateEmployeeCubit>()
                                              .reject(
                                                _rejectReasonController.text
                                                    .trim(),
                                              );
                                        },
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEmployeeCubit, CreateEmployeeState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Reject',
                  isLoading: state.isRejectLoading,
                  bgColor: Colors.red,
                  onPressed:
                      state.isApproveLoading || state.isRejectLoading
                          ? null
                          : _showRejectDialog,
                ),
              ),

              const SizedBox(width: 12),
              Expanded(
                child: AppButton(
                  label: 'Approve',
                  isLoading: state.isApproveLoading,
                  bgColor: Colors.green,
                  onPressed:
                      state.isApproveLoading || state.isRejectLoading
                          ? null
                          : () =>
                              context.cubit<CreateEmployeeCubit>().approve(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
