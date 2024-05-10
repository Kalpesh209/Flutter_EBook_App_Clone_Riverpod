import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/search/search_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

class SelectBookSearchState extends ChangeNotifier {
  List<BookDetailsModal> books = [];
  List<BookDetailsModal> selectedBooks = [];
  bool loading = false;

  void getSearchedBooks(String searchTerm, String type) async {
    books = [];
    loading = true;
    notifyListeners();
    try {
      var response = await dioService.get(
        "bookuser/user/search",
        //?search_term=$searchTerm&language=en&content_type=$type
        queryParameters: {
          'search_term': searchTerm,
          'language': 'en',
          'content_type': type,
        },
        options: Options(headers: {"Authorization": token}),
      );

      SearchResponse ebookResponse = SearchResponse.fromJson(response.data);
      books = ebookResponse.data!.searchList!;
      debugPrint("BOOKS: ${books.length}");
      loading = false;
      notifyListeners();
    } on DioException catch (e) {
      debugPrint('DioException $e');
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }

  void getSearchedLibraryBooks(String searchTerm) async {
    books = [];
    loading = true;
    notifyListeners();
    try {
      var response = await dioService.get(
        "library/book/search",
        queryParameters: {
          'search_term': searchTerm,
          'language': 'en',
        },
        options: Options(headers: {"Authorization": token}),
      );

      SearchResponse ebookResponse = SearchResponse.fromJson(response.data);
      books = ebookResponse.data!.searchList!;
      debugPrint("BOOKS: ${books.length}");
      loading = false;
      notifyListeners();
    } on DioException catch (e) {
      debugPrint('DioException $e');
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }

  void getSearchedAudioBooks(String searchTerm) async {
    books = [];
    loading = true;
    notifyListeners();
    try {
      var response = await dioService.get(
        "audio-book/user/search",
        queryParameters: {
          'search_term': searchTerm,
          'language': 'en',
          'content_type': 'audio',
        },
        options: Options(headers: {"Authorization": token}),
      );

      SearchResponse ebookResponse = SearchResponse.fromJson(response.data);
      books = ebookResponse.data!.searchList!;
      debugPrint("BOOKS: ${books.length}");
      loading = false;
      notifyListeners();
    } on DioException catch (e) {
      debugPrint('DioException $e');
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }

  addRemoveFromSelect(String? id) {
    debugPrint('addRemoveFromSelect $id');
    for (var book in books) {
      if (book.id == id) {
        book.isCart = !(book.isCart ?? false);
      }

      if (book.isCart == true && !selectedBooks.contains(book)) {
        selectedBooks.add(book);
      }
    }
    notifyListeners();
  }

  void onBack() {
    books.clear();
    Get.back(result: selectedBooks);
  }

  void onChanged(String value) {}

  void onCloseSearch() {
    books = [];
    notifyListeners();
  }
}

final selectBookSearchBookProvider = ChangeNotifierProvider((r) {
  return SelectBookSearchState();
});
