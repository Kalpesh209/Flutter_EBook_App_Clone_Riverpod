

import 'category_ebook.dart';


class EBookCategoryPageResponse {
  List<EBookCategoryPicks>? data;
  bool? success;
  String? message;

  EBookCategoryPageResponse({this.data, this.success, this.message});

  EBookCategoryPageResponse.fromJson(Map<String, dynamic> json) {
   /* if (json['data'] != null) {
      data = <EBookCategoryPicks>[];
      json['data'].forEach((v) {
        data!.add(EBookCategoryPicks.fromJson(v));
      });
    }*/
    if (json['data'] != null) {
      data = <EBookCategoryPicks>[];
      json['data'].forEach((v) {
        data!.add(EBookCategoryPicks.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
