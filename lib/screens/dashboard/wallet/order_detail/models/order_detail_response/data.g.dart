// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: json['id'] as String?,
      orderNumber: json['order_number'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      bookMaster: json['bookMaster'] == null
          ? null
          : BookMaster.fromJson(json['bookMaster'] as Map<String, dynamic>),
      orderAddress: (json['orderAddress'] as List<dynamic>?)
          ?.map((e) => OrderAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookQty: json['bookQty'],
      orderDate: json['order_date'] as String?,
      assignDate: json['assign_date'],
      returnDate: json['return_date'] as String?,
      orderStatus: json['order_status'] as String?,
      bookCondition: json['book_condition'],
      image: json['image'],
      remark: json['remark'],
      expectedDeliveryDate: json['expected_delivery_date'],
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
      orderTimeline: (json['order_timeline'] as List<dynamic>?)
          ?.map((e) => OrderTimeline.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextBookOrder: json['next_book_order'] == null
          ? null
          : NextBookOrder.fromJson(
              json['next_book_order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'user': instance.user,
      'bookMaster': instance.bookMaster,
      'orderAddress': instance.orderAddress,
      'bookQty': instance.bookQty,
      'order_date': instance.orderDate,
      'assign_date': instance.assignDate,
      'return_date': instance.returnDate,
      'order_status': instance.orderStatus,
      'book_condition': instance.bookCondition,
      'image': instance.image,
      'remark': instance.remark,
      'expected_delivery_date': instance.expectedDeliveryDate,
      'seller': instance.seller,
      'order_timeline': instance.orderTimeline,
      'next_book_order': instance.nextBookOrder,
    };
