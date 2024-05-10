import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/modals/yoga_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

import '../modals/yoga_category_response.dart';

class YogaCategoryListState extends ChangeNotifier {
  final ContentType category;
  List<BookDetailsModal> albums = [];
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  YogaCategoryListState(this.category);

  load() async {
    loading = true;
    dio.Response<dynamic> response = await dioService.get(
      'yogauser/user/get-all-yoga-category-wise',
      queryParameters: {
        'category_id': category.categoryId,
        'per_page': "100",
        'page_number': 1,
      },
    ).whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    YogaResponse yogaResponse = YogaResponse.fromJson(res);
    albums = yogaResponse.data?.yogaAlbum ?? [];
    notifyListeners();
  }
}

final yogaCategoryListProvider =
    ChangeNotifierProvider.family.autoDispose((r, ContentType category) {
  return YogaCategoryListState(category)..load();
});
