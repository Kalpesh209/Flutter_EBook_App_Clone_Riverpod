import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_type.freezed.dart';
part 'content_type.g.dart';

@freezed
class ContentType with _$ContentType {
  factory ContentType({
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
  }) = _ContentType;

  factory ContentType.fromJson(Map<String, dynamic> json) =>
      _$ContentTypeFromJson(json);
}
