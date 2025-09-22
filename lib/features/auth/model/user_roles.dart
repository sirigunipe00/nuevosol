import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_roles.freezed.dart';
part 'user_roles.g.dart';

@freezed
class UserRoles with _$UserRoles {
  const UserRoles._();
  const factory UserRoles({
    @JsonKey(name: 'Show Dashboards in Mobile App', defaultValue: 0) required int dashbaords,
    @JsonKey(name: 'Show PO Approval List in Mobile App', defaultValue: 0) required int  approval,
    @JsonKey(name: 'Show Dispatch Gaylord in Mobile App', defaultValue: 0) required int gaylord,
    @JsonKey(name: 'Show Gate Registration in Mobile App', defaultValue: 0) required int registration,
    @JsonKey(name: 'Show Gate Exit in Mobile App', defaultValue: 0)  required int exit,
    @JsonKey(name: 'Show Gate Entry in Mobile App',defaultValue: 0) required int entry,
  }) = _UserRoles;

  factory UserRoles.fromJson(Map<String, dynamic> json) =>
      _$UserRolesFromJson(json);
}
