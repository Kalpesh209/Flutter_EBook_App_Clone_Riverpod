import 'package:freezed_annotation/freezed_annotation.dart';

import 'book_order.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    List<BookOrder>? bookOrder,
    int? count,
    @JsonKey(name: 'AllCount') int? allCount,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
