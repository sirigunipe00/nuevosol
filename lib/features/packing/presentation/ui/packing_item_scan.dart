import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/packing/model/bom_items.dart';
import 'package:nuevosol/features/packing/model/component_scanning_data.dart';
import 'package:nuevosol/features/packing/model/packing_model.dart';
import 'package:nuevosol/features/packing/model/packing_quality_args.dart';
import 'package:nuevosol/features/packing/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/buttons/app_btn.dart';
import 'package:nuevosol/widgets/dailogs/app_dialogs.dart';
import 'package:nuevosol/widgets/spaced_column.dart';
import 'package:nuevosol/widgets/title_status_app_bar.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class PackingItemScanScrn extends StatefulWidget {
  const PackingItemScanScrn({super.key, required this.packing});

  final PackingModel packing;

  @override
  State<PackingItemScanScrn> createState() => _PackingItemScanScrnState();
}

class _PackingItemScanScrnState extends State<PackingItemScanScrn> {
  late PackingModel _packing;

  @override
  void initState() {
    super.initState();
    _packing = widget.packing;
  }

  @override
  Widget build(BuildContext context) {
    final status = _packing.docstatus ?? 0;
    final name = _packing.name.valueOrEmpty;

    return Scaffold(
      appBar:
          TitleStatusAppBar(
                title: 'Item Scanning',
                docNo: name,
                status: StringUtils.docStatus(status),
                textColor: AppColors.packing,
              )
              as PreferredSizeWidget,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: SpacedColumn(
            defaultHeight: 12,
            children: [
              _PackingScanHeader(packing: _packing),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Scan Items',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              BlocBuilder<BomItemsCubit, BomItemsState>(
                builder: (_, bomState) {
                  return BlocBuilder<
                    ComponentScanningCubit,
                    ComponentScanningState
                  >(
                    builder: (_, scanState) {
                      final isLoading =
                          bomState.isLoading || scanState.isLoading;
                      if (isLoading) {
                        return const Padding(
                          padding: EdgeInsets.all(24),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final bomError = bomState.maybeWhen(
                        failure: (f) => f.error,
                        orElse: () => null,
                      );
                      if (bomError != null) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            bomError,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }

                      final items = bomState.maybeWhen(
                        success: (data) => data,
                        orElse: () => <BomItems>[],
                      );
                      if (items.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(24),
                          child: Center(child: Text('No BOM items found')),
                        );
                      }

                      final existingScans = scanState.maybeWhen(
                        success: (data) => data,
                        orElse: () => <ComponentScanningData>[],
                      );

                      return _BomItemsScanTable(
                        items: items,
                        packing: _packing,
                        existingScans: existingScans,
                      );
                    },
                  );
                },
              ),
              AppSpacer.p12(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PackingScanHeader extends StatelessWidget {
  const _PackingScanHeader({required this.packing});

  final PackingModel packing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _headerRow('Process', packing.selectProcess ?? '-'),
          const Divider(height: 16),
          _headerRow('Item', packing.rawMaterialName ?? '-'),
          const Divider(height: 16),
          _headerRow(
            'Qty',
            packing.bomQtyItem == null ? '-' : packing.bomQtyItem.toString(),
          ),
          const Divider(height: 16),
          _headerRow(
            'Ok Qty',
            packing.okQty == null ? '-' : packing.okQty.toString(),
          ),
        ],
      ),
    );
  }

  Widget _headerRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
        const Text(':  '),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
          ),
        ),
      ],
    );
  }
}

class _ScanRowData {
  _ScanRowData({required this.item, required this.scanNo});

  final BomItems item;
  final int scanNo;
  String scannedValue = '';
  bool isSuccess = false;
  bool isLoading = false;
  int? remainingScans;
  final TextEditingController controller = TextEditingController();

  void dispose() => controller.dispose();
}

class _BomItemsScanTable extends StatefulWidget {
  const _BomItemsScanTable({
    required this.items,
    required this.packing,
    required this.existingScans,
  });

  final List<BomItems> items;
  final PackingModel packing;
  final List<ComponentScanningData> existingScans;

  @override
  State<_BomItemsScanTable> createState() => _BomItemsScanTableState();
}

class _BomItemsScanTableState extends State<_BomItemsScanTable> {
  late final List<_ScanRowData> _scanRows;
  bool _isSubmitting = false;
  bool _isSubmitted = false;
  bool _isCreatingInspection = false;
  bool _isLoadingInspectionLot = false;
  String? _existingInspectionLotId;

  @override
  void initState() {
    super.initState();
    _scanRows = _buildScanRows(widget.items, widget.existingScans);
    _isSubmitted = (widget.packing.docstatus ?? 0) >= 1;
    if (_isSubmitted) {
      _loadExistingInspectionLot();
    }
  }

  Future<void> _loadExistingInspectionLot() async {
    final productionPosting = widget.packing.name ?? '';
    if (productionPosting.isEmpty) return;

    setState(() => _isLoadingInspectionLot = true);
    final response = await PackingBlocProvider.get().repo.fetchInspectionLotId(
      productionPosting,
    );
    if (!mounted) return;

    response.fold(
      (_) {
        setState(() => _isLoadingInspectionLot = false);
      },
      (lotId) {
        setState(() {
          _isLoadingInspectionLot = false;
          _existingInspectionLotId =
              (lotId != null && lotId.trim().isNotEmpty) ? lotId.trim() : null;
        });
      },
    );
  }

  @override
  void didUpdateWidget(covariant _BomItemsScanTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items ||
        oldWidget.existingScans != widget.existingScans) {
      for (final row in _scanRows) {
        row.dispose();
      }
      _scanRows
        ..clear()
        ..addAll(_buildScanRows(widget.items, widget.existingScans));
    }
  }

  List<_ScanRowData> _buildScanRows(
    List<BomItems> items,
    List<ComponentScanningData> existingScans,
  ) {
    final rows = <_ScanRowData>[];
    final scansByItem = <String, List<ComponentScanningData>>{};

    for (final scan in existingScans) {
      final itemCode = (scan.item ?? '').trim().toLowerCase();
      if (itemCode.isEmpty) continue;
      scansByItem.putIfAbsent(itemCode, () => []).add(scan);
    }

    for (final item in items) {
      final scanCount = (item.customNoOfScan ?? 0).round();
      if (scanCount <= 0) continue;

      final itemCode = (item.itemCode ?? '').trim();
      final savedScans = List<ComponentScanningData>.from(
        scansByItem[itemCode.toLowerCase()] ?? const [],
      );
      final remainingForItem = (scanCount - savedScans.length).clamp(
        0,
        scanCount,
      );

      for (var i = 1; i <= scanCount; i++) {
        final row = _ScanRowData(item: item, scanNo: i);
        final savedIndex = i - 1;
        if (savedIndex < savedScans.length) {
          final saved = savedScans[savedIndex];
          row.scannedValue = saved.scannedValue ?? '';
          row.controller.text = row.scannedValue;
          row.isSuccess = true;
          row.remainingScans = remainingForItem;
        }
        rows.add(row);
      }
    }

    return _sortPendingFirst(rows);
  }

  List<_ScanRowData> _sortPendingFirst(List<_ScanRowData> rows) {
    final pending = rows.where((r) => !r.isSuccess).toList();
    final scanned = rows.where((r) => r.isSuccess).toList();
    return [...pending, ...scanned];
  }

  @override
  void dispose() {
    for (final row in _scanRows) {
      row.dispose();
    }
    super.dispose();
  }

  Future<void> _scanForRow(_ScanRowData row) async {
    if (row.isSuccess || row.isLoading) return;

    final scanResult = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => SimpleBarcodeScannerPage(
              scanType: ScanType.barcode,
              appBarTitle:
                  'Scan ${row.item.itemCode ?? 'Item'} (${row.scanNo})',
              isShowFlashIcon: true,
            ),
      ),
    );

    if (scanResult == null || !mounted) return;
    final scannedValue = scanResult.toString().trim();
    if (scannedValue.isEmpty) return;

    setState(() {
      row.scannedValue = scannedValue;
      row.controller.text = scannedValue;
      row.isLoading = true;
    });

    await _submitScan(row, scannedValue);
  }

  Future<void> _submitScan(_ScanRowData row, String scannedValue) async {
    final response = await PackingBlocProvider.get().repo.packingQrScanning(
      productionPosting: widget.packing.name ?? '',
      bom: widget.packing.bomItem ?? '',
      item: row.item.itemCode ?? '',
      scannedValue: scannedValue,
    );

    if (!mounted) return;

    response.fold(
      (failure) async {
        setState(() {
          row
            ..isLoading = false
            ..isSuccess = false;
        });
        if (!mounted) return;
        await AppDialog.showErrorDialog(
          context,
          title: failure.title ?? 'Scan Error',
          content: failure.error,
          onTapDismiss: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
        if (!mounted) return;
        setState(() {
          row
            ..scannedValue = ''
            ..controller.clear();
        });
      },
      (result) async {
        setState(() {
          row
            ..isLoading = false
            ..isSuccess = true
            ..remainingScans = result.remainingScans;

          final itemCode = row.item.itemCode ?? '';
          for (final other in _scanRows) {
            if (other.item.itemCode == itemCode && other.isSuccess) {
              other.remainingScans = result.remainingScans;
            }
          }

          final sorted = _sortPendingFirst(_scanRows);
          _scanRows
            ..clear()
            ..addAll(sorted);
        });

        if (!mounted) return;
        await AppDialog.showSuccessDialog(
          context,
          title: 'Success',
          content: result.dialogContent(isSuccess: true),
          onTapDismiss: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        );

        if (!mounted) return;
        context.read<ComponentScanningCubit>().request(
          widget.packing.name ?? '',
        );
      },
    );
  }

  Future<void> _submitPacking() async {
    if (_isSubmitting || _isSubmitted) return;

    final name = widget.packing.name ?? '';
    if (name.isEmpty) {
      await AppDialog.showErrorDialog(
        context,
        title: 'Error',
        content: 'Packing document name is missing',
        onTapDismiss: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      );
      return;
    }

    setState(() => _isSubmitting = true);

    final response = await PackingBlocProvider.get().repo.submitPacking(name);

    if (!mounted) return;

    await response.fold(
      (failure) async {
        setState(() => _isSubmitting = false);
        if (!mounted) return;
        await AppDialog.showErrorDialog(
          context,
          title: failure.title ?? 'Submit Error',
          content: failure.error,
          onTapDismiss: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
      },
      (result) async {
        setState(() {
          _isSubmitting = false;
          _isSubmitted = true;
        });
        if (!mounted) return;
        await AppDialog.showSuccessDialog(
          context,
          title: 'Success',
          content: result.first.isNotEmpty
              ? result.first
              : 'Packing submitted successfully',
          onTapDismiss: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
      },
    );
  }

  Future<void> _createQualityInspection() async {
    if (_isCreatingInspection) return;

    final productionPosting = widget.packing.name ?? '';
    if (productionPosting.isEmpty) {
      await AppDialog.showErrorDialog(
        context,
        title: 'Error',
        content: 'Packing document name is missing',
        onTapDismiss: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      );
      return;
    }

    setState(() => _isCreatingInspection = true);

    final response = await PackingBlocProvider.get().repo.createInspectionLot(
      productionPosting,
    );

    if (!mounted) return;

    await response.fold(
      (failure) async {
        setState(() => _isCreatingInspection = false);
        if (!mounted) return;
        await AppDialog.showErrorDialog(
          context,
          title: failure.title ?? 'Error',
          content: failure.error,
          onTapDismiss: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
      },
      (result) async {
        setState(() {
          _isCreatingInspection = false;
          _existingInspectionLotId = result.second;
        });
        if (!mounted) return;
        await AppDialog.showSuccessDialog(
          context,
          title: 'Success',
          content: result.first.isNotEmpty
              ? '${result.first}\n${result.second}'
              : 'Quality Inspection ${result.second} created successfully',
          onTapDismiss: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
        if (!mounted) return;
        _openQualityInspection(result.second);
      },
    );
  }

  void _openQualityInspection(String inspectionLotId) {
    AppRoute.packingQualityParameter.push(
      context,
      extra: PackingQualityArgs(
        packing: widget.packing,
        inspectionLotId: inspectionLotId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_scanRows.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: Text('No scan rows configured for these items')),
      );
    }

    final completedCount = _scanRows.where((e) => e.isSuccess).length;
    final allScansDone =
        completedCount == _scanRows.length && _scanRows.isNotEmpty;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.packing.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Completed: $completedCount / ${_scanRows.length}',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        AppSpacer.p8(),
        ...List.generate(_scanRows.length, (index) {
          final row = _scanRows[index];
          final item = row.item;
          final borderColor =
              row.isSuccess ? Colors.green : Colors.grey.shade300;
          final backgroundColor =
              row.isSuccess
                  ? Colors.green.withValues(alpha: 0.12)
                  : Colors.white;

          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            color: backgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: borderColor, width: 1.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor:
                            row.isSuccess ? Colors.green : AppColors.packing,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${item.itemCode ?? ''}  •  Scan ${row.scanNo}/${(item.customNoOfScan ?? 0).round()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      if (row.isSuccess)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 22,
                        ),
                    ],
                  ),
                  AppSpacer.p4(),
                  Text(
                    item.itemName ?? '',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                  ),
                  Text(
                    'Qty: ${item.qty ?? 0}',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  // if (row.remainingScans != null)
                  //   Text(
                  //     'Remaining scans: ${row.remainingScans}',
                  //     style: TextStyle(
                  //       color: Colors.grey.shade700,
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  AppSpacer.p8(),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: row.controller,
                          readOnly: true,
                          enabled: !row.isSuccess,
                          decoration: InputDecoration(
                            hintText:
                                row.isSuccess
                                    ? 'Scan completed'
                                    : 'Tap scanner to scan',
                            filled: row.isSuccess,
                            fillColor:
                                row.isSuccess
                                    ? Colors.green.withValues(alpha: 0.08)
                                    : null,
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color:
                                    row.isSuccess
                                        ? Colors.green
                                        : Colors.grey.shade400,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color:
                                    row.isSuccess
                                        ? Colors.green
                                        : Colors.grey.shade400,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (row.isLoading)
                        const SizedBox(
                          width: 40,
                          height: 40,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      else
                        InkWell(
                          onTap: row.isSuccess ? null : () => _scanForRow(row),
                          child: Icon(
                            Icons.qr_code_scanner,
                            size: 40,
                            color:
                                row.isSuccess ? Colors.green : AppColors.black,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
        AppSpacer.p12(),
        AppButton(
          width: double.infinity,
          label:
              !_isSubmitted
                  ? 'Submit'
                  : (_existingInspectionLotId != null
                      ? 'Next'
                      : 'Create Quality Inspection'),
          bgColor: AppColors.haintBlue,
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          isLoading:
              _isSubmitting ||
              _isCreatingInspection ||
              _isLoadingInspectionLot,
          onPressed:
              !_isSubmitted
                  ? (allScansDone && !_isSubmitting ? _submitPacking : null)
                  : _isLoadingInspectionLot || _isCreatingInspection
                  ? null
                  : (_existingInspectionLotId != null
                      ? () =>
                          _openQualityInspection(_existingInspectionLotId!)
                      : _createQualityInspection),
        ),
      ],
    );
  }
}
