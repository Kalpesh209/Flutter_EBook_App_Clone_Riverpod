import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_address.freezed.dart';
part 'order_address.g.dart';

@freezed
class OrderAddress with _$OrderAddress {
  factory OrderAddress({
    String? id,
    String? type,
    String? name,
    String? city,
    String? address,
    String? latitude,
    String? longitude,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    @JsonKey(name: 'zip_code') int? zipCode,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _OrderAddress;

  factory OrderAddress.fromJson(Map<String, dynamic> json) =>
      _$OrderAddressFromJson(json);
}
