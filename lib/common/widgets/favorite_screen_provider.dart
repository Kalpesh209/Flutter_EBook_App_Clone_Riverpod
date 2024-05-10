import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_model/favorute_page_response.dart';
import '../../common_model/favourite_book_model.dart';
import '../../globals.dart';

import '../../screens/dashboard/home/models/home_literarypicks_model.dart';
import '../models/favorite_model.dart';

class FavoriteState extends ChangeNotifier {
  bool loading = true;
/*  List<FavoriteEbook> favoritebooks = [];
  List<FavouriteMusic> favoriteMusic = [];
  List<BookDetailsModal> favoriteYoga = [];
  List<FavoriteMeditation> favoriteMeditation = [];*/

  List<FavouriteBookPicks>? favouriteBook = [];
  List<FavouriteBookPicks>? favouriteAudio = [];
  List<FavouriteBookPicks>? favouriteEBook = [];

  void getFavorites() async {
    try {
      Response<dynamic> response = await dioService.get(
        "bookuser/user/wishlist?language=en",
        options: Options(headers: {"Authorization": token}),
      );

      Map<String, dynamic> res = response.data;
      FavoritePageResponse ebookResponse = FavoritePageResponse.fromJson(res);

      favouriteBook = ebookResponse.data?.favouriteBook ?? [];
      favouriteAudio = ebookResponse.data?.favouriteAudio ?? [];
      favouriteEBook = ebookResponse.data?.favouriteEBook ?? [];

      /* FavoriteResponse res = FavoriteResponse.fromJson(response.data);
      debugPrint("Res: ${res.data}");
      debugPrint("Music: ${res.data!.favouriteMusic}");
      favoriteYoga = res.data!.favouriteYoga!;
      favoritebooks = res.data!.favouriteBook!;
      favoriteMeditation = res.data!.favouriteMeditation!;
      favoriteMusic = res.data!.favouriteMusic!;*/

      loading = false;
      notifyListeners();
      debugPrint('res $res');
    } on DioException catch (e) {
      debugPrint('e $e');
    }
  }
}

final favoriteProvider = ChangeNotifierProvider((r) {
  return FavoriteState();
});
