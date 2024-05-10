import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/models/audio_book_carousel.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/models/meditation_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/models/music_response/music_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/modals/yoga_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/main_screen_top_response.dart';

class TopCarouselSliderState extends ChangeNotifier {
  int _activeSlide = 0;

  get activeSlide => _activeSlide;

  set activeSlide(status) {
    _activeSlide = status;
    notifyListeners();
  }

  List<BookDetailsModal> albums = [];

  load(categoryId, bookType) async {
    if (bookType == 'Yoga') {
      dio.Response<dynamic> response = await dioService.get(
        '/yogauser/user/get-yoga-category-wise',
        queryParameters: {'category_id': categoryId},
      );
      Map<String, dynamic> res = response.data;
      YogaResponse yogaResponse = YogaResponse.fromJson(res);
      albums = yogaResponse.data?.yogaAlbum ?? [];
    } else if (bookType == 'Meditation') {
      dio.Response<dynamic> response = await dioService.get(
          'meditationuser/user/get-meditation-category-wise?category_id=$categoryId');
      Map<String, dynamic> res = response.data;
      MeditationResponse meditationResponse = MeditationResponse.fromJson(res);
      albums = meditationResponse.data?.meditationAlbum ?? [];
    } else if (bookType == 'Music') {
      dio.Response<dynamic> response = await dioService.get(
          'musicuser/user/get-music-category-wise?category_id=$categoryId');
      Map<String, dynamic> res = response.data;
      MusicResponse musicResponse = MusicResponse.fromJson(res);
      albums = musicResponse.data?.musicAlbum ?? [];
    } else if (bookType == 'Audio') {
      dio.Response<dynamic> response = await dioService.get(
        'audio-book/user/get-is-featured',
        queryParameters: {'language': "en"},
      );

      Map<String, dynamic> res = response.data;
      AudioBookCarousel audioBookCarousel = AudioBookCarousel.fromJson(res);
      debugPrint("bookResponse: ${audioBookCarousel.data?.book?.length}");
      albums = audioBookCarousel.data?.book ?? [];
    } else if (bookType == 'EBook') {
      dio.Response<dynamic> response = await dioService.get(
        'bookuser/user/main-screen-top',
        queryParameters: {'language': "en"},
      );

      Map<String, dynamic> res = response.data;
      MainScreenTopResponse ebookResponse = MainScreenTopResponse.fromJson(res);
      albums = ebookResponse.data!.book!;
    }

    albums = [...albums];
    albums.shuffle(Random(10));
    notifyListeners();
  }
}

final topCarouselSliderProvider =
    ChangeNotifierProvider.family.autoDispose((r, List<String> list) {
  return TopCarouselSliderState()..load(list[0], list[1]);
});
