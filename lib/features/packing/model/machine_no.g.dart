// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_no.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MachineNoImpl _$$MachineNoImplFromJson(Map<String, dynamic> json) =>
    _$MachineNoImpl(
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creation: json['creation'] as String?,
      modified: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docstatus: (json['docstatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MachineNoImplToJson(_$MachineNoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creation,
      'modified': instance.modified,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docstatus,
    };
