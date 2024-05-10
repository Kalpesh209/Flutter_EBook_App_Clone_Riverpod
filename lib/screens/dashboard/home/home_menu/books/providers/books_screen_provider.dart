import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/constants_db.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/models/booksCategory/books_category_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/main_screen_top_response.dart';

import '../../../../../../common/helpers/snakbar_helper.dart';

class BooksScreenState extends ChangeNotifier {
  List<Category> categories = [];
  List<BookDetailsModal?> continueReadingbooks = [];
  List<BookDetailsModal> carouselBooks = [];
  List<BookDetailsModal> trendingBooks = [];
  bool _isLoading = false;
  bool _isLoading2 = false;

  get loading => _isLoading;

  set loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  get loading2 => _isLoading2;

  set loading2(status) {
    _isLoading2 = status;
    notifyListeners();
  }

  void continueReading() async {
    loading2 = true;
    final String? ids = await storageService.read(key: continueReadingEbook);
    debugPrint('ids $ids');
    if (ids != null && ids.isNotEmpty) {
      for (var id in jsonDecode(ids)) {
        try {
          Response<dynamic> responsee = await dioService.get(
            "bookuser/user/get-book-detail/$id",
            options: Options(headers: {"Authorization": token}),
          );
          if (responsee.data.containsKey('data')) {
            BookDetailsModal newBook =
                BookDetailsModal.fromJson(responsee.data["data"]);
            continueReadingbooks
                .removeWhere((element) => element!.id == newBook.id);

            continueReadingbooks.add(newBook);
          }
        } on DioException catch (_) {}
      }
      loading2 = false;
    }
    loading2 = false;
  }

  void getEbooksCarousel() async {
    loading = true;
    try {
      Response<dynamic> response = await dioService
          .get('bookuser/user/main-screen-top?language=en',
              // queryParameters: {'language': "en"},
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() => loading = false);

      Map<String, dynamic> res = response.data;
      MainScreenTopResponse ebookResponse = MainScreenTopResponse.fromJson(res);
      carouselBooks = ebookResponse.data!.book!;
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }

  void getbooksByCategory() async {
    loading = true;
    try {
      Response<dynamic> response = await dioService
          .get("bookuser/user/get-e-book-with-category?language=en",
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() {
        loading = false;
      });
      Map<String, dynamic> res = response.data;
      CategoryEbookResponse ebooksResponse =
          CategoryEbookResponse.fromJson(res);
      categories = ebooksResponse.data!.category!;
      // continueReading();
    } on DioException catch (e) {
      debugPrint('e.response!.statusCode ${e.response!.statusCode}');
    }
  }

  likeAlbum(String trackId) async {
    Response<dynamic> response = await dioService.post(
      'bookuser/user/wishlist',
      options: Options(headers: {"Authorization": token}),
      data: {
        "type": "book",
        "book_id": trackId,
      },
    );
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      SnackbarHelper.success(res["message"]);
    } else {
      SnackbarHelper.error("Try Again");
    }

    notifyListeners();
  }
}

final booksScreenProvider = ChangeNotifierProvider((ref) => BooksScreenState());
