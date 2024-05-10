import 'package:freezed_annotation/freezed_annotation.dart';

part 'meditation_category.freezed.dart';
part 'meditation_category.g.dart';

@freezed
class MeditationCategory with _$MeditationCategory {
  factory MeditationCategory({
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
  }) = _MeditationCategory;

  factory MeditationCategory.fromJson(Map<String, dynamic> json) =>
      _$MeditationCategoryFromJson(json);
}
