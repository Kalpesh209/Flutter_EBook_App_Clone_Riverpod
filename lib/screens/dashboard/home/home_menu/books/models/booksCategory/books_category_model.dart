import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

part 'books_category_model.freezed.dart';
part 'books_category_model.g.dart';

@freezed
class CategoryEbookResponse with _$CategoryEbookResponse {
  factory CategoryEbookResponse({
    CategoryEbookData? data,
    bool? success,
    String? message,
  }) = _CategoryEbookResponse;

  factory CategoryEbookResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryEbookResponseFromJson(json);
}

@freezed
class Category with _$Category {
  factory Category({
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    List<BookDetailsModal>? books,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class CategoryEbookData with _$CategoryEbookData {
  factory CategoryEbookData({
    List<Category>? category,
    int? count,
    int? AllCount,
  }) = _CategoryEbookData;

  factory CategoryEbookData.fromJson(Map<String, dynamic> json) =>
      _$CategoryEbookDataFromJson(json);
}
