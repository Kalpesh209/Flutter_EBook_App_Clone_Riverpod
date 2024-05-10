import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class YogaResponse {
  Data? data;
  bool? success;
  String? message;

  YogaResponse({this.data, this.success, this.message});

  YogaResponse.fromJson(Map<String, dynamic> json) {
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
  List<BookDetailsModal>? yogaAlbum;
  int? count;
  int? allCount;

  Data({this.yogaAlbum, this.count, this.allCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['yogaAlbum'] != null) {
      yogaAlbum = <BookDetailsModal>[];
      json['yogaAlbum'].forEach((v) {
        yogaAlbum!.add(BookDetailsModal.fromJson(v));
      });
    }
    count = json['count'];
    allCount = json['AllCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (yogaAlbum != null) {
      data['yogaAlbum'] = yogaAlbum!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['AllCount'] = allCount;
    return data;
  }
}
