import 'package:freezed_annotation/freezed_annotation.dart';

import 'address.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    List<Address>? address,
    int? count,
    @JsonKey(name: 'AllCount') int? allCount,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
