import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/app/widgets/statusmenu_widget.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/core/cubit/base/filters_cubit.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_text_styles.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/buttons/go_back_widget.dart';
import 'package:nuevosol/widgets/inputs/simple_search_bar.dart';

enum PageMode2 {
  gateentry('Gate Entry'),
  gateexit('Gate Exit'),
  employeeTracker('Gate Pass'),
  trainingEvent('Traning Event'),
  dipatchGaylord('Dispatch Gaylord'),
  poapprovallist('PO Approval List'),
  dashbaords('Dashbaords');

  const PageMode2(this.name);
  final String name;
}

class AppPageView2<T extends FiltersCubit> extends StatefulWidget {
  const AppPageView2({
    super.key,
    required this.mode,
    this.title,
    required this.scaffoldBg,
    required this.backgroundColor,
    required this.child,
    this.status = const [],
    this.onUpdateQuery,
    this.onUpdateStatus,
    this.hideFAB = false,
    this.onNew,
    this.trailingAction
  });

  final String? title;
  final Widget child;
  final Color backgroundColor;
  final String scaffoldBg;
  final PageMode2 mode;
  final VoidCallback? onNew;
  final List<String> status;
  final ValueChanged<String>? onUpdateStatus;
  final ValueChanged<String?>? onUpdateQuery;
  final Widget? trailingAction;

  final bool hideFAB;

   @override
  State<AppPageView2<T>> createState() => _AppPageView2State<T>();
}

class _AppPageView2State<T extends FiltersCubit> extends State<AppPageView2<T>> {
  @override
  Widget build(BuildContext context) {
    
    final userRoles = context.user.role ?? [];
    final isHod = userRoles.any(
  (r) => r.toString().toLowerCase().contains('hod (hr)'),
);

    final isSecurity = userRoles.any((r) {
      final role = r.toString().toLowerCase();
      return role.contains('nepl-unit-1-gate') ||
          role.contains('nepl-unit-2-gate') ||
          role.contains('nmpl-unit-1-gate') ||
          role.contains('nmpl-unit-2-gate') ||
          role.contains('head office gate');
    });
    final hideFabForSecurity =
    widget.mode == PageMode2.employeeTracker && isSecurity;
    final hideFabForTraining = widget.mode == PageMode2.trainingEvent;
    T? cubit;
    try {
      cubit = context.read<T>();
    } catch (_) {}

    final hintText = switch (widget.mode) {
      PageMode2.gateentry => 'Search Gate Entry - ID',
      PageMode2.gateexit => 'Search Gate Exit - ID',
      PageMode2.employeeTracker => 'Search Gate Pass - ID',
      PageMode2.dipatchGaylord => 'Serach Delivery Note - ID',
      PageMode2.poapprovallist => 'Search PO - ID',
      PageMode2.dashbaords => '',
      PageMode2.trainingEvent => 'Search Event'
    };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: widget.backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(left: 52, top: -24, child: Image.asset(widget.scaffoldBg)),
          Positioned(
            left: 18,
            right: 18,
            top: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const GoBackWidget(),
                      AppSpacer.p8(),
                      Text(
                        widget.title ?? widget.mode.name,
                        style: AppTextStyles.titleLarge(
                          context,
                        ).copyWith(color: AppColors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 18,
                        color: AppColors.registration,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        context.user.firstName.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (widget.mode != PageMode2.dashbaords) ...[
            Positioned(
              top: kToolbarHeight + 32,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    if (widget.onUpdateQuery != null) ...[
                      Expanded(
                        child: SimpleSearchBar(
                          inputType: TextInputType.number,
                          initial: cubit?.state.query,
                          hintText: hintText,
                          onCancel: () => widget.onUpdateQuery!(null),
                          onSearch: widget.onUpdateQuery!,
                        ),
                      ),
                    ],
                    AppSpacer.p8(),
                    if (widget.status.isNotEmpty && widget.onUpdateStatus != null) ...[
                      Expanded(
                        flex: 1,
                        child: StatusMenuWidget(
                          defaultStatus: cubit?.state.status,
                          items: widget.status,
                          onChange: widget.onUpdateStatus!,
                        ),
                      ),
                    ],
                    if (widget.mode == PageMode2.employeeTracker && isHod
             ) ...[
            const SizedBox(width: 8),
            Expanded(
          flex: 1, // other 50%
          child: widget.trailingAction ?? const SizedBox.shrink(),
        ),
          ],
                  ],
                ),
              ),
            ),
          ],
          Positioned.fill(
            top: kToolbarHeight + 100,
            child: Container(
              width: context.sizeOfWidth,
              height: context.sizeOfHeight,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.pageViewColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                border: Border.all(color: AppColors.pageViewColor),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.5),
                    blurRadius: 10,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: widget.child,
            ),
          ),
        ],
      ),

      floatingActionButton:
          (widget.hideFAB.isTrue || hideFabForSecurity || hideFabForTraining)
              ? null
              : FloatingActionButton.extended(
                onPressed: widget.onNew,
                backgroundColor:
                    widget.mode == PageMode2.employeeTracker
                        ? AppColors.registration
                        : widget.backgroundColor,
                extendedPadding: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                elevation: 1,
                icon: const Icon(Icons.add, color: AppColors.white),
                label: Text('New', style: AppTextStyles.titleLarge(context)),
              ),
    );
  }
}
