import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class TrendingBooksResponse {
  Data? data;
  bool? success;
  String? message;

  TrendingBooksResponse({this.data, this.success, this.message});

  TrendingBooksResponse.fromJson(Map<String, dynamic> json) {
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
  List<BookDetailsModal>? trendingbook;

  Data({this.trendingbook});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['trendingbook'] != null) {
      trendingbook = <BookDetailsModal>[];
      json['trendingbook'].forEach((v) {
        trendingbook!.add(BookDetailsModal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (trendingbook != null) {
      data['trendingbook'] = trendingbook!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
