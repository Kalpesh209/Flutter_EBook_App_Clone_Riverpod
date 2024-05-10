import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    String? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    String? password,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    @JsonKey(name: 'role_type') String? roleType,
    @JsonKey(name: 'device_type') String? deviceType,
    @JsonKey(name: 'device_info') String? deviceInfo,
    @JsonKey(name: 'app_id') dynamic appId,
    @JsonKey(name: 'is_quiz_attempt') bool? isQuizAttempt,
    @JsonKey(name: 'verification_code') String? verificationCode,
    @JsonKey(name: 'is_verified') bool? isVerified,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'is_suspended') bool? isSuspended,
    @JsonKey(name: 'is_admin') bool? isAdmin,
    @JsonKey(name: 'profile_image') dynamic profileImage,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    dynamic fcmToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
