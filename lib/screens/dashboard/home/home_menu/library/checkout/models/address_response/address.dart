import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address({
    String? id,
    @JsonKey(name: 'zip_code') dynamic zipCode,
    String? type,
    String? name,
    String? city,
    String? address,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    @JsonKey(name: 'address_line_1') String? address_line_1,
    @JsonKey(name: 'address_line_2')  String? address_line_2,
    @JsonKey(name: 'address_line_3')  String? address_line_3,
    String? landmark,
    String? latitude,
    String? longitude,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
