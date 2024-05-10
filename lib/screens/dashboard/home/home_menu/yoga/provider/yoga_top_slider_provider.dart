import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/modals/yoga_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class YogaTopSliderState extends ChangeNotifier {
  int _activeSlide = 0;

  get activeSlide => _activeSlide;

  set activeSlide(status) {
    _activeSlide = status;
    notifyListeners();
  }

  List<BookDetailsModal> albums = [];

  load(categoryId) async {
    dio.Response<dynamic> response = await dioService.get(
      '/yogauser/user/get-yoga-category-wise',
      queryParameters: {'category_id': categoryId},
    );
    Map<String, dynamic> res = response.data;
    YogaResponse yogaResponse = YogaResponse.fromJson(res);
    albums = yogaResponse.data?.yogaAlbum ?? [];

    albums = [...albums];
    albums.shuffle(Random(10));
    notifyListeners();
    // Future.delayed(const Duration(milliseconds: 100), () => notifyListeners());
  }
}

final yogaTopSliderProvider =
    ChangeNotifierProvider.family.autoDispose((r, String categoryId) {
  return YogaTopSliderState()..load(categoryId);
});
