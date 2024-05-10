import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class YogaBookDetailsResponse {
  Data? data;
  bool? success;
  String? message;

  YogaBookDetailsResponse({this.data, this.success, this.message});

  YogaBookDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  List<BookDetailsModal>? yogaChapter;

  Data({this.yogaChapter});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['yogaChapter'] != null) {
      yogaChapter = <BookDetailsModal>[];
      json['yogaChapter'].forEach((v) {
        yogaChapter!.add(BookDetailsModal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (yogaChapter != null) {
      data['yogaChapter'] = yogaChapter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
