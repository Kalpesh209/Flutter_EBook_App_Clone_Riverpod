import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/models/chapter-model/chapter_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

import '../../../../../../common/helpers/snakbar_helper.dart';
import '../../../../../../globals.dart';

class EbookDetailState extends ChangeNotifier {
  bool _isLoading = false;
  List<Chapter> chapters = [];
  List<BookDetailsModal>? book;

  get loading => _isLoading;

  set loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  late ScrollController scrollController;

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();

  //Dynamic Link
  final String DynamicLink =
      ' https://freshpage.in/app/audio_details_screen?book_id=afa04155-98df-4fb9-94e9-2b13caa13d99';
  final String Link = 'https://redirectfp.page.link/N8fh';
  String? _linkMessage;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  EbookDetailState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {}
    });
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }

  BookDetailsModal bookDetailsModal = BookDetailsModal();

  loadDetails(String? id) async {
    debugPrint('loadDetails $id');
    loading = true;
    authService.getToken().then((token) async {
      dio.Response<dynamic> response = await dioService
          .get('bookuser/user/get-book-detail/$id',
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() => loading = false);
      bookDetailsModal = (response.data['data'] != null
          ? BookDetailsModal.fromJson(response.data['data'])
          : null)!;
      notifyListeners();
    });
  }

  void getChaptersById(String bookId) async {
    loading = true;
    authService.getToken().then((token) async {
      try {
        Response<dynamic> response = await dioService
            .get("bookuser/user/get-chapter-list",
                queryParameters: {"book_id": bookId},
                options: Options(headers: {"Authorization": token}))
            .whenComplete(() => loading = false);

        ChapterResponse chapterResponse =
            ChapterResponse.fromJson(response.data!);
        debugPrint('Chapter Res: $chapterResponse');
        chapters = chapterResponse.data!.bookChapter! ?? [];
      } on DioException catch (e) {
        debugPrint('e.response!.statusCode ${e.response!.statusCode}');
      }
    });
  }

  setRating(String id, double rating) {
    bookDetailsModal.rating = rating.toString();
    notifyListeners();
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

  setChapterRead(String bookId) async {
    try {
      await dioService
          .post('bookuser/user/book-read-add',
              data: {'book_chapter_id': "", 'book_id': bookId},
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() {});
    } on DioException catch (e) {
      setChapterRead(bookId);
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }
}

final ebookDetailProvider = ChangeNotifierProvider((r) {
  return EbookDetailState();
});
