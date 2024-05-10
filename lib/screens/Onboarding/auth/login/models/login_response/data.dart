import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    String? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    @JsonKey(name: 'verification_code') String? verificationCode,
    @JsonKey(name: 'profile_image') dynamic profileImage,
    String? token,
    @JsonKey(name: 'is_verified') bool? isVerified,
    List<dynamic>? subscription,
    String? waitlist,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
