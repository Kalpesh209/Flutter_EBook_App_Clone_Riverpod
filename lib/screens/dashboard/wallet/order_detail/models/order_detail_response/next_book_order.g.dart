// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_book_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NextBookOrderImpl _$$NextBookOrderImplFromJson(Map<String, dynamic> json) =>
    _$NextBookOrderImpl(
      id: json['id'],
      orderNumber: json['order_number'],
      user: json['user'],
      bookMaster: json['bookMaster'],
      orderAddress: (json['orderAddress'] as List<dynamic>?)
          ?.map((e) => OrderAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookQty: json['bookQty'],
      orderDate: json['order_date'],
      assignDate: json['assign_date'],
      returnDate: json['return_date'],
      orderStatus: json['order_status'],
      bookCondition: json['book_condition'],
      image: json['image'],
      remark: json['remark'],
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NextBookOrderImplToJson(_$NextBookOrderImpl instance) =>
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
      'seller': instance.seller,
    };
