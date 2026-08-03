// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quality_inspection_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QualityInspectionReadingImpl _$$QualityInspectionReadingImplFromJson(
        Map<String, dynamic> json) =>
    _$QualityInspectionReadingImpl(
      name: json['name'] as String?,
      idx: (json['idx'] as num?)?.toInt(),
      parent: json['parent'] as String?,
      specification: json['specification'] as String?,
      readingValue: json['reading_value'] as String?,
      customRequiredPhoto:
          (json['custom_required_photo'] as num?)?.toInt() ?? 0,
      customPhotoAttachment: json['custom_photo_attachment'] as String?,
      customInstrumentNo: json['custom_instrument_no'] as String?,
      numeric: (json['numeric'] as num?)?.toInt() ?? 0,
      minValue: (json['min_value'] as num?)?.toDouble(),
      maxValue: (json['max_value'] as num?)?.toDouble(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$QualityInspectionReadingImplToJson(
        _$QualityInspectionReadingImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'idx': instance.idx,
      'parent': instance.parent,
      'specification': instance.specification,
      'reading_value': instance.readingValue,
      'custom_required_photo': instance.customRequiredPhoto,
      'custom_photo_attachment': instance.customPhotoAttachment,
      'custom_instrument_no': instance.customInstrumentNo,
      'numeric': instance.numeric,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
      'status': instance.status,
    };
