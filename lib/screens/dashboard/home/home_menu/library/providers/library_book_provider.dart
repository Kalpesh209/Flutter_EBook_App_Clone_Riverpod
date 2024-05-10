import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

import '../../../../../../common/helpers/snakbar_helper.dart';
import '../../../../../../globals.dart';

class LibraryBookDetailsState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  bool _addingToCart = false;

  get addingToCart => _addingToCart;

  set addingToCart(status) {
    _addingToCart = status;
    notifyListeners();
  }

  BookDetailsModal bookDetailsModal = BookDetailsModal();

  loadDetails(String? id) async {
    debugPrint('loadDetails $id');
    loading = true;
    authService.getToken().then((token) async {
      dio.Response<dynamic> response = await dioService
          .get('bookuser/user/get-book-detail/$id',
              options: dio.Options(headers: {"Authorization": token}))
          .whenComplete(() => loading = false);
      bookDetailsModal = (response.data['data'] != null
          ? BookDetailsModal.fromJson(response.data['data'])
          : null)!;
      notifyListeners();
    });
  }

  addToCart() async {
    addingToCart = true;
    //dio.Response<dynamic> response =
    await dioService.post(
      '/bookorder/user/add-cart',
      data: {'book_id': bookDetailsModal.id},
    ).whenComplete(() => addingToCart = false);
    bookDetailsModal.isCart = true;
    //Map<String, dynamic> res = response.data;
    notifyListeners();
  }

  removeFromCart() async {
    addingToCart = true;
    //dio.Response<dynamic> response =
    await dioService.delete(
      '/bookorder/user/delete-cart-book/${bookDetailsModal.id}',
      data: {'book_id': bookDetailsModal.id},
    ).whenComplete(() => addingToCart = false);
    bookDetailsModal.isCart = false;
    //Map<String, dynamic> res = response.data;
    notifyListeners();
  }

  likeAlbum(String trackId) async {
    /*   await dioService.post(
      'bookuser/user/wishlist',
      options: Options(headers: {"Authorization": token}),
      data: {
        "type": "book",
        "book_id": trackId,
      },
    );*/
    // Map<String, dynamic> res = response.data;
    /*  if (trackId == currentTrack!.id) {
      currentTrack =
          currentTrack!.copyWith(isFavourite: !currentTrack!.isFavourite!);
    }*/

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

  setRating(String id, double rating) {
    bookDetailsModal.rating = rating.toString();
    notifyListeners();
  }
}

final libraryDetailsProvider = ChangeNotifierProvider((r) {
  return LibraryBookDetailsState();
});
