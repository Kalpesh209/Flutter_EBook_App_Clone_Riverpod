import 'package:freezed_annotation/freezed_annotation.dart';

import 'book_master.dart';
import 'next_book_order.dart';
import 'order_address.dart';
import 'order_timeline.dart';
import 'seller.dart';
import 'user.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    String? id,
    @JsonKey(name: 'order_number') String? orderNumber,
    User? user,
    BookMaster? bookMaster,
    List<OrderAddress>? orderAddress,
    dynamic bookQty,
    @JsonKey(name: 'order_date') String? orderDate,
    @JsonKey(name: 'assign_date') dynamic assignDate,
    @JsonKey(name: 'return_date') String? returnDate,
    @JsonKey(name: 'order_status') String? orderStatus,
    @JsonKey(name: 'book_condition') dynamic bookCondition,
    dynamic image,
    dynamic remark,
    @JsonKey(name: 'expected_delivery_date') dynamic expectedDeliveryDate,
    Seller? seller,
    @JsonKey(name: 'order_timeline') List<OrderTimeline>? orderTimeline,
    @JsonKey(name: 'next_book_order') NextBookOrder? nextBookOrder,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
