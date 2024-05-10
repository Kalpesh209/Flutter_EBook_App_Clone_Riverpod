import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'assign_book_response.freezed.dart';
part 'assign_book_response.g.dart';

@freezed
class AssignBookResponse with _$AssignBookResponse {
  factory AssignBookResponse({
    Data? data,
    bool? success,
    String? message,
  }) = _AssignBookResponse;

  factory AssignBookResponse.fromJson(Map<String, dynamic> json) =>
      _$AssignBookResponseFromJson(json);
}