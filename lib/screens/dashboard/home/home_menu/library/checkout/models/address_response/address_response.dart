import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'address_response.freezed.dart';
part 'address_response.g.dart';

@freezed
class AddressResponse with _$AddressResponse {
  factory AddressResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _AddressResponse;

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);
}
