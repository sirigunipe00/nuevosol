import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/employee_tracker/data/employee_tracker_repo.dart';
import 'package:nuevosol/features/employee_tracker/model/employee_model.dart';
import 'package:nuevosol/features/employee_tracker/model/qr_code.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/employee_tracker/presentation/bloc/create_employee_cubit/create_employee_cubit.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EmployeeGatePassQRSection extends StatefulWidget {
  const EmployeeGatePassQRSection({super.key});

  @override
  State<EmployeeGatePassQRSection> createState() =>
      _EmployeeGatePassQRSectionState();
}

class _EmployeeGatePassQRSectionState extends State<EmployeeGatePassQRSection> {
  String? _lastFetchedGatePassId;

  void _fetchTrackingIfNeeded(
    BuildContext context,
    String gatePassId,
    String workflowState,
  ) {
    final isOngoing = workflowState == 'movement ongoing';
    final isClosed = workflowState == 'closed';

    if (!(isOngoing || isClosed)) return;
    if (gatePassId.isEmpty) return;

    if (_lastFetchedGatePassId == gatePassId) return;
    _lastFetchedGatePassId = gatePassId;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<EventTrackingCubit>().request(gatePassId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEmployeeCubit, CreateEmployeeState>(
      builder: (context, state) {
        final form = state.form;
        final workflowState = form.workflowState?.toLowerCase().trim() ?? '';

        final isApproved = workflowState == 'approved';
        final isOngoing = workflowState == 'movement ongoing';
        final isClosed = workflowState == 'closed';

        if (!isApproved && !isOngoing && !isClosed) {
          return const SizedBox.shrink();
        }

        final userRoles = context.user.role ?? [];
        // final isHod = userRoles.any(
        //   (r) => r.toString().toLowerCase().contains('hod (hr)'),
        // );
        final isSecurity = userRoles.any((r) {
          final role = r.toString().toLowerCase();
          return role.contains('nepl-unit-1-gate') ||
              role.contains('nepl-unit-2-gate') ||
              role.contains('nmpl-unit-1-gate') ||
              role.contains('nmpl-unit-2-gate') ||
              role.contains('head office gate');
        });

        // if (!isHod && !isSecurity) return const SizedBox.shrink();

        final gatePassId = form.name ?? '';

        _fetchTrackingIfNeeded(context, gatePassId, workflowState);

        return Container(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 5,
          ),
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E0),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.registration.withValues(alpha: 0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.qr_code_2_rounded,
                    color: AppColors.registration,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Movement Tracking',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  _WorkflowBadge(workflowState: workflowState),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                gatePassId,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(height: 10),

              if (isOngoing || isClosed) _EventTrackingSection(form: form),

              if ((isApproved || isOngoing) && !isSecurity)
                _SingleQRCard(gatePassId: gatePassId),

              if (isSecurity && !isClosed)
                _SecurityScannerSection(gatePassId: gatePassId),

              if (isClosed)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_rounded,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Gate Pass closed — all scans complete',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _WorkflowBadge extends StatelessWidget {
  const _WorkflowBadge({required this.workflowState});
  final String workflowState;

  @override
  Widget build(BuildContext context) {
    final Color bg, border, text;
    final String label;

    switch (workflowState) {
      case 'movement ongoing':
        bg = Colors.orange.shade50;
        border = Colors.orange.shade200;
        text = Colors.orange.shade700;
        label = 'Ongoing';
        break;
      case 'closed':
        bg = Colors.grey.shade100;
        border = Colors.grey.shade300;
        text = Colors.grey.shade700;
        label = 'Closed';
        break;
      default: // approved
        bg = Colors.green.shade50;
        border = Colors.green.shade200;
        text = Colors.green.shade700;
        label = 'Approved';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: text,
        ),
      ),
    );
  }
}

class _EventTrackingSection extends StatelessWidget {
  const _EventTrackingSection({required this.form});
  final EmployeeTracker form;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventTrackingCubit, EventTrackingState>(
      builder: (_, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading:
              () => const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Center(child: CircularProgressIndicator()),
              ),
          success: (items) {
            if (items.isEmpty) return const SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.track_changes_rounded,
                      color: AppColors.registration,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Event Tracking',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                ...items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final trackingStatus = switch (index) {
                    0 => form.status1,
                    1 => form.status1,
                    2 => form.status2,
                    3 => form.status2,
                    _ => null,
                  };
                  final hasActual =
                      item.actualDateTime != null &&
                      item.actualDateTime!.trim().isNotEmpty;
                  final hasExpected =
                      item.expectedDateTime != null &&
                      item.expectedDateTime!.trim().isNotEmpty;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color:
                          hasActual
                              ? Colors.orange.shade50
                              : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            hasActual
                                ? Colors.orange.shade200
                                : Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                hasActual
                                    ? AppColors.registration
                                    : Colors.grey.shade300,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color:
                                    hasActual
                                        ? Colors.white
                                        : Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  if (item.activity != null)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            item.activity == 'Exit'
                                                ? Colors.red.shade50
                                                : Colors.green.shade50,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        item.activity!,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              item.activity == 'Exit'
                                                  ? Colors.red.shade700
                                                  : Colors.green.shade700,
                                        ),
                                      ),
                                    ),

                                  const SizedBox(width: 8),

                                  if (item.location != null)
                                    Expanded(
                                      child: Text(
                                        item.location!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                    ),
                                  const SizedBox(width: 6),

                                  if (trackingStatus != null &&
                                      trackingStatus.trim().isNotEmpty) ...[
                                    const SizedBox(width: 6),
                                    _StatusBadge(status: trackingStatus),
                                  ],
                                ],
                              ),

                              const SizedBox(height: 6),
                              Text(
                                hasExpected ? 'Expected  Date & Time' : '',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      hasExpected
                                          ? Colors.black
                                          : Colors.grey.shade400,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                hasExpected
                                    ? DFU.ddMMyyyyHHmmssFromStr(
                                      item.expectedDateTime!,
                                    )
                                    : '--',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      hasExpected
                                          ? Colors.black
                                          : Colors.grey.shade400,
                                ),
                              ),

                              Text(
                                hasActual
                                    ? 'Actual Date & Time'
                                    : 'Pending Scan',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      hasActual
                                          ? Colors.orange.shade700
                                          : Colors.grey.shade400,
                                ),
                              ),

                              const SizedBox(height: 3),

                              Text(
                                hasActual
                                    ? DFU.ddMMyyyyHHmmssFromStr(
                                      item.actualDateTime!,
                                    )
                                    : '--',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      hasActual
                                          ? Colors.orange.shade900
                                          : Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(
                          hasActual
                              ? Icons.check_circle_rounded
                              : Icons.radio_button_unchecked,
                          color:
                              hasActual
                                  ? Colors.green.shade500
                                  : Colors.grey.shade300,
                          size: 22,
                        ),
                      ],
                    ),
                  );
                }),

                // const SizedBox(height: 5),
              ],
            );
          },
        );
      },
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final value = status.toLowerCase().trim();

    Color bgColor;
    Color textColor;
    IconData icon;

    if (value.contains('late')) {
      bgColor = Colors.red.shade50;
      textColor = Colors.red.shade700;
      icon = Icons.warning_amber_rounded;
    } else if (value.contains('before')) {
      bgColor = Colors.orange.shade50;
      textColor = Colors.orange.shade700;
      icon = Icons.check_circle_outline_rounded;
    } else {
      // on time
      bgColor = Colors.green.shade50;
      textColor = Colors.green.shade700;
      icon = Icons.access_time_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: textColor),
          const SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _SingleQRCard extends StatelessWidget {
  const _SingleQRCard({required this.gatePassId});
  final String gatePassId;

  @override
  Widget build(BuildContext context) {
    if (gatePassId.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Text(
          'Gate Pass ID not available.',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Show this to Security',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 12),
            QrImageView(
              data: gatePassId,
              version: QrVersions.auto,
              size: 180,
              backgroundColor: Colors.white,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: AppColors.registration,
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              gatePassId,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecurityScannerSection extends StatefulWidget {
  const _SecurityScannerSection({required this.gatePassId});
  final String gatePassId;

  @override
  State<_SecurityScannerSection> createState() =>
      _SecurityScannerSectionState();
}

class _SecurityScannerSectionState extends State<_SecurityScannerSection> {
  final List<QrCodeModel> _scanHistory = [];
  bool _allDone = false;

  QrCodeModel? get _lastResult =>
      _scanHistory.isNotEmpty ? _scanHistory.last : null;

  void _onScanComplete(QrCodeModel result) {
    setState(() {
      _scanHistory.add(result);
      _allDone = result.completed == true;
    });
  }

  void _openScanner(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (_) => _QRScannerSheet(
            onScanComplete: _onScanComplete,
            onDone: () {
              context.read<EventTrackingCubit>().request(widget.gatePassId);
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final actualExitDateTime = _lastResult?.actualDateTime;

    final scanNo = _lastResult?.scanNo ?? 0;
    final totalScans = _lastResult?.totalScans ?? 0;
    final showProgress = totalScans > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (actualExitDateTime != null &&
            actualExitDateTime.toString().isNotEmpty) ...[
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.login_rounded,
                  size: 18,
                  color: Colors.orange.shade700,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Actual Exit Date & Time',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange.shade700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      DFU.ddMMyyyyHHmmssFromStr(actualExitDateTime.toString()),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.orange.shade900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],

        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.shade100),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 18,
                color: Colors.blue.shade600,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Ask the employee to show their Gate Pass QR, then scan below.',
                  style: TextStyle(fontSize: 12.5, color: Colors.blue.shade700),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        if (showProgress) ...[
          Text(
            'Scan progress  ($scanNo / $totalScans)',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(totalScans, (i) {
              final s = i + 1;
              final done = s <= scanNo;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: done ? Colors.green.shade50 : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: done ? Colors.green.shade300 : Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      done
                          ? Icons.check_circle_rounded
                          : Icons.radio_button_unchecked,
                      size: 14,
                      color:
                          done ? Colors.green.shade600 : Colors.grey.shade400,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Scan $s',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color:
                            done ? Colors.green.shade700 : Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
        ],

        if (_scanHistory.isNotEmpty) ...[
          ..._scanHistory.asMap().entries.map((entry) {
            final idx = entry.key;
            final result = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _ScanResultSummary(
                result: result,
                scanLabel: 'Scan ${idx + 1}',
              ),
            );
          }),
          const SizedBox(height: 8),
        ],

        if (_allDone) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.verified_rounded,
                  color: Colors.green.shade600,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  'All scans complete — Gate Pass closed',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
          ),
        ] else ...[
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _openScanner(context),
              icon: const Icon(Icons.qr_code_scanner_rounded),
              label: const Text('Scan Gate Pass QR'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.registration,
                side: const BorderSide(color: AppColors.registration),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ScanResultSummary extends StatelessWidget {
  const _ScanResultSummary({required this.result, this.scanLabel});
  final QrCodeModel result;
  final String? scanLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            scanLabel ?? 'Last Scan',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 8),
          if (result.activity != null)
            _Row(label: 'Activity', value: result.activity!),
          if (result.location != null)
            _Row(label: 'Location', value: result.location!),
          if (result.actualDateTime != null)
            _Row(label: 'Time', value: result.actualDateTime!),
          if (result.durationMin != null)
            _Row(label: 'Duration', value: '${result.durationMin} min'),
          if (result.scanNo != null && result.totalScans != null)
            _Row(
              label: 'Scan',
              value: '${result.scanNo} / ${result.totalScans}',
              valueColor: AppColors.registration,
            ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value, this.valueColor});
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: valueColor ?? Colors.black87,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

enum _ScanStep { scanQR, capturePhoto, result }

class _QRScannerSheet extends StatefulWidget {
  const _QRScannerSheet({required this.onScanComplete, required this.onDone});

  final void Function(QrCodeModel result) onScanComplete;
  final VoidCallback onDone;

  @override
  State<_QRScannerSheet> createState() => _QRScannerSheetState();
}
class _QRScannerSheetState extends State<_QRScannerSheet> {
  _ScanStep _step = _ScanStep.scanQR;

  final MobileScannerController _qrController = MobileScannerController();

  String? _scannedGatePassId;
  bool _capturePhotoOption = false;

  CameraController? _cameraController;
  bool _cameraReady = false;
  bool _capturing = false;
  String? _photoPath;

  QrCodeModel? _apiResult;
  bool _isSubmitting = false;
  String? _errorMsg;

  @override
  void dispose() {
    _qrController.dispose();
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _onQRDetect(BarcodeCapture capture) async {
    if (_step != _ScanStep.scanQR) return;

    final barcode = capture.barcodes.firstOrNull;
    if (barcode?.rawValue == null) return;

    _qrController.stop();

    final gatePassId = barcode!.rawValue!;
    bool wantsPhoto = false;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('QR Scanned Successfully'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Scanned Gate Pass'),
                  const SizedBox(height: 10),
                  Text(
                    gatePassId,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      setDialogState(() => wantsPhoto = !wantsPhoto);
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Checkbox(
                            value: wantsPhoto,
                            activeColor: AppColors.registration,
                            onChanged: (val) {
                              setDialogState(() => wantsPhoto = val ?? false);
                            },
                          ),
                          const Expanded(
                            child: Text(
                              'Capture employee photo for verification',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );

    if (!mounted) return;

    setState(() {
      _scannedGatePassId = gatePassId;
      _capturePhotoOption = wantsPhoto;
    });

    if (wantsPhoto) {
      setState(() => _step = _ScanStep.capturePhoto);
      await _initCamera();
    } else {
      await _submitToApi(photoPath: null);
    }
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      await _submitToApi(photoPath: null);
      return;
    }
    final camera = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.back,
      orElse: () => cameras.first,
    );
    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    try {
      await _cameraController!.initialize();
      if (mounted) setState(() => _cameraReady = true);
    } catch (e) {
      debugPrint('Camera init error: $e');
      await _submitToApi(photoPath: null);
    }
  }

  Future<void> _capturePhoto() async {
    if (_cameraController == null || !_cameraReady || _capturing) return;
    setState(() => _capturing = true);
    try {
      final file = await _cameraController!.takePicture();
      _cameraController?.dispose();
      _cameraController = null;
      setState(() {
        _photoPath = file.path;
        _capturing = false;
      });
      await _submitToApi(photoPath: file.path);
    } catch (e) {
      debugPrint('Photo capture error: $e');
      setState(() => _capturing = false);
      await _submitToApi(photoPath: null);
    }
  }

  void _skipPhoto() {
    _cameraController?.dispose();
    _cameraController = null;
    setState(() => _cameraReady = false);
    _submitToApi(photoPath: null);
  }
// class _QRScannerSheetState extends State<_QRScannerSheet> {
//   _ScanStep _step = _ScanStep.scanQR;

//   final MobileScannerController _qrController = MobileScannerController();

//   String? _scannedGatePassId;

//   CameraController? _cameraController;
//   bool _cameraReady = false;
//   bool _capturing = false;
//   String? _photoPath;

//   QrCodeModel? _apiResult;
//   bool _isSubmitting = false;
//   String? _errorMsg;

//   @override
//   void dispose() {
//     _qrController.dispose();
//     _cameraController?.dispose();
//     super.dispose();
//   }

//   // void _onQRDetect(BarcodeCapture capture) {
//   //   if (_step != _ScanStep.scanQR) return;
//   //   final barcode = capture.barcodes.firstOrNull;
//   //   if (barcode?.rawValue == null) return;

//   //   _qrController.stop();

//   //   setState(() {
//   //     _scannedGatePassId = barcode!.rawValue;
//   //     _step = _ScanStep.capturePhoto;
//   //   });
//   //   _initCamera();
//   // }
//   Future<void> _onQRDetect(BarcodeCapture capture) async {
//     if (_step != _ScanStep.scanQR) return;

//     final barcode = capture.barcodes.firstOrNull;
//     if (barcode?.rawValue == null) return;

//     _qrController.stop();

//     final gatePassId = barcode!.rawValue!;

//     await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder:
//           (dialogContext) => AlertDialog(
//             title: const Text('QR Scanned Successfully'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('Scanned Gate Pass'),
//                 const SizedBox(height: 10),
//                 Text(
//                   gatePassId,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(dialogContext),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//     );

//     if (!mounted) return;

//     setState(() {
//       _scannedGatePassId = gatePassId;
//       _step = _ScanStep.capturePhoto;
//     });

//     await _initCamera();
//   }

//   Future<void> _initCamera() async {
//     final cameras = await availableCameras();
//     if (cameras.isEmpty) {
//       await _submitToApi(photoPath: null);
//       return;
//     }
//     final camera = cameras.firstWhere(
//       (c) => c.lensDirection == CameraLensDirection.back,
//       orElse: () => cameras.first,
//     );
//     _cameraController = CameraController(
//       camera,
//       ResolutionPreset.high,
//       enableAudio: false,
//     );
//     try {
//       await _cameraController!.initialize();
//       if (mounted) setState(() => _cameraReady = true);
//     } catch (e) {
//       debugPrint('Camera init error: $e');
//       await _submitToApi(photoPath: null);
//     }
//   }

//   Future<void> _capturePhoto() async {
//     if (_cameraController == null || !_cameraReady || _capturing) return;
//     setState(() => _capturing = true);
//     try {
//       final file = await _cameraController!.takePicture();
//       _cameraController?.dispose();
//       _cameraController = null;
//       setState(() {
//         _photoPath = file.path;
//         _capturing = false;
//       });
//       await _submitToApi(photoPath: file.path);
//     } catch (e) {
//       debugPrint('Photo capture error: $e');
//       setState(() => _capturing = false);
//       await _submitToApi(photoPath: null);
//     }
//   }

//   void _skipPhoto() {
//     _cameraController?.dispose();
//     _cameraController = null;
//     setState(() => _cameraReady = false);
//     _submitToApi(photoPath: null);
//   }

  Future<void> _submitToApi({required String? photoPath}) async {
    if (_scannedGatePassId == null) return;

    String photoBase64 = '';
    if (photoPath != null) {
      try {
        final bytes = await File(photoPath).readAsBytes();
        photoBase64 = base64Encode(bytes);
      } catch (e) {
        debugPrint('Photo encode error: $e');
      }
    }

    setState(() {
      _isSubmitting = true;
      _step = _ScanStep.result;
    });

    try {
      final result = await $sl<EmployeeRepo>().qrData(
        _scannedGatePassId!,
        DateTime.now().toIso8601String(),
        photoBase64,
      );

      result.fold(
        (failure) => setState(() {
          _errorMsg = failure.error;
          _isSubmitting = false;
        }),
        (qrCode) => _handleSuccess(qrCode),
      );
    } catch (e) {
      setState(() {
        _errorMsg = e.toString();
        _isSubmitting = false;
      });
    }
  }

  void _handleSuccess(QrCodeModel result) async {
    setState(() {
      _apiResult = result;
      _isSubmitting = false;
    });

    widget.onScanComplete(result);

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (dialogContext) => AlertDialog(
            title: const Text('Gate Pass Verified'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(result.message ?? 'Verification Successful'),
                const SizedBox(height: 12),

                Text(
                  'Gate Pass ID: ${result.gatePassId ?? ''}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder:
          (_, __) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 16),
                // _StepIndicator(current: _step),
                _StepIndicator(current: _step, hasError: _errorMsg != null),
                const SizedBox(height: 16),

                // Text(
                //   _step == _ScanStep.scanQR
                //       ? 'Scan Gate Pass QR'
                //       : _step == _ScanStep.capturePhoto
                //       ? 'Capture Employee Photo'
                //       : 'Verification Complete',
                //   style: const TextStyle(
                //     fontSize: 17,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                // const SizedBox(height: 4),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 32),
                //   child: Text(
                //     _step == _ScanStep.scanQR
                //         ? 'Point camera at the QR code shown by the employee'
                //         : _step == _ScanStep.capturePhoto
                //         ? 'Take a photo of the employee for verification'
                //         : 'QR scanned and submitted successfully',
                //     style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                Text(
  _step == _ScanStep.scanQR
      ? 'Scan Gate Pass QR'
      : _step == _ScanStep.capturePhoto
      ? 'Capture Employee Photo'
      : _isSubmitting
      ? 'Verifying...'
      : _errorMsg != null
      ? 'Verification Failed'
      : 'Verification Complete',
  style: const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
  ),
),
const SizedBox(height: 4),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 32),
  child: Text(
    _step == _ScanStep.scanQR
        ? 'Point camera at the QR code shown by the employee'
        : _step == _ScanStep.capturePhoto
        ? 'Take a photo of the employee for verification'
        : _isSubmitting
        ? 'Submitting scan details...'
        : _errorMsg != null
        ? _errorMsg!
        : 'QR scanned and submitted successfully',
    style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
    textAlign: TextAlign.center,
  ),
),
                const SizedBox(height: 16),

                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _buildStepBody(),
                  ),
                ),

                _buildBottomActions(),
              ],
            ),
          ),
    );
  }

  Widget _buildStepBody() {
    switch (_step) {
      case _ScanStep.scanQR:
        return _QRScannerBody(controller: _qrController, onDetect: _onQRDetect);

      case _ScanStep.capturePhoto:
        return _CameraPreviewBody(
          cameraController: _cameraController,
          cameraReady: _cameraReady,
          capturing: _capturing,
          onCapture: _capturePhoto,
          onSkip: _skipPhoto,
        );

      case _ScanStep.result:
        return _VerificationResult(
          gatePassId: _scannedGatePassId ?? '',
          photoPath: _photoPath,
          apiResult: _apiResult,
          isLoading: _isSubmitting,
          errorMsg: _errorMsg,
        );
    }
  }

  Widget _buildBottomActions() {
    if (_step != _ScanStep.result) {
      return const SizedBox.shrink();
    }

    if (_isSubmitting) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_step == _ScanStep.result && !_isSubmitting) ...[
            if (_apiResult != null && _apiResult!.completed != true) ...[
              const SizedBox(height: 8),
            ],
          ],
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                widget.onDone();

                Navigator.pop(context);
                Navigator.pop(context, true);
              },
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.registration,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}

class _VerificationResult extends StatelessWidget {
  const _VerificationResult({
    required this.gatePassId,
    required this.isLoading,
    this.photoPath,
    this.apiResult,
    this.errorMsg,
  });

  final String gatePassId;
  final String? photoPath;
  final QrCodeModel? apiResult;
  final bool isLoading;
  final String? errorMsg;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          if (isLoading)
            Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
          else if (errorMsg != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline_rounded, color: Colors.red.shade600),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      errorMsg!,
                      style: TextStyle(color: Colors.red.shade700),
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green.shade600,
                    size: 48,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'QR Verified',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _ResultRow(label: 'Gate Pass', value: gatePassId),
                  if (apiResult != null) ...[
                    if (apiResult!.activity != null)
                      _ResultRow(
                        label: 'Activity',
                        value: apiResult!.activity!,
                      ),
                    if (apiResult!.location != null)
                      _ResultRow(
                        label: 'Location',
                        value: apiResult!.location!,
                      ),
                    if (apiResult!.actualDateTime != null)
                      _ResultRow(
                        label: 'Time',
                        value: apiResult!.actualDateTime!,
                      ),
                    if (apiResult!.durationMin != null)
                      _ResultRow(
                        label: 'Duration',
                        value: '${apiResult!.durationMin} min',
                      ),
                    if (apiResult!.scanNo != null &&
                        apiResult!.totalScans != null)
                      _ResultRow(
                        label: 'Scan',
                        value:
                            '${apiResult!.scanNo} / ${apiResult!.totalScans}',
                        valueColor: AppColors.registration,
                      ),
                    if (apiResult!.completed == true)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Gate Pass Complete',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.green.shade800,
                            ),
                          ),
                        ),
                      ),
                  ],
                ],
              ),
            ),

          const SizedBox(height: 16),

          if (photoPath != null) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person_rounded,
                        color: AppColors.registration,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Employee Photo',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Text(
                          'Captured',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(photoPath!),
                      width: double.infinity,
                      height: 260,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.camera_alt_outlined, color: Colors.grey.shade400),
                  const SizedBox(width: 10),
                  Text(
                    'No photo captured',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// class _StepIndicator extends StatelessWidget {
//   const _StepIndicator({required this.current});
//   final _ScanStep current;

//   @override
//   Widget build(BuildContext context) {
//     final steps = [
//       (_ScanStep.scanQR, Icons.qr_code_scanner_rounded, 'Scan QR'),
//       (_ScanStep.capturePhoto, Icons.camera_alt_rounded, 'Photo'),
//       (_ScanStep.result, Icons.verified_rounded, 'Verified'),
//     ];
//     final currentIndex = _ScanStep.values.indexOf(current);

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(steps.length * 2 - 1, (i) {
//         if (i.isOdd) {
//           final filled = currentIndex > i ~/ 2;
//           return Container(
//             width: 40,
//             height: 2,
//             color: filled ? AppColors.registration : Colors.grey.shade200,
//           );
//         }
//         final idx = i ~/ 2;
//         final (step, icon, label) = steps[idx];
//         final isDone = currentIndex > idx;
//         final isCurrent = current == step;

//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 250),
//               width: 36,
//               height: 36,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color:
//                     isDone || isCurrent
//                         ? AppColors.registration
//                         : Colors.grey.shade100,
//                 border: Border.all(
//                   color:
//                       isDone || isCurrent
//                           ? AppColors.registration
//                           : Colors.grey.shade300,
//                 ),
//               ),
//               child: Icon(
//                 isDone ? Icons.check_rounded : icon,
//                 size: 18,
//                 color:
//                     isDone || isCurrent ? Colors.white : Colors.grey.shade400,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 10,
//                 fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w400,
//                 color:
//                     isCurrent ? AppColors.registration : Colors.grey.shade400,
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.current, this.hasError = false});
  final _ScanStep current;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final steps = [
      (_ScanStep.scanQR, Icons.qr_code_scanner_rounded, 'Scan QR'),
      (_ScanStep.capturePhoto, Icons.camera_alt_rounded, 'Photo'),
      (_ScanStep.result, hasError ? Icons.error_rounded : Icons.verified_rounded, hasError ? 'Failed' : 'Verified'),
    ];
    final currentIndex = _ScanStep.values.indexOf(current);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(steps.length * 2 - 1, (i) {
        if (i.isOdd) {
          final filled = currentIndex > i ~/ 2;
          return Container(
            width: 40,
            height: 2,
            color: filled ? AppColors.registration : Colors.grey.shade200,
          );
        }
        final idx = i ~/ 2;
        final (step, icon, label) = steps[idx];
        final isDone = currentIndex > idx;
        final isCurrent = current == step;
        final isErrorStep = isCurrent && step == _ScanStep.result && hasError;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isErrorStep
                    ? Colors.red
                    : (isDone || isCurrent
                        ? AppColors.registration
                        : Colors.grey.shade100),
                border: Border.all(
                  color: isErrorStep
                      ? Colors.red
                      : (isDone || isCurrent
                          ? AppColors.registration
                          : Colors.grey.shade300),
                ),
              ),
              child: Icon(
                isErrorStep ? Icons.close_rounded : (isDone ? Icons.check_rounded : icon),
                size: 18,
                color: (isDone || isCurrent) ? Colors.white : Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w400,
                color: isErrorStep
                    ? Colors.red
                    : (isCurrent ? AppColors.registration : Colors.grey.shade400),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _QRScannerBody extends StatelessWidget {
  const _QRScannerBody({required this.controller, required this.onDetect});
  final MobileScannerController controller;
  final void Function(BarcodeCapture) onDetect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            MobileScanner(controller: controller, onDetect: onDetect),
            const Positioned.fill(child: Center(child: _ScanOverlay())),
          ],
        ),
      ),
    );
  }
}

class _CameraPreviewBody extends StatelessWidget {
  const _CameraPreviewBody({
    required this.cameraController,
    required this.cameraReady,
    required this.capturing,
    required this.onCapture,
    required this.onSkip,
  });
  final CameraController? cameraController;
  final bool cameraReady;
  final bool capturing;
  final VoidCallback onCapture;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child:
                  cameraReady && cameraController != null
                      ? Stack(
                        fit: StackFit.expand,
                        children: [
                          CameraPreview(cameraController!),
                          Center(
                            child: Container(
                              width: 180,
                              height: 220,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.registration.withValues(alpha:
                                    0.8,
                                  ),
                                  width: 2.5,
                                ),
                                borderRadius: BorderRadius.circular(110),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'Align face within the oval',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      : Container(
                        color: Colors.black,
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: onCapture,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: capturing ? Colors.grey.shade300 : Colors.white,
                    border: Border.all(color: AppColors.registration, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.registration.withValues(alpha:0.25),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child:
                      capturing
                          ? const Padding(
                            padding: EdgeInsets.all(18),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                          : const Icon(
                            Icons.camera_alt_rounded,
                            color: AppColors.registration,
                            size: 30,
                          ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _ResultRow extends StatelessWidget {
  const _ResultRow({required this.label, required this.value, this.valueColor});
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: valueColor ?? Colors.black87,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanOverlay extends StatelessWidget {
  const _ScanOverlay();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 220,
        height: 220,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.registration, width: 2.5),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
