import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    List<BookDetailsModal>? musicAlbum,
    int? count,
    @JsonKey(name: 'AllCount') int? allCount,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
