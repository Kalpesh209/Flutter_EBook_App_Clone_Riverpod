import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  factory Cart({
    String? id,
    @JsonKey(name: 'book_id') String? bookId,
    @JsonKey(name: 'book_title') String? bookTitle,
    @JsonKey(name: 'book_usage') String? bookUsage,
    @JsonKey(name: 'library_quantity') int? libraryQuantity,
    @JsonKey(name: 'release_year') int? releaseYear,
    @JsonKey(name: 'ISBN') String? isbn,
    String? language,
    String? about,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'book_tag') String? bookTag,
    @JsonKey(name: 'author_name') String? authorName,
    @JsonKey(name: 'rating') String? rating,
    String? tag,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
