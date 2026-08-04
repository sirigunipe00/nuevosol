import 'package:freezed_annotation/freezed_annotation.dart';

part 'quality_inspection_reading.freezed.dart';
part 'quality_inspection_reading.g.dart';

String? _reading1FromJson(Object? value) {
  if (value == null) return null;
  final text = value.toString().trim();
  return text.isEmpty ? null : text;
}

@freezed
class QualityInspectionReading with _$QualityInspectionReading {
  const QualityInspectionReading._();

  const factory QualityInspectionReading({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'idx') int? idx,
    @JsonKey(name: 'parent') String? parent,
    @JsonKey(name: 'docstatus') int? docstatus,
    @JsonKey(name: 'specification') String? specification,
    @JsonKey(name: 'reading_value') String? readingValue,
    @JsonKey(name: 'reading_1', fromJson: _reading1FromJson) String? reading1,
    @JsonKey(name: 'custom_required_photo', defaultValue: 0)
    int? customRequiredPhoto,
    @JsonKey(name: 'custom_photo_attachment') String? customPhotoAttachment,
    @JsonKey(name: 'custom_instrument_no') String? customInstrumentNo,
    @JsonKey(name: 'numeric', defaultValue: 0) int? numeric,
    @JsonKey(name: 'min_value') double? minValue,
    @JsonKey(name: 'max_value') double? maxValue,
    @JsonKey(name: 'status') String? status,
  }) = _QualityInspectionReading;

  /// Prefer API field `reading_1` (persisted value), fall back to `reading_value`.
  String? get savedReading {
    final fromReading1 = reading1?.trim();
    if (fromReading1 != null && fromReading1.isNotEmpty) return fromReading1;
    final fromValue = readingValue?.trim();
    if (fromValue != null && fromValue.isNotEmpty) return fromValue;
    return null;
  }

  factory QualityInspectionReading.fromJson(Map<String, dynamic> json) =>
      _$QualityInspectionReadingFromJson(json);
}
