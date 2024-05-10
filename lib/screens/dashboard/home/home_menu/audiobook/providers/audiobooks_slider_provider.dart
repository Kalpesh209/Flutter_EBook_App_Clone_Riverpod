import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/models/audio_book_carousel.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

class AudioBookSliderState extends ChangeNotifier {
  int _activeSlide = 0;
  get activeSlide => _activeSlide;
  set activeSlide(status) {
    _activeSlide = status;
    notifyListeners();
  }

  List<BookDetailsModal> carouselBooks = [];
  bool _isLoading = false;
  get loading => _isLoading;
  set loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  void getAudiobooksCarousel() async {
    loading = true;
    try {
      Response<dynamic> response = await dioService
          .get('audio-book/user/get-is-featured',
              queryParameters: {'language': "en"},
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() => loading = false);

      Map<String, dynamic> res = response.data;
      AudioBookCarousel audioBookCarousel = AudioBookCarousel.fromJson(res);
      debugPrint("bookResponse: ${audioBookCarousel.data?.book?.length}");
      carouselBooks = audioBookCarousel.data?.book ?? [];
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }
}

final audioBookSliderProvider = ChangeNotifierProvider.autoDispose((r) {
  return AudioBookSliderState();
});
