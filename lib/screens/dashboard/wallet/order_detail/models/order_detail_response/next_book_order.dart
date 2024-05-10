import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_address.dart';
import 'seller.dart';

part 'next_book_order.freezed.dart';
part 'next_book_order.g.dart';

@freezed
class NextBookOrder with _$NextBookOrder {
  factory NextBookOrder({
    dynamic id,
    @JsonKey(name: 'order_number') dynamic orderNumber,
    dynamic user,
    dynamic bookMaster,
    List<OrderAddress>? orderAddress,
    dynamic bookQty,
    @JsonKey(name: 'order_date') dynamic orderDate,
    @JsonKey(name: 'assign_date') dynamic assignDate,
    @JsonKey(name: 'return_date') dynamic returnDate,
    @JsonKey(name: 'order_status') dynamic orderStatus,
    @JsonKey(name: 'book_condition') dynamic bookCondition,
    dynamic image,
    dynamic remark,
    Seller? seller,
  }) = _NextBookOrder;

  factory NextBookOrder.fromJson(Map<String, dynamic> json) =>
      _$NextBookOrderFromJson(json);
}