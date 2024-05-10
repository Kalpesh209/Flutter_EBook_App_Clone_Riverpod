// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionImpl _$$SubscriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      day: json['day'] as int?,
      paymentUrl: json['payment_url'] as String?,
      details: json['details'] as String?,
      content: json['content'] as String?,
      headingone: json['heading_one'] as String?,
      headingtwo: json['heading_two'] as String?,
      headingthree: json['heading_three'] as String?,
    );

Map<String, dynamic> _$$SubscriptionImplToJson(_$SubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'day': instance.day,
      'payment_url': instance.paymentUrl,
      'details': instance.details,
      'content': instance.content,
      'heading_one': instance.headingone,
      'heading_two': instance.headingtwo,
      'heading_three': instance.headingthree,
    };
