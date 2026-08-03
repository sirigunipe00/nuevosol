import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:intl/intl.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/core/utils/attachment_selection_mixin.dart';
import 'package:nuevosol/features/packing/model/packing_model.dart';
import 'package:nuevosol/features/packing/model/packing_quality_args.dart';
import 'package:nuevosol/features/packing/model/quality_inspection_reading.dart';
import 'package:nuevosol/features/packing/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_spacer.dart';
import 'package:nuevosol/widgets/buttons/app_btn.dart';
import 'package:nuevosol/widgets/dailogs/app_dialogs.dart';
import 'package:nuevosol/widgets/loading_indicator.dart';
import 'package:nuevosol/widgets/title_status_app_bar.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class PackingQualityParameterScrn extends StatefulWidget {
  const PackingQualityParameterScrn({super.key, required this.args});

  final PackingQualityArgs args;

  @override
  State<PackingQualityParameterScrn> createState() =>
      _PackingQualityParameterScrnState();
}

class _PackingQualityParameterScrnState
    extends State<PackingQualityParameterScrn>
    with AttahcmentSelectionMixin {
  final Map<String, TextEditingController> _readingControllers = {};
  final Map<String, TextEditingController> _instrumentControllers = {};
  final Map<String, bool> _okSelections = {}; // true = OK, false = Not OK
  final Map<String, File?> _photos = {};
  final Map<String, String> _photoTimestamps = {};
  bool _isSubmitting = false;
  bool _isCapturingPhoto = false;

  String _keyFor(QualityInspectionReading reading, [int? index]) =>
      reading.name ?? reading.specification ?? '${index ?? 0}';

  bool _isNumeric(QualityInspectionReading reading) =>
      (reading.numeric ?? 0) == 1;

  bool _requiresPhoto(QualityInspectionReading reading) =>
      (reading.customRequiredPhoto ?? 0) == 1;

  @override
  void dispose() {
    for (final controller in _readingControllers.values) {
      controller.dispose();
    }
    for (final controller in _instrumentControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  TextEditingController _controllerFor(QualityInspectionReading reading) {
    final key = _keyFor(reading);
    return _readingControllers.putIfAbsent(key, () {
      final existing = reading.readingValue;
      // Don't prefill non-numeric values into numeric field
      final initial =
          existing != null && double.tryParse(existing) != null ? existing : '';
      return TextEditingController(text: initial);
    });
  }

  TextEditingController _instrumentControllerFor(
    QualityInspectionReading reading,
  ) {
    final key = _keyFor(reading);
    return _instrumentControllers.putIfAbsent(key, () {
      return TextEditingController(text: reading.customInstrumentNo ?? '');
    });
  }

  bool _okValueFor(QualityInspectionReading reading) {
    final key = _keyFor(reading);
    if (_okSelections.containsKey(key)) return _okSelections[key]!;
    final existing =
        (reading.readingValue ?? reading.status ?? '').trim().toLowerCase();
    if (existing.contains('not') || existing == 'rejected') {
      return false;
    }
    return true; // default OK
  }

  bool _isReadingInRange(QualityInspectionReading reading) {
    final text = _controllerFor(reading).text.trim();
    if (text.isEmpty) return false;
    final value = double.tryParse(text);
    if (value == null) return false;
    final min = reading.minValue ?? 0;
    final max = reading.maxValue ?? 0;
    return value >= min && value <= max;
  }

  bool _isRowComplete(QualityInspectionReading reading) {
    final key = _keyFor(reading);
    if (_isNumeric(reading)) {
      if (!_isReadingInRange(reading)) return false;
    } else {
      // OK / Not OK always has a selection (defaults to OK)
      _okValueFor(reading);
    }

    if (_requiresPhoto(reading)) {
      final hasLocalPhoto = _photos[key] != null;
      final hasExistingPhoto =
          (reading.customPhotoAttachment ?? '').trim().isNotEmpty;
      if (!hasLocalPhoto && !hasExistingPhoto) return false;
    }
    return true;
  }

  bool _allComplete(List<QualityInspectionReading> readings) {
    if (readings.isEmpty) return false;
    return readings.every(_isRowComplete);
  }

  Future<File> _stampTimestamp(File source) async {
    final bytes = await source.readAsBytes();
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    final image = frame.image;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawImage(image, Offset.zero, Paint());

    final stamp = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    final fontSize = (image.width * 0.035).clamp(14.0, 42.0);
    final textPainter = TextPainter(
      text: TextSpan(
        text: stamp,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          backgroundColor: Colors.black54,
        ),
      ),
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: image.width.toDouble());

    final dx = 16.0;
    final dy = image.height - textPainter.height - 16.0;
    textPainter.paint(canvas, Offset(dx, dy));

    final picture = recorder.endRecording();
    final stamped = await picture.toImage(image.width, image.height);
    final byteData = await stamped.toByteData(format: ui.ImageByteFormat.png);
    final dir = await getTemporaryDirectory();
    final out = File(
      p.join(dir.path, 'qi_photo_${DateTime.now().millisecondsSinceEpoch}.png'),
    );
    await out.writeAsBytes(byteData!.buffer.asUint8List());
    return out;
  }

  Future<void> _capturePhoto(QualityInspectionReading reading) async {
    if (_isCapturingPhoto) return;
    final key = _keyFor(reading);
    setState(() => _isCapturingPhoto = true);
    try {
      final file = await captureImage();
      if (file == null || !mounted) return;
      final stamped = await _stampTimestamp(file);
      if (!mounted) return;
      setState(() {
        _photos[key] = stamped;
        _photoTimestamps[key] = DateFormat(
          'dd-MM-yyyy HH:mm:ss',
        ).format(DateTime.now());
      });
    } finally {
      if (mounted) setState(() => _isCapturingPhoto = false);
    }
  }

  void _previewPhoto(File file, String? timestamp) {
    showDialog<void>(
      context: context,
      builder: (ctx) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 3 / 4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.file(file, fit: BoxFit.contain),
                    if (timestamp != null)
                      Positioned(
                        left: 12,
                        bottom: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          color: Colors.black54,
                          child: Text(
                            timestamp,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _onSubmit(List<QualityInspectionReading> readings) async {
    if (!_allComplete(readings)) {
      await AppDialog.showErrorDialog(
        context,
        title: 'Incomplete',
        content:
            'Please complete all parameters. Numeric readings must be within Min–Max, and required photos must be captured.',
        onTapDismiss: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      );
      return;
    }

    final lotId = widget.args.inspectionLotId.trim();
    if (lotId.isEmpty) {
      await AppDialog.showErrorDialog(
        context,
        title: 'Error',
        content: 'Inspection Lot id is missing',
        onTapDismiss: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final payload = <Map<String, dynamic>>[];
      for (final reading in readings) {
        payload.add(await _buildReadingPayload(reading));
      }

      final response = await PackingBlocProvider.get().repo.submitInspectionLot(
        name: lotId,
        readings: payload,
      );

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
          setState(() => _isSubmitting = false);
          if (!mounted) return;
          await AppDialog.showSuccessDialog(
            context,
            title: 'Success',
            content: result.first.isNotEmpty
                ? result.first
                : 'Quality inspection submitted successfully',
            onTapDismiss: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          );
          if (!mounted) return;
          Navigator.of(context).pop(true);
        },
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      await AppDialog.showErrorDialog(
        context,
        title: 'Error',
        content: e.toString(),
        onTapDismiss: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      );
    }
  }

  Future<Map<String, dynamic>> _buildReadingPayload(
    QualityInspectionReading reading,
  ) async {
    final instrumentNo = _instrumentControllerFor(reading).text.trim();
    final photoBase64 = await _photoBase64For(reading);

    if (_isNumeric(reading)) {
      final text = _controllerFor(reading).text.trim();
      final asNum = double.tryParse(text);
      return {
        'specification': reading.specification ?? '',
        'custom_instrument_no': instrumentNo,
        'reading_1': asNum ?? text,
        'custom_photo_attachment': photoBase64,
        'value': '',
      };
    }

    final isOk = _okValueFor(reading);
    final statusValue = isOk ? 'OK' : 'Not OK';
    return {
      'specification': reading.specification ?? '',
      'custom_instrument_no': instrumentNo,
      'reading_1': statusValue,
      'custom_photo_attachment': photoBase64,
      'value': statusValue,
    };
  }

  Future<String> _photoBase64For(QualityInspectionReading reading) async {
    final key = _keyFor(reading);
    final localPhoto = _photos[key];
    if (localPhoto != null) {
      final compressed = await FlutterImageCompress.compressWithFile(
        localPhoto.path,
        quality: 30,
      );
      if (compressed != null && compressed.isNotEmpty) {
        return base64Encode(compressed);
      }
      final bytes = await localPhoto.readAsBytes();
      return base64Encode(bytes);
    }

    // Keep existing server attachment path if photo was already saved
    final existing = (reading.customPhotoAttachment ?? '').trim();
    if (existing.isNotEmpty && !existing.startsWith('/9j/')) {
      return '';
    }
    return existing;
  }

  @override
  Widget build(BuildContext context) {
    final packing = widget.args.packing;
    final status = packing.docstatus ?? 0;
    final name = packing.name.valueOrEmpty;
    final lotId = widget.args.inspectionLotId;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar:
          TitleStatusAppBar(
                title: 'Quality Inspection',
                docNo: lotId.isNotEmpty ? lotId : name,
                status: StringUtils.docStatus(status),
                textColor: AppColors.packing,
              )
              as PreferredSizeWidget,
      body: SafeArea(
        child: BlocBuilder<
          QualityInspectionReadingsCubit,
          QualityInspectionReadingsState
        >(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Center(child: LoadingIndicator()),
              failure:
                  (failure) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        failure.error,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
              success: (readings) {
                if (readings.isEmpty) {
                  return const Center(
                    child: Text('No quality inspection readings found'),
                  );
                }

                final canSubmit = _allComplete(readings);

                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(12),
                        itemCount: readings.length + 1,
                        separatorBuilder: (_, __) => AppSpacer.p12(),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return _headerInfo(packing, lotId);
                          }
                          final reading = readings[index - 1];
                          return _readingCard(reading, index);
                        },
                      ),
                    ),
                    AppButton(
                      label: 'Submit',
                      bgColor: AppColors.haintBlue,
                      margin: const EdgeInsets.all(12),
                      isLoading: _isSubmitting,
                      onPressed:
                          canSubmit && !_isSubmitting
                              ? () => _onSubmit(readings)
                              : null,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _headerInfo(PackingModel packing, String lotId) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey.shade100),
      ),
      child: Column(
        children: [
          _infoRow('Inspection Lot', lotId),
          const Divider(height: 16),
          _infoRow('Process', packing.selectProcess ?? '-'),
          const Divider(height: 16),
          _infoRow('Item', packing.rawMaterialName ?? '-'),
          const Divider(height: 16),
          _infoRow(
            'Ok Qty',
            packing.okQty == null ? '-' : packing.okQty.toString(),
          ),
        ],
      ),
    );
  }

  Widget _readingCard(QualityInspectionReading reading, int siNo) {
    final isNumeric = _isNumeric(reading);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFFFFE4D6),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$siNo  ${reading.specification ?? '-'}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                _instrumentNoRow(reading),
                const SizedBox(height: 8),
                if (isNumeric)
                  Text(
                    'Min - ${_formatNum(reading.minValue)}    Max - ${_formatNum(reading.maxValue)}',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                else
                  Text(
                    'Acceptance Criteria - OK',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isNumeric) ...[
                  const Text(
                    'Actual value Reading 1',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  _numericReadingField(reading),
                ] else ...[
                  const Text(
                    'Actual value Reading 1',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  _okNotOkButtons(reading),
                ],
                if (_requiresPhoto(reading)) ...[
                  const SizedBox(height: 12),
                  _photoSection(reading),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _instrumentNoRow(QualityInspectionReading reading) {
    final controller = _instrumentControllerFor(reading);

    return Row(
      children: [
        const Text(
          'Instrument No',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Enter / Scan',
              filled: true,
              fillColor: const Color(0xFFFFF59D),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade500),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade500),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () => _scanInstrumentNo(reading),
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey.shade600),
            ),
            child: Icon(
              Icons.qr_code_scanner,
              size: 20,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _scanInstrumentNo(QualityInspectionReading reading) async {
    final scanResult = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => const SimpleBarcodeScannerPage(
              scanType: ScanType.barcode,
              appBarTitle: 'Scan Instrument No',
            ),
      ),
    );

    if (!mounted) return;
    if (scanResult is! String ||
        scanResult.isEmpty ||
        scanResult == '-1' ||
        scanResult.toLowerCase() == 'null') {
      return;
    }

    setState(() {
      _instrumentControllerFor(reading).text = scanResult.trim();
    });
  }

  Widget _numericReadingField(QualityInspectionReading reading) {
    final text = _controllerFor(reading).text.trim();
    final hasValue = text.isNotEmpty;
    final inRange = hasValue && _isReadingInRange(reading);
    final outOfRange = hasValue && !_isReadingInRange(reading);
    final fill =
        inRange
            ? Colors.green.shade100
            : outOfRange
            ? Colors.red.shade100
            : null;
    final borderColor =
        inRange
            ? Colors.green
            : outOfRange
            ? Colors.red
            : Colors.grey.shade400;

    return TextField(
      controller: _controllerFor(reading),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        isDense: true,
        hintText: 'Enter reading',
        filled: fill != null,
        fillColor: fill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor, width: 1.8),
        ),
      ),
    );
  }

  Widget _okNotOkButtons(QualityInspectionReading reading) {
    final key = _keyFor(reading);
    final isOk = _okValueFor(reading);

    return Row(
      children: [
        Expanded(
          child: _statusChip(
            label: 'OK',
            selected: isOk,
            selectedColor: Colors.green,
            onTap: () {
              setState(() => _okSelections[key] = true);
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _statusChip(
            label: 'Not OK',
            selected: !isOk,
            selectedColor: Colors.red,
            onTap: () {
              setState(() => _okSelections[key] = false);
            },
          ),
        ),
      ],
    );
  }

  Widget _statusChip({
    required String label,
    required bool selected,
    required Color selectedColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              selected ? selectedColor.withValues(alpha: 0.15) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? selectedColor : Colors.grey.shade500,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: selected ? selectedColor : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _photoSection(QualityInspectionReading reading) {
    final key = _keyFor(reading);
    final photo = _photos[key];
    final timestamp = _photoTimestamps[key];
    final existingUrl = (reading.customPhotoAttachment ?? '').trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weighment Photo',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        const SizedBox(height: 8),
        if (photo != null)
          GestureDetector(
            onTap: () => _previewPhoto(photo, timestamp),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Image.file(
                    photo,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  if (timestamp != null)
                    Positioned(
                      left: 8,
                      bottom: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        color: Colors.black54,
                        child: Text(
                          timestamp,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 16,
                        onPressed: () {
                          setState(() {
                            _photos.remove(key);
                            _photoTimestamps.remove(key);
                          });
                        },
                        icon: const Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          InkWell(
            onTap: _isCapturingPhoto ? null : () => _capturePhoto(reading),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.packing, width: 1.5),
                color: AppColors.packing.withValues(alpha: 0.06),
              ),
              child:
                  _isCapturingPhoto
                      ? const CircularProgressIndicator()
                      : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            size: 36,
                            color: AppColors.packing,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            existingUrl.isNotEmpty
                                ? 'Retake Photo'
                                : 'Photo',
                            style: const TextStyle(
                              color: AppColors.packing,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
            ),
          ),
      ],
    );
  }

  String _formatNum(double? value) {
    if (value == null) return '-';
    if (value == value.roundToDouble()) return value.toInt().toString();
    return value.toString();
  }

  Widget _infoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
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
