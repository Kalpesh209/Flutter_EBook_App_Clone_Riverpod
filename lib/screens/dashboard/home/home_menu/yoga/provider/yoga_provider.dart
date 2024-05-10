import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/modals/yoga_category_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class YogaScreenState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  List<ContentType> categories = [];
  List<BookDetailsModal> lastPlayed = [];

  void addLastPlayedId(String id) async {
    final String? strings = await storageService.read(key: "lastPlayed");
    if (strings == null) {
      final List<String> ids = [];
      ids.add(id);
      await storageService.write(key: "lastPlayed", value: jsonEncode(ids));
    } else {
      final List<dynamic> ids = jsonDecode(strings);
      if (!ids.contains(id)) {
        ids.add(id);

        await storageService.write(key: "lastPlayed", value: jsonEncode(ids));
      }
    }
    debugPrint("CHAPTER ADDED");
    notifyListeners();
  }

  void lastPlayedAlbum() async {
    // loading = true;
    lastPlayed = [];
    final String? ids = await storageService.read(key: "lastPlayed");
    if (ids != null && ids.isNotEmpty) {
      for (var id in jsonDecode(ids)) {
        try {
          Response<dynamic> response = await dioService.get(
            "musicuser/user/get-music-detail/$id",
            options: Options(headers: {"Authorization": token}),
          );
          BookDetailsModal album =
              BookDetailsModal.fromJson(response.data["data"]);
          debugPrint("Album data: ${album.subTitle}");

          if (!lastPlayed.contains(album)) {
            lastPlayed.add(album);
            // loading = false;
            notifyListeners();
          }
        } on DioException catch (_) {
          // print(e.message);
        }
        // EbookResponse bookResponse= EbookResponse.fromJson(responsee.data);
        // continueReadingbooks.add();
      }
    }
  }

  loadCategories() async {
    loading = true;
    dio.Response<dynamic> response = await dioService.get(
      'category/user/get-category-type-list',
      queryParameters: {
        'type': 'Yoga',
        'language': "en",
      },
    ).whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    YogaCategoryResponse yogaCategoryResponse =
        YogaCategoryResponse.fromJson(res);
    categories = yogaCategoryResponse.data!.contentType!
        .map((e) => ContentType.fromJson(e.toJson()))
        .toList();
    notifyListeners();
  }
}

final yogaScreenProvider = ChangeNotifierProvider.autoDispose((r) {
  return YogaScreenState();
});
