import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/constants_db.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/models/chapter-model/chapter_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper/refreshpage.dart';

class ChapterScreenState extends ChangeNotifier {
  late int currentIndex = 0;
  late String bookId = "";
  late String lastReadChapterId = "";
  late Chapter currentChapter = Chapter();
  late Timer mTimer;
  List<Chapter> chapters = [];
  int chapterStayTime = 0;

  bool _isLoading = false;

  String chapterIdLastRead = "";

  get loading => _isLoading;

  set loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  void startTimer() {
    debugPrint('chapterStayTime $chapterStayTime');
    mTimer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (chapterStayTime == 1) {
          setChapterRead();
        } else {
          chapterStayTime++;
        }
      },
    );
  }

  Future<void> setCurrentChapter(Chapter chapter, String id) async {
    chapterIdLastRead = chapter.id.toString();
    debugPrint('chapterId :$chapterIdLastRead');
    currentChapter = chapter;
    chapterStayTime = 0;
    bookId = id;
    startTimer();
    notifyListeners();
  }

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void addBookId(String id) async {
    final String? strings =
        await storageService.read(key: continueReadingEbook);
    if (strings == null) {
      final List<String> ids = [];
      ids.add(id);
      await storageService.write(
          key: continueReadingEbook, value: jsonEncode(ids));
    } else {
      final List<dynamic> ids = jsonDecode(strings);
      if (!ids.contains(id)) {
        ids.add(id);

        await storageService.write(
            key: continueReadingEbook, value: jsonEncode(ids));
      }
    }
    debugPrint("CHAPTER ADDED");
    notifyListeners();
  }

  setChapterRead() async {
    try {
      //Response<dynamic> response =
      /*  await dioService
          .get('bookuser/user/chapter-read/${currentChapter.id}',
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() {
        mTimer.cancel();
      });*/

      await dioService
          .post('bookuser/user/book-read-add',
              data: {'book_chapter_id': currentChapter.id, 'book_id': bookId},
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() {
        mTimer.cancel();
      });
      //Map<String, dynamic> res = response.data;

      RefreshPage().once(1);
    } on DioException catch (e) {
      setChapterRead();
      if (e.response!.statusCode == 404) {
        debugPrint('${e.response}');
      }
    }
  }

  void getChaptersById(String bookId, String chapterId) async {
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

        debugPrint('ChapterIdfromApi :$chapterId');
        if (chapters.isNotEmpty) {
          for (int i = 0; i < chapters.length; i++) {
            if (chapters[i].id == chapterId) {
              currentIndex = i;
              currentChapter = chapters[i];
            }
          }
        }
      } on DioException catch (e) {
        debugPrint('e.response!.statusCode ${e.response!.statusCode}');
      }
    });
  }
}

final chapterProvider = ChangeNotifierProvider((ref) {
  return ChapterScreenState();
});
