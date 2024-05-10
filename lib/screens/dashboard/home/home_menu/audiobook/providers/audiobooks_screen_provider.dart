import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/constants_db.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/models/all_audio_book_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/models/audioooksCategory/audiobooks_category_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class AudioBooksScreenState extends ChangeNotifier {
  List<Category> categories = [];
  List<BookDetailsModal> continueReadingBooks = [];
  List<BookDetailsModal> carouselBooks = [];
  List<BookDetailsModal> trendingBooks = [];
  bool _isLoading = false;
  bool _isLoading2 = false;

  get loading => _isLoading;

  int pageNo = 0;
  List<BookDetailsModal> books = [];
  String _categoryId = "";

  get id => _categoryId;

  set id(val) {
    _categoryId = val;
    notifyListeners();
  }

  int _count = 0;

  get count => _count;

  set count(val) {
    _count = val;
    notifyListeners();
  }

  set loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  get loading2 => _isLoading2;

  set loading2(status) {
    _isLoading2 = status;
    notifyListeners();
  }

  void setBooksEmpty() {
    books.clear();
  }

  void setPageNo() {
    pageNo = 0;
  }

  void setId(String idd) {
    id = idd;
  }

  void getBooks() async {
    pageNo++;
    loading = true;
    try {
      Response<dynamic> response = await dioService
          .get('audio-book/user/get-all-book-category-wise',
              queryParameters: {
                'category_id': id,
                'language': "en",
                'per_page': "10",
                'page_number': pageNo,
              },
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() => loading = false);
      AllAudioBookResponse audioBookResponse =
          AllAudioBookResponse.fromJson(response.data);
      debugPrint('response.data ${response.data}');
      count = audioBookResponse.data?.allCount ?? 0;
      books.addAll(audioBookResponse.data?.book ?? []);
      notifyListeners();
    } on DioException catch (e) {
      debugPrint('e $e');
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }

  void continueReading() async {
    _isLoading2 = true;
    final String? ids = await storageService.read(key: continueListeningAudio);
    if (ids != null && ids.isNotEmpty) {
      for (var id in jsonDecode(ids)) {
        try {
          debugPrint('audio-book/user/get-book-detail/$id');
          Response<dynamic> responsee = await dioService.get(
            "audio-book/user/get-book-detail/$id",
            options: Options(headers: {"Authorization": token}),
          );

          if (responsee.data.containsKey('data')) {
            BookDetailsModal newBook =
                BookDetailsModal.fromJson(responsee.data["data"]);

            continueReadingBooks
                .removeWhere((element) => element.id == newBook.id);

            continueReadingBooks.add(newBook);
          }
        } on DioException catch (_) {}
      }
      _isLoading2 = false;
    }
    _isLoading2 = false;
    notifyListeners();
  }

  void getBooksByCategory() async {
    debugPrint('getBooksByCategory');
    loading = true;
    try {
      Response<dynamic> response = await dioService
          .get("audio-book/user/get-audio-book-with-category",
              queryParameters: {
                'language': 'en',
              },
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() {
        loading = false;
      });
      debugPrint('response ${response.data}');
      Audiobookcategorimodel audioBooksResponse =
          Audiobookcategorimodel.fromJson(response.data);
      debugPrint(
          "Audio categories: ${audioBooksResponse.data.category.length}");
      categories = audioBooksResponse.data.category;
      //continueReading();
    } on DioException catch (e) {
      debugPrint('${e.response!.statusCode}');
    }
  }
}

final audiobooksScreenProvider =
    ChangeNotifierProvider((ref) => AudioBooksScreenState());
