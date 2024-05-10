import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'out_of_box_response.freezed.dart';
part 'out_of_box_response.g.dart';

@freezed
class OutOfBoxResponse with _$OutOfBoxResponse {
  factory OutOfBoxResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _OutOfBoxResponse;

  factory OutOfBoxResponse.fromJson(Map<String, dynamic> json) =>
      _$OutOfBoxResponseFromJson(json);
}
