import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@freezed
class CartResponse with _$CartResponse {
  factory CartResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}
