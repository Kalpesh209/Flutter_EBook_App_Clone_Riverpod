// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImage: json['profile_image'],
      email: json['email'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      verificationCode: json['verification_code'] as String?,
      isVerified: json['is_verified'] as bool?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_image': instance.profileImage,
      'email': instance.email,
      'mobile_number': instance.mobileNumber,
      'verification_code': instance.verificationCode,
      'is_verified': instance.isVerified,
      'token': instance.token,
    };
