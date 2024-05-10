// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryEbookResponseImpl _$$CategoryEbookResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryEbookResponseImpl(
      data: json['data'] == null
          ? null
          : CategoryEbookData.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$CategoryEbookResponseImplToJson(
        _$CategoryEbookResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      categoryId: json['category_id'] as String?,
      categoryName: json['category_name'] as String?,
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => BookDetailsModal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'books': instance.books,
    };

_$CategoryEbookDataImpl _$$CategoryEbookDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryEbookDataImpl(
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
      AllCount: json['AllCount'] as int?,
    );

Map<String, dynamic> _$$CategoryEbookDataImplToJson(
        _$CategoryEbookDataImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'count': instance.count,
      'AllCount': instance.AllCount,
    };
