import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'order_detail_response.freezed.dart';
part 'order_detail_response.g.dart';

@freezed
class OrderDetailResponse with _$OrderDetailResponse {
  factory OrderDetailResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _OrderDetailResponse;

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailResponseFromJson(json);
}
