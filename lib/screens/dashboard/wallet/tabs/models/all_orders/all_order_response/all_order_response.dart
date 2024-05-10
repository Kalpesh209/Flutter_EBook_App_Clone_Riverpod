import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'all_order_response.freezed.dart';
part 'all_order_response.g.dart';

@freezed
class AllOrderResponse with _$AllOrderResponse {
  factory AllOrderResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _AllOrderResponse;

  factory AllOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$AllOrderResponseFromJson(json);
}