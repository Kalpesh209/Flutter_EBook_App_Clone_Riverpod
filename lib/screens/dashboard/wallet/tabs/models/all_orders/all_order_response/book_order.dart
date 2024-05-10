import 'package:freezed_annotation/freezed_annotation.dart';

import 'book_master.dart';
import 'order_address.dart';
import 'order_timeline.dart';
import 'user.dart';

part 'book_order.freezed.dart';
part 'book_order.g.dart';

@freezed
class BookOrder with _$BookOrder {
  factory BookOrder({
    @JsonKey(name: 'order_id') String? orderId,
    @JsonKey(name: 'book_title') String? bookTitle,
    @JsonKey(name: 'release_year') int? releaseYear,
    String? language,
    String? about,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'book_tag') String? bookTag,
    String? tag,
    @JsonKey(name: 'is_publish') bool? isPublish,
    @JsonKey(name: 'order_number') String? orderNumber,
    User? user,
    BookMaster? bookMaster,
    List<OrderAddress>? orderAddress,
    @JsonKey(name: 'order_date') String? orderDate,
    @JsonKey(name: 'assign_date') dynamic assignDate,
    @JsonKey(name: 'return_date') String? returnDate,
    @JsonKey(name: 'delivery_date') String? delivaryDate,
    @JsonKey(name: 'order_status') String? orderStatus,
    @JsonKey(name: 'book_condition') dynamic bookCondition,
    dynamic image,
    dynamic remark,
    @JsonKey(name: 'order_timeline') List<OrderTimeline>? orderTimeline,
  }) = _BookOrder;

  factory BookOrder.fromJson(Map<String, dynamic> json) =>
      _$BookOrderFromJson(json);
}
