import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_category.freezed.dart';
part 'music_category.g.dart';

@freezed
class MusicCategory with _$MusicCategory {
  factory MusicCategory({
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
  }) = _MusicCategory;

  factory MusicCategory.fromJson(Map<String, dynamic> json) =>
      _$MusicCategoryFromJson(json);
}
