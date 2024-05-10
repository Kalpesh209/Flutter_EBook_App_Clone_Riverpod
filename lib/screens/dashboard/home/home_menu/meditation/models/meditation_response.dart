import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class MeditationResponse {
  Data? data;
  bool? success;
  String? message;

  MeditationResponse({this.data, this.success, this.message});

  MeditationResponse.fromJson(Map<String, dynamic> json) {
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
  List<BookDetailsModal>? meditationAlbum;
  int? count;
  int? allCount;

  Data({this.meditationAlbum, this.count, this.allCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['meditationAlbum'] != null) {
      meditationAlbum = <BookDetailsModal>[];
      json['meditationAlbum'].forEach((v) {
        meditationAlbum!.add(BookDetailsModal.fromJson(v));
      });
    }
    count = json['count'];
    allCount = json['AllCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meditationAlbum != null) {
      data['meditationAlbum'] =
          meditationAlbum!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['AllCount'] = allCount;
    return data;
  }
}
