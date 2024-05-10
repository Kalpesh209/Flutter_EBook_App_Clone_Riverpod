import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/home_notification_model.dart';

import 'home_category_model.dart';
import 'home_literarypicks_model.dart';

class AllCategoryPageResponse {
  List<HomeCategory>? data;
  bool? success;
  String? message;

  AllCategoryPageResponse({this.data, this.success, this.message});

  AllCategoryPageResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HomeCategory>[];
      json['data'].forEach((v) {
        data!.add(HomeCategory.fromJson(v));
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
