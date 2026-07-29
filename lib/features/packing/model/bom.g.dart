// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BomImpl _$$BomImplFromJson(Map<String, dynamic> json) => _$BomImpl(
      bomName: json['name'] as String?,
      bomqty: (json['quantity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BomImplToJson(_$BomImpl instance) => <String, dynamic>{
      'name': instance.bomName,
      'quantity': instance.bomqty,
    };
