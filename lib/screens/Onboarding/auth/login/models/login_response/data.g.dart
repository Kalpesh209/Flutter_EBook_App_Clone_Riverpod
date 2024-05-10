// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      verificationCode: json['verification_code'] as String?,
      profileImage: json['profile_image'],
      token: json['token'] as String?,
      isVerified: json['is_verified'] as bool?,
      subscription: json['subscription'] as List<dynamic>?,
      waitlist: json['waitlist'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'mobile_number': instance.mobileNumber,
      'verification_code': instance.verificationCode,
      'profile_image': instance.profileImage,
      'token': instance.token,
      'is_verified': instance.isVerified,
      'subscription': instance.subscription,
      'waitlist': instance.waitlist,
    };
