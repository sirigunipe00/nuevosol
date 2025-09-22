// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_roles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRolesImpl _$$UserRolesImplFromJson(Map<String, dynamic> json) =>
    _$UserRolesImpl(
      dashbaords: (json['Show Dashboards in Mobile App'] as num?)?.toInt() ?? 0,
      approval:
          (json['Show PO Approval List in Mobile App'] as num?)?.toInt() ?? 0,
      gaylord:
          (json['Show Dispatch Gaylord in Mobile App'] as num?)?.toInt() ?? 0,
      registration:
          (json['Show Gate Registration in Mobile App'] as num?)?.toInt() ?? 0,
      exit: (json['Show Gate Exit in Mobile App'] as num?)?.toInt() ?? 0,
      entry: (json['Show Gate Entry in Mobile App'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserRolesImplToJson(_$UserRolesImpl instance) =>
    <String, dynamic>{
      'Show Dashboards in Mobile App': instance.dashbaords,
      'Show PO Approval List in Mobile App': instance.approval,
      'Show Dispatch Gaylord in Mobile App': instance.gaylord,
      'Show Gate Registration in Mobile App': instance.registration,
      'Show Gate Exit in Mobile App': instance.exit,
      'Show Gate Entry in Mobile App': instance.entry,
    };
