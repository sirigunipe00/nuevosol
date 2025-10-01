import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/po_approval_list/model/po_approval.dart';
import 'package:nuevosol/features/po_approval_list/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/po_approval_list/presentation/ui/widget/po_approval_btns.dart';
import 'package:nuevosol/features/po_approval_list/presentation/ui/widget/po_title_value_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/spaced_column.dart';


class PoDetailsWidget extends StatefulWidget {
  const PoDetailsWidget({super.key, required this.form});
  final PoApprovalForm form;

  @override
  State<PoDetailsWidget> createState() => _PoDetailsWidgetState();
}

class _PoDetailsWidgetState extends State<PoDetailsWidget>
    with SingleTickerProviderStateMixin {
  bool _isAnimating = false;
  late AnimationController _controller;
  late Animation<Color?> _glowColor;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    _glowColor = ColorTween(
      begin: const Color.fromARGB(255, 235, 115, 3),
      end: const Color.fromARGB(255, 228, 109, 5),
    ).animate(_controller);
  }

  void _startAnimation() async {
    setState(() => _isAnimating = true);
    _controller.repeat(reverse: true);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _buildSparkDialog(),
    );

    await Future.delayed(const Duration(seconds: 3));

    _controller..stop()
    ..reset();
    setState(() => _isAnimating = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('AI Compare Completed!')),
    );
  }

  Widget _buildSparkDialog() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.withValues(alpha: 0.6),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withValues(alpha: 0.8),
                  blurRadius: 20 * _controller.value,
                  spreadRadius: 3 * _controller.value,
                ),
              ],
            ),
            child: const Icon(Icons.bolt, color: Colors.white, size: 40),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final form = widget.form;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 6),
          child: AnimatedBuilder(
            animation: _glowColor,
            builder: (_, __) => ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isAnimating
                    ? _glowColor.value
                    : const Color.fromARGB(255, 235, 115, 3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                elevation: 4,
              ),
              onPressed: _isAnimating ? null : _startAnimation,
              icon: const SizedBox(),
              label: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'AI Compare Quotation',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.auto_awesome, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.blueshade,
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.titlecolor.withValues(alpha: 0.7),
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8.0),
          child: SpacedColumn(
            defaultHeight: 8.0,
            margin: const EdgeInsets.all(4.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: POTitleValueWidget(
                      leading: Icons.person,
                      title: 'Vendor Name',
                      subtitle: form.vendor,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Grand Total',
                        style: TextStyle(
                          color: AppColors.titlecolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: AppColors.titlecolor),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: Text(
                          NumUtils.inRupeesFormat(form.grandTotal),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      const Row(
                        children: [
                          Text('\u2022', style: TextStyle(color: Colors.red)),
                          SizedBox(width: 3),
                          Text(
                            'Inclusive of all the taxes',
                            style: TextStyle(
                                color: AppColors.titlecolor, fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              POTitleValueWidget(
                leading: Icons.content_paste_rounded,
                title: 'Required By',
                subtitle: DFU.ddMMyyyyFromStr(form.requiredBy.toString()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: POTitleValueWidget(
                      leading: Icons.calendar_month,
                      title: 'Created Date',
                      subtitle: DFU.ddMMyyyyFromStr(form.creationDate),
                    ),
                  ),
                  AppSpacer.p8(),
                  Flexible(
                    child: POTitleValueWidget(
                      leading: Icons.schedule,
                      title: 'Creation Time',
                      subtitle: DFU.timeLabelFromStr(form.creationDate),
                    ),
                  ),
                ],
              ),
              BlocBuilder<POPermissionCubit, POPermissionState>(
                builder: (_, state) {
                  final canapprove = state.maybeWhen(
                    orElse: () => false,
                    success: (data) => data,
                  );
                  return POApprovalButtons(
                    form: form,
                    po: form.name,
                    canApprove: canapprove,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
