import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nuevosol/features/auth/model/user_roles.dart';

part 'logged_in_user.freezed.dart';
part 'logged_in_user.g.dart';

@freezed
class LoggedInUser with _$LoggedInUser {
  const LoggedInUser._();
  const factory LoggedInUser({
    required String name,
    required String username,
    @JsonKey(name: 'first_name', defaultValue: '') String? firstName,
    @JsonKey(name: 'last_name', defaultValue: '') String? lastName,
    @JsonKey(name: 'api_key', defaultValue: '') required String apiKey,
    @JsonKey(name: 'api_secret', defaultValue: '') required String apiSecret,
    @JsonKey(name: 'email', defaultValue: '') String? email,
    @JsonKey(defaultValue: '') String? password,
    @JsonKey(name: 'role_profile_name', defaultValue: '')
    String? roleProfileName,
    @JsonKey(name: 'user_type') String? userType,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'birth_date') String? bithDate,
    @JsonKey(name: 'depo_name') String? depoName,
    @JsonKey(name: 'full_name') required String? fullName,
    @JsonKey(name: 'department') String? department,
    String? phone,
    String? location,
    String? bio,
    @JsonKey(name: 'roles') List<String>? role,
    @JsonKey(name: 'mobile_no') String? mobileNo,
    @JsonKey(name: 'otp_verified') bool? isOtpVerfied,
    @JsonKey(name: 'role_status') UserRoles? roles,
  }) = _LoggedInUser;

  factory LoggedInUser.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserFromJson(_enrichLoggedInUserJson(json));
}

Map<String, dynamic> _enrichLoggedInUserJson(Map<String, dynamic> json) {
  final enriched = Map<String, dynamic>.from(json);
  final roleList =
      (enriched['roles'] as List?)?.map((e) => e.toString()).toList() ??
      const <String>[];
  final roleStatus = Map<String, dynamic>.from(
    (enriched['role_status'] as Map?)?.map(
          (key, value) => MapEntry(key.toString(), value),
        ) ??
        const <String, dynamic>{},
  );

  // Backend may put feature access only in `roles` (not `role_status`).
  const featureRoles = [
    'Show Dashboards in Mobile App',
    'Show PO Approval List in Mobile App',
    'Show Dispatch Gaylord in Mobile App',
    'Show Gate Registration in Mobile App',
    'Show Gate Exit in Mobile App',
    'Show Gate Entry in Mobile App',
    'Packing mobile app',
  ];
  for (final role in featureRoles) {
    if (roleList.contains(role)) {
      roleStatus[role] = 1;
    }
  }
  if (roleStatus.isNotEmpty) {
    enriched['role_status'] = roleStatus;
  }

  return enriched;
}
