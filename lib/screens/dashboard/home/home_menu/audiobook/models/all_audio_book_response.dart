import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class AllAudioBookResponse {
  Data? data;
  bool? success;
  String? message;

  AllAudioBookResponse({this.data, this.success, this.message});

  AllAudioBookResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Data {
  List<BookDetailsModal>? book;
  int? count;
  int? allCount;

  Data({this.book, this.count, this.allCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['book'] != null) {
      book = <BookDetailsModal>[];
      json['book'].forEach((v) {
        book!.add(BookDetailsModal.fromJson(v));
      });
    }
    count = json['count'];
    allCount = json['AllCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (book != null) {
      data['book'] = book!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['AllCount'] = allCount;
    return data;
  }
}
