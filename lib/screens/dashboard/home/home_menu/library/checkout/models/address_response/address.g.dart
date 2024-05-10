// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: json['id'] as String?,
      zipCode: json['zip_code'],
      type: json['type'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
          address_line_1: json['address_line_1'] as String?,
          address_line_2: json['address_line_2'] as String?,
          address_line_3: json['address_line_3'] as String?,
      address: json['address'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
          landmark: json['landmark'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'zip_code': instance.zipCode,
      'type': instance.type,
      'name': instance.name,
      'city': instance.city,
      'address_line_1': instance.address_line_1,
      'address_line_2': instance.address_line_2,
      'address_line_3': instance.address_line_3,
      'address': instance.address,
      'mobile_number': instance.mobileNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'landmark': instance.landmark,
    };
