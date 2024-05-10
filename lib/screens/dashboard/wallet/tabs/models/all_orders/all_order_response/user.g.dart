// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      roleType: json['role_type'] as String?,
      deviceType: json['device_type'] as String?,
      deviceInfo: json['device_info'] as String?,
      appId: json['app_id'],
      isQuizAttempt: json['is_quiz_attempt'] as bool?,
      verificationCode: json['verification_code'] as String?,
      isVerified: json['is_verified'] as bool?,
      isActive: json['is_active'] as bool?,
      isSuspended: json['is_suspended'] as bool?,
      isAdmin: json['is_admin'] as bool?,
      profileImage: json['profile_image'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      fcmToken: json['fcmToken'],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'mobile_number': instance.mobileNumber,
      'role_type': instance.roleType,
      'device_type': instance.deviceType,
      'device_info': instance.deviceInfo,
      'app_id': instance.appId,
      'is_quiz_attempt': instance.isQuizAttempt,
      'verification_code': instance.verificationCode,
      'is_verified': instance.isVerified,
      'is_active': instance.isActive,
      'is_suspended': instance.isSuspended,
      'is_admin': instance.isAdmin,
      'profile_image': instance.profileImage,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'fcmToken': instance.fcmToken,
    };
