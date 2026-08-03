import 'package:freezed_annotation/freezed_annotation.dart';

part 'quality_inspection_reading.freezed.dart';
part 'quality_inspection_reading.g.dart';

@freezed
class QualityInspectionReading with _$QualityInspectionReading {
  const QualityInspectionReading._();

  const factory QualityInspectionReading({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'idx') int? idx,
    @JsonKey(name: 'parent') String? parent,
    @JsonKey(name: 'specification') String? specification,
    @JsonKey(name: 'reading_value') String? readingValue,
    @JsonKey(name: 'custom_required_photo', defaultValue: 0)
    int? customRequiredPhoto,
    @JsonKey(name: 'custom_photo_attachment') String? customPhotoAttachment,
    @JsonKey(name: 'custom_instrument_no') String? customInstrumentNo,
    @JsonKey(name: 'numeric', defaultValue: 0) int? numeric,
    @JsonKey(name: 'min_value') double? minValue,
    @JsonKey(name: 'max_value') double? maxValue,
    @JsonKey(name: 'status') String? status,
  }) = _QualityInspectionReading;

  factory QualityInspectionReading.fromJson(Map<String, dynamic> json) =>
      _$QualityInspectionReadingFromJson(json);
}
