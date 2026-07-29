// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nuevosol/app/widgets/app_page_view2.dart';
// import 'package:nuevosol/core/core.dart';
// import 'package:nuevosol/core/utils/scaffold.dart';
// import 'package:nuevosol/features/trainingEvent/model/training_event.dart';
// import 'package:nuevosol/features/trainingEvent/presentation/bloc/bloc_provider.dart';
// import 'package:nuevosol/features/trainingEvent/presentation/bloc/create_training_cubit/create_training_cubit.dart';
// import 'package:nuevosol/features/trainingEvent/presentation/bloc/traning_event_filter_cubit.dart';
// import 'package:nuevosol/features/trainingEvent/presentation/ui/training_form_widget.dart';
// import 'package:nuevosol/features/trainingEvent/presentation/widget/training_event_widget.dart';
// import 'package:nuevosol/styles/app_color.dart';
// import 'package:nuevosol/styles/app_icons.dart';
// import 'package:nuevosol/widgets/infinite_list_widget.dart';

// enum HrTrainingViewMode {
//   hr('HR'),
//   trainee('Trainee'),
//   trainer('Trainer');

//   const HrTrainingViewMode(this.label);
//   final String label;
// }

// class TrainingEventList extends StatefulWidget {
//   const TrainingEventList({super.key});

//   @override
//   State<TrainingEventList> createState() => _TrainingEventListState();
// }

// class _TrainingEventListState extends State<TrainingEventList> {
//   List<TrainingEvent> _scannedEvents = [];
// String? _employeeName;
// String? _employeeCode;
// bool _showScannedList = false;
//   HrTrainingViewMode _selectedView = HrTrainingViewMode.hr;

//   // Helper method to show Snackbars reliably
//   void _showAppSnackBar(BuildContext context, String message, Color color) {
//     final messenger = ScaffoldMessenger.of(context);
//     messenger.hideCurrentSnackBar();
//     messenger.showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: const TextStyle(color: Colors.white),
//         ),
//         backgroundColor: color,
//         behavior: SnackBarBehavior.floating,
//         duration: const Duration(seconds: 4),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // 1. Improved Role Detection
//     final userRoles = context.user.role ?? [];
//     final isTrainee = userRoles.any(
//       (r) => r.toString().toLowerCase().trim().contains('trainee'),
//     );
//     final isHrUser = userRoles.any(
//       (r) => r.toString().toLowerCase().trim().contains('hr user'),
//     );

//     // 2. Logic for showing Scanner vs List
//     final showScannerView = isHrUser 
//         ? _selectedView == HrTrainingViewMode.trainee 
//         : isTrainee;

//     return AppPageView2<TraningEventFilterCubit>(
//       mode: PageMode2.trainingEvent,
//       scaffoldBg: AppIcons.bgFrame4.path,
//       backgroundColor: AppColors.event,
//       onNew: () async {
//         final refresh = await AppRoute.newTrainingEvent.push<bool?>(context);
//         if (refresh == true) {
//           fetchInital(context);
//         }
//       },
//       onUpdateQuery: (value) {
//         context.cubit<TraningEventFilterCubit>().onSearch(value);
//         fetchInital(context);
//       },
//       onUpdateStatus: (value) {
//         context.cubit<TraningEventFilterCubit>().onChangeStatus(value);
//         fetchInital(context);
//       },
//       status: const ['All', 'Draft', 'Submitted'],
//       trailingAction: isHrUser
//           ? Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: AppColors.event),
//               ),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<HrTrainingViewMode>(
//                   value: _selectedView,
//                   isExpanded: false, // Changed to false for better fit in header
//                   dropdownColor: AppColors.white,
//                   icon: const Icon(Icons.arrow_drop_down),
//                   items: HrTrainingViewMode.values
//                       .map(
//                         (mode) => DropdownMenuItem(
//                           value: mode,
//                           child: Text(mode.label),
//                         ),
//                       )
//                       .toList(),
//                   onChanged: (mode) {
//                     if (mode != null) {
//                       setState(() => _selectedView = mode);
//                     }
//                   },
//                 ),
//               ),
//             )
//           : null,
//       child: BlocListener<CreateTrainingCubit, CreateTrainingState>(
//         listener: (context, state) {
//           if (state.isSuccess && state.successMsg.isNotNull) {
//             _showAppSnackBar(context, state.successMsg.valueOrEmpty, Colors.green);
//             context.read<CreateTrainingCubit>().errorHandled();
//           }

//           if (state.error.isNotNull) {
//             _showAppSnackBar(context, state.error!.error, Colors.red);
//             context.read<CreateTrainingCubit>().errorHandled();
//           }
//         },
//         child: Builder(
//           builder: (innerContext) {
//             if (showScannerView) {
//               return _TraineeScanView(
//                 // onScanned: (result) => _joinTraining(innerContext, result),
//                 onScanned: (value) => context.read<CreateTrainingCubit>().joinTraining(value),
//               );
//             }

//             return RefreshIndicator(
//               onRefresh: () async {
//                 final filters = innerContext.read<TraningEventFilterCubit>().state;
//                 await innerContext.read<TrainingEventCubit>().fetchInitial(
//                   Pair(
//                     StringUtils.docStatusInt(filters.status),
//                     filters.query,
//                   ),
//                 );
//               },
//               child: InfiniteListViewWidget<TrainingEventCubit, TrainingEvent>(
//                 childBuilder: (context, entry) => TrainingWidget(
//                   gateEntry: entry,
//                   onTap: () async {
//                     final refresh = await AppRoute.newTrainingEvent
//                         .push<bool?>(context, extra: entry);
//                     if (refresh == true) {
//                       fetchInital(context);
//                     }
//                   },
//                 ),
//                 fetchInitial: () => fetchInital(innerContext),
//                 fetchMore: () => fetchMore(innerContext),
//                 emptyListText: 'No Training Event Found',
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   void _joinTraining(BuildContext context, String result) {
//     $logger.devLog('Join Training triggered for: $result');
//     context.read<CreateTrainingCubit>().joinTraining(result);
//   }

//   void fetchInital(BuildContext context) {
//     final filter = context.read<TraningEventFilterCubit>().state;
//     context.cubit<TrainingEventCubit>().fetchInitial(
//       Pair(StringUtils.docStatusInt(filter.status), filter.query),
//     );
//   }

//   void fetchMore(BuildContext context) {
//     final filter = context.read<TraningEventFilterCubit>().state;
//     context.cubit<TrainingEventCubit>().fetchMore(
//       Pair(StringUtils.docStatusInt(filter.status), filter.query),
//     );
//   }
// }

// class _TraineeScanView extends StatelessWidget {
//   const _TraineeScanView({required this.onScanned});

//   final ValueChanged<String> onScanned;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.qr_code_scanner, size: 80, color: AppColors.event),
//             const SizedBox(height: 16),
//             Text(
//               'Join Training Session',
//               style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.event,
//                   ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Scan the QR code provided by your trainer to register your attendance.',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                     color: Colors.grey[600],
//                   ),
//             ),
//             const SizedBox(height: 32),
//             SizedBox(
//               width: double.infinity,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColors.event.withValues(alpha: 0.3),
//                       blurRadius: 12,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.event,
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   icon: const Icon(Icons.camera_alt),
//                   label: const Text(
//                     'Open QR Scanner',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   onPressed: () async {
//                     // Assuming QrScannerPage returns the scanned string result
//                     final result = await Navigator.push<String>(
//                       context,
//                       MaterialPageRoute(builder: (_) => const QrScannerPage()),
//                     );

//                     if (result != null && result.isNotEmpty) {
//                       onScanned(result);
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/app/widgets/app_page_view2.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/trainingEvent/model/training_event.dart';
import 'package:nuevosol/features/trainingEvent/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/trainingEvent/presentation/bloc/create_training_cubit/create_training_cubit.dart';
import 'package:nuevosol/features/trainingEvent/presentation/bloc/traning_event_filter_cubit.dart';
import 'package:nuevosol/features/trainingEvent/presentation/ui/training_form_widget.dart';
import 'package:nuevosol/features/trainingEvent/presentation/widget/training_event_widget.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/styles/app_icons.dart';
import 'package:nuevosol/widgets/infinite_list_widget.dart';

enum HrTrainingViewMode {
  hr('HR'),
  trainee('Trainee'),
  trainer('Trainer');

  const HrTrainingViewMode(this.label);
  final String label;
}

class TrainingEventList extends StatefulWidget {
  const TrainingEventList({super.key});

  @override
  State<TrainingEventList> createState() => _TrainingEventListState();
}

class _TrainingEventListState extends State<TrainingEventList> {
  HrTrainingViewMode _selectedView = HrTrainingViewMode.hr;

  void _showAppSnackBar(BuildContext context, String message, Color color) {
    final messenger = ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userRoles = context.user.role ?? [];
    final isTrainee = userRoles.any(
      (r) => r.toString().toLowerCase().trim().contains('trainee'),
    );
    final isHrUser = userRoles.any(
      (r) => r.toString().toLowerCase().trim().contains('hr user'),
    );

    final showScannerView = isHrUser
        ? _selectedView == HrTrainingViewMode.trainee
        : isTrainee;

    return AppPageView2<TraningEventFilterCubit>(
      mode: PageMode2.trainingEvent,
      scaffoldBg: AppIcons.bgFrame4.path,
      backgroundColor: AppColors.event,
      onNew: () async {
        final refresh = await AppRoute.newTrainingEvent.push<bool?>(context);
        if(!context.mounted) return;
        if (refresh == true) fetchInital(context);
      },
      onUpdateQuery: (value) {
        context.cubit<TraningEventFilterCubit>().onSearch(value);
        fetchInital(context);
      },
      onUpdateStatus: (value) {
        context.cubit<TraningEventFilterCubit>().onChangeStatus(value);
        fetchInital(context);
      },
      status: const ['All', 'Draft', 'Submitted'],
      trailingAction: isHrUser
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.event),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<HrTrainingViewMode>(
                  value: _selectedView,
                  isExpanded: false,
                  dropdownColor: AppColors.white,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: HrTrainingViewMode.values
                      .map((mode) => DropdownMenuItem(
                            value: mode,
                            child: Text(mode.label),
                          ))
                      .toList(),
                  onChanged: (mode) {
                    if (mode != null) setState(() => _selectedView = mode);
                  },
                ),
              ),
            )
          : null,
      child: BlocListener<CreateTrainingCubit, CreateTrainingState>(
        listener: (context, state) {
          if (state.isSuccess && state.successMsg.isNotNull) {
            _showAppSnackBar(
                context, state.successMsg.valueOrEmpty, Colors.green);
            context.read<CreateTrainingCubit>().errorHandled();
          }
          if (state.error.isNotNull) {
            _showAppSnackBar(context, state.error!.error, Colors.red);
            context.read<CreateTrainingCubit>().errorHandled();
          }
        },
        child: Builder(
          builder: (innerContext) {
            if (showScannerView) {
              return _TraineeScanResultsView(
                onScanned: (result) => _joinTraining(innerContext, result),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                final filters =
                    innerContext.read<TraningEventFilterCubit>().state;
                await innerContext.read<TrainingEventCubit>().fetchInitial(
                      Pair(
                        StringUtils.docStatusInt(filters.status),
                        filters.query,
                      ),
                    );
              },
              child: InfiniteListViewWidget<TrainingEventCubit, TrainingEvent>(
                childBuilder: (context, entry) => TrainingWidget(
                  gateEntry: entry,
                  onTap: () async {
                    final refresh = await AppRoute.newTrainingEvent
                        .push<bool?>(context, extra: entry);
                        if(!context.mounted) return;
                    if (refresh == true) fetchInital(context);
                  },
                ),
                fetchInitial: () => fetchInital(innerContext),
                fetchMore: () => fetchMore(innerContext),
                emptyListText: 'No Training Event Found',
              ),
            );
          },
        ),
      ),
    );
  }

  void _joinTraining(BuildContext context, String result) {
    $logger.devLog('Join Training triggered for: $result');
    context.read<CreateTrainingCubit>().joinTraining(result);
  }

  void fetchInital(BuildContext context) {
    final filter = context.read<TraningEventFilterCubit>().state;
    context.cubit<TrainingEventCubit>().fetchInitial(
          Pair(StringUtils.docStatusInt(filter.status), filter.query),
        );
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<TraningEventFilterCubit>().state;
    context.cubit<TrainingEventCubit>().fetchMore(
          Pair(StringUtils.docStatusInt(filter.status), filter.query),
        );
  }
}
class _TraineeScanResultsView extends StatelessWidget {
  const _TraineeScanResultsView({required this.onScanned});

  final ValueChanged<String> onScanned;

  Future<void> _openScanner(BuildContext context) async {
      context.read<CreateTrainingCubit>().resetScan();
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const QrScannerPage()),
    );
    if (result != null && result.isNotEmpty) {
      onScanned(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTrainingCubit, CreateTrainingState>(
      builder: (context, state) {
        final events = state.scannedEvents;
        final hasResult = events.isNotEmpty || state.employeeName != null;

        return Stack(
          children: [
            if (state.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (!hasResult)
              _EmptyScanPrompt(onScan: () => _openScanner(context))
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.event.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.event.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.employeeName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Text('Employee : ${state.employeeCode ?? '-'}'),
                          const SizedBox(height: 2),
                          Text('Training Events : ${events.length}'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: events.isEmpty
                        ? const Center(
                            child: Text('No training events found'),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 90),
                            itemCount: events.length,
                            itemBuilder: (_, index) {
                              final event = events[index];
                              return Card(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  title: Text(
                                    event.eventName ?? event.name ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if ((event.trainerName ?? '')
                                            .isNotEmpty)
                                          Text('Trainer : ${event.trainerName}'),
                                        if ((event.location ?? '')
                                            .isNotEmpty)
                                          Text('Location : ${event.location}'),
                                      ],
                                    ),
                                  ),
                                  trailing: Text(
                                    event.eventStatus ?? '',
                                    style: const TextStyle(
                                      color: AppColors.event,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton.extended(
                heroTag: 'scan_fab',
                backgroundColor: AppColors.event,
                foregroundColor: Colors.white,
                icon: const Icon(Icons.qr_code_scanner, size: 20),
                label: Text(hasResult ? 'Scan Again' : 'Scan'),
                onPressed: () => _openScanner(context),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _EmptyScanPrompt extends StatelessWidget {
  const _EmptyScanPrompt({required this.onScan});

  final VoidCallback onScan;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.qr_code_scanner, size: 72, color: AppColors.event),
            const SizedBox(height: 16),
            Text(
              'Scan an Employee QR',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.event,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the scan button below to view an employee\'s training records.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}