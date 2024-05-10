import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/models/meditation_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/models/music_response/music_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class ViewAllScreenState extends ChangeNotifier {
  bool _loading = false;
  List<BookDetailsModal> musicAlbum = [];
  int musicCount = 0;
  int meditationCount = 0;
  List<BookDetailsModal> meditationAlbum = [];
  String _categoryId = "";
  get id => _categoryId;
  set id(val) {
    _categoryId = val;
    notifyListeners();
  }

  void setmusicEmpty() {
    musicAlbum.clear();
  }

  void setmeditationEmpty() {
    meditationAlbum.clear();
  }

  void setPageNo() {
    pageNo = 0;
  }

  get loading => _loading;
  int pageNo = 0;
  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  void setId(String idd) {
    id = idd;
  }

  void getMusicAlbum() async {
    pageNo++;
    debugPrint('pageNo $pageNo');
    loading = true;
    try {
      Response<dynamic> response = await dioService
          .get(
              'musicuser/user/get-all-music-category-wise?category_id=$id&per_page=10&page_number=$pageNo',
              // queryParameters: {'language': "en"},
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() => loading = false);
      Map<String, dynamic> res = response.data;
      MusicResponse musicResponse = MusicResponse.fromJson(res);
      musicCount = musicResponse.data!.allCount!;
      musicAlbum.addAll(musicResponse.data!.musicAlbum!);
      debugPrint('musicAlbum.length ${musicAlbum.length}');
      notifyListeners();
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }

  void getMeditationAlbum() async {
    debugPrint('category_id=$id');
    pageNo++;
    loading = true;
    try {
      Response<dynamic> response = await dioService
          .get(
              'meditationuser/user/get-all-meditation-category-wise?category_id=$id&per_page=10&page_number=$pageNo',
              // queryParameters: {'language': "en"},
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() => loading = false);
      Map<String, dynamic> res = response.data;
      MeditationResponse meditationResponse = MeditationResponse.fromJson(res);
      meditationAlbum.addAll(meditationResponse.data!.meditationAlbum!);
      meditationCount = meditationResponse.data!.allCount!;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }

  // void getEbooksByLanguage() async {
  //   loading = true;
  //   try {
  //     Response<dynamic> response = await Dio()
  //         .get(
  //             'bookuser/user/main-screen-top?language=en',
  //             // queryParameters: {'language': "en"},
  //             options: Options(headers: {"Authorization": token}))
  //         .whenComplete(() => loading = false);

  //     Map<String, dynamic> res = response.data;
  //     EbookResponse ebookResponse = EbookResponse.fromJson(res);
  //     print("bookResponse: ${ebookResponse.data!.book}");
  //     books = ebookResponse.data!.book!;
  //   } on DioException catch (e) {
  //     if (e.response!.statusCode == 404) {
  //       debugPrint('${e.response}');
  //     }
  //   }
  // }
}

final viewallprovider = ChangeNotifierProvider((r) {
  return ViewAllScreenState();
});

// final allebooksProvider = FutureProvider((ref) async {
//   final apidata = ref.read(ebookScreenProvider);
//   return apidata.getEbooksByLanguage();
// });
