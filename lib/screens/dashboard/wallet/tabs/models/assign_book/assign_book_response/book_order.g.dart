// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookOrderImpl _$$BookOrderImplFromJson(Map<String, dynamic> json) =>
    _$BookOrderImpl(
      isExpanded: json['is_expanded'] as bool?,
      orderId: json['order_id'] as String?,
      bookTitle: json['book_title'] as String?,
      releaseYear: json['release_year'] as int?,
      language: json['language'] as String?,
      about: json['about'] as String?,
      coverImage: json['cover_image'] as String?,
      bookTag: json['book_tag'] as String?,
      tag: json['tag'] as String?,
      isPublish: json['is_publish'] as bool?,
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
      orderDate: json['order_date'] as String?,
      assignDate: json['assign_date'],
      returnDate: json['return_date'] as String?,
      orderStatus: json['order_status'] as String?,
      bookCondition: json['book_condition'],
      image: json['image'],
      remark: json['remark'],
    );

Map<String, dynamic> _$$BookOrderImplToJson(_$BookOrderImpl instance) =>
    <String, dynamic>{
      'is_expanded': instance.isExpanded,
      'order_id': instance.orderId,
      'book_title': instance.bookTitle,
      'release_year': instance.releaseYear,
      'language': instance.language,
      'about': instance.about,
      'cover_image': instance.coverImage,
      'book_tag': instance.bookTag,
      'tag': instance.tag,
      'is_publish': instance.isPublish,
      'order_number': instance.orderNumber,
      'user': instance.user,
      'bookMaster': instance.bookMaster,
      'orderAddress': instance.orderAddress,
      'order_date': instance.orderDate,
      'assign_date': instance.assignDate,
      'return_date': instance.returnDate,
      'order_status': instance.orderStatus,
      'book_condition': instance.bookCondition,
      'image': instance.image,
      'remark': instance.remark,
    };
