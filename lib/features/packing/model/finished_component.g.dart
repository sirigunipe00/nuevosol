// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finished_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinishedComponentImpl _$$FinishedComponentImplFromJson(
        Map<String, dynamic> json) =>
    _$FinishedComponentImpl(
      componentName: json['name'] as String?,
      defaultBom: json['default_bom'] as String?,
      qualityInspectionTemplate: json['quality_inspection_template'] as String?,
    );

Map<String, dynamic> _$$FinishedComponentImplToJson(
        _$FinishedComponentImpl instance) =>
    <String, dynamic>{
      'name': instance.componentName,
      'default_bom': instance.defaultBom,
      'quality_inspection_template': instance.qualityInspectionTemplate,
    };
