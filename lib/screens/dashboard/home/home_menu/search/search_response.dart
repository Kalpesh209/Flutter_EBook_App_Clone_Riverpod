import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class SearchResponse {
  Data? data;
  bool? success;
  String? message;

  SearchResponse({this.data, this.success, this.message});

  SearchResponse.fromJson(Map<String, dynamic> json) {
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
  List<BookDetailsModal>? searchList;

  Data({this.searchList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['searchList'] != null) {
      searchList = <BookDetailsModal>[];
      json['searchList'].forEach((v) {
        searchList!.add(BookDetailsModal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (searchList != null) {
      data['searchList'] = searchList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
