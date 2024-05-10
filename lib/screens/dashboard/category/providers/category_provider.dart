import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/category/models/category_page_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/home_literarypicks_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/update_dialog.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../common/helpers/snakbar_helper.dart';
import '../../home/models/home_all_category_response.dart';
import '../../home/models/home_category_model.dart';
import '../models/audio_auther_model.dart';
import '../models/audio_book_page_response.dart';
import '../models/category_ebook.dart';
import '../models/recent_read_book_model.dart';

class CategoryStateNew extends ChangeNotifier {
  bool _loading = true;
  bool isShowUpdate = true;
  bool _loading2 = true;
  String version = "";

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  get loading2 => _loading2;

  set loading2(status) {
    _loading2 = status;
    notifyListeners();
  }

  void setVersion() async {
    loading2 = true;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint("VERSION: ${packageInfo.version}");
    version = packageInfo.version;
    loading2 = false;
  }

  void checkVersion(NewVersionPlus newVersion, BuildContext context) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint('Version: ${status.originalStoreVersion}');
      debugPrint('Can Update Version: ${status.canUpdate}');
      debugPrint('local version: ${status.localVersion}');
      if (status.canUpdate && isShowUpdate == true) {
        if (!context.mounted) return;
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return UpdateDialog(
                originalStoreVersion: status.originalStoreVersion!,
                applink: status.appStoreLink,
                nothanks: () => getEBookList());
          },
        );
      }
    }
  }

  List<HomeLiteraryPicks>? eBookList;
  List<HomeLiteraryPicks>? audioBookList;
  List<HomeLiteraryPicks>? forYouBookList;

  getCategoryPageDetails() async {
    try {
      debugPrint('getCategoryPageDetails');
      loading = true;
      Response<dynamic> response = await dioService.get(
          'bookuser/user/categorypage',
          queryParameters: {'language': "en"},
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      CategoryPageResponse ebookResponse = CategoryPageResponse.fromJson(res);

      eBookList?.clear();
      eBookList = ebookResponse.data?.eBookList ?? [];
      audioBookList = ebookResponse.data?.audioBookList ?? [];
      forYouBookList = ebookResponse.data?.forYouBookList ?? [];

      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  late List<HomeLiteraryPicks> continueReadingList = [];
  late List<HomeLiteraryPicks> featureBooksList = [];
  late List<HomeLiteraryPicks> historyEBook = [];
  late List<HomeLiteraryPicks> hinduLibraryList = [];
  late List<HomeLiteraryPicks> sportLibraryList = [];
  late List<HomeLiteraryPicks> spiritualLibraryList = [];
  late List<HomeLiteraryPicks> freedomFighterlistList = [];
  late List<EBookCategoryPicks> categoryList = [];

  getEBookList() async {
    try {
      debugPrint('getEBookList');
      loading = true;
      Response<dynamic> response =
          await dioService.get('bookuser/user/ebookpageList',
              /*     queryParameters: {'language': "en"},*/
              options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      CategoryPageResponse ebookResponse = CategoryPageResponse.fromJson(res);

      continueReadingList = ebookResponse.data?.continueReadingList ?? [];
      featureBooksList = ebookResponse.data?.featureBooksList ?? [];
      historyEBook = ebookResponse.data?.historyEBook ?? [];
      hinduLibraryList = ebookResponse.data?.hinduLibraryList ?? [];
      categoryList = ebookResponse.data?.categoryList ?? [];
      sportLibraryList = ebookResponse.data?.sportLibraryList ?? [];
      spiritualLibraryList = ebookResponse.data?.spiritualLibraryList ?? [];
      freedomFighterlistList = ebookResponse.data?.freedomFighterlistList ?? [];

      debugPrint('getEBookList ${historyEBook.length}');

      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  List<HomeLiteraryPicks>? audioBookAdventure;
  List<HomeLiteraryPicks>? regionalList;
  List<HomeLiteraryPicks>? literatureList;
  List<HomeLiteraryPicks>? audioCategoryList;
  List<AuthorNotes>? authorNotesList;

  getAudioList() async {
    try {
      debugPrint('getAudioList');
      loading = true;
      Response<dynamic> response =
          await dioService.get('bookuser/user/audiopageList',
              /*     queryParameters: {'language': "en"},*/
              options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      AudioBookPageResponse ebookResponse = AudioBookPageResponse.fromJson(res);

      audioBookAdventure = ebookResponse.data?.audioBookAdventure ?? [];
      regionalList = ebookResponse.data?.regionalList ?? [];
      literatureList = ebookResponse.data?.literAtureList ?? [];
      authorNotesList = ebookResponse.data?.authorNotesList ?? [];
      audioCategoryList = ebookResponse.data?.audioCategoryList ?? [];

      debugPrint('getEBookList ${authorNotesList?.length}');

      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  List<HomeCategory>? allCategory = [];

  getEBookCategoryList(String page) async {
    try {
      debugPrint('getEBookList');
      loading = true;
      Response<dynamic> response = await dioService.get(
          'bookuser/user/get-all-ebook-category-List',
          queryParameters: {'page_number': "1"},
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      debugPrint('getEBookCategoryList ${res['data']}');

      /* EBookCategoryPageResponse ebookResponse = EBookCategoryPageResponse.fromJson(res);
      eBookCategoryList = ebookResponse.data ?? [];*/
      AllCategoryPageResponse ebookResponse =
          AllCategoryPageResponse.fromJson(res);

      allCategory?.clear();
      allCategory = ebookResponse.data ?? [];

      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  onReload() {
    getCategoryPageDetails();
  }

  List<HomeLiteraryPicks>? listBookCategoryWise = [];

  addToCart(String? id) async {
    // loading = true;
    //dio.Response<dynamic> response =
    Response<dynamic> response = await dioService.post(
      '/bookorder/user/add-cart',
      data: {'book_id': id},
    ).whenComplete(() => {});

    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      SnackbarHelper.success(res["message"]);
    } else {
      SnackbarHelper.error("Try Again");
    }

    notifyListeners();
  }

  removeFromCart(String? id) async {
    // loading = true;
    //dio.Response<dynamic> response =
    Response<dynamic> response = await dioService
        .delete(
          '/bookorder/user/delete-cart-book/$id',
          // data: {'book_id': id},
        )
        .whenComplete(() => {});
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      SnackbarHelper.success(res["message"]);
    } else {
      SnackbarHelper.error("Try Again");
    }
    //Map<String, dynamic> res = response.data;
    notifyListeners();
  }

  addRemoveFromSelect(String? id) {
    for (var book in listBookCategoryWise!) {
      if (book.id == id) {
        book.isRead = !(book.isRead ?? false);
      }
    }
    notifyListeners();
  }

  flagTrueFalse(bool? isRead) {
    isRead = !(isRead ?? false);

    debugPrint('freshpage list $isRead');

    // notifyListeners();
  }

  List<HomeCategory>? allAudioCategory = [];

  getAllAudioBookCategoryList(String page) async {
    try {
      debugPrint('getEBookList');
      loading = true;
      Response<dynamic> response = await dioService.get(
          'bookuser/user/get-all-audiobook-category-List',
          queryParameters: {'page_number': "1"},
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      debugPrint('getEBookCategoryList ${res['data']}');

      /* EBookCategoryPageResponse ebookResponse = EBookCategoryPageResponse.fromJson(res);
      eBookCategoryList = ebookResponse.data ?? [];*/
      AllCategoryPageResponse ebookResponse =
          AllCategoryPageResponse.fromJson(res);

      allAudioCategory?.clear();
      allAudioCategory = ebookResponse.data ?? [];

      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  List<HomeLiteraryPicks> allReadBookList = [];
  List<HomeLiteraryPicks> recentReadBookList = [];

  getAllReadBook(String page) async {
    try {
      debugPrint('getEBookList');
      loading = true;
      Response<dynamic> response = await dioService.get(
          'bookuser/user/get-all-read-book',
          queryParameters: {'page_number': page},
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      debugPrint('getAllReadBook ${res['data']}');

      RecentReadBookResponse ebookResponse =
          RecentReadBookResponse.fromJson(res);
      recentReadBookList.clear();
      allReadBookList?.clear();
      allReadBookList = ebookResponse.data ?? [];

      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  getRecentReadBook(String page) async {
    try {
      debugPrint('getEBookList');
      loading = true;
      Response<dynamic> response = await dioService.get(
          'bookuser/user/get-recent-read-book',
          queryParameters: {'page_number': page},
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      debugPrint('getAllReadBook ${res['data']}');

      RecentReadBookResponse ebookResponse =
          RecentReadBookResponse.fromJson(res);
      allReadBookList.clear();
      recentReadBookList?.clear();
      recentReadBookList = ebookResponse.data ?? [];

      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  List<HomeLiteraryPicks> getExplorerBookList = [];

  getExplorerBook() async {
    try {
      debugPrint('getEBookList');
      loading = true;
      Response<dynamic> response = await dioService.get(
          'bookuser/user/get-explorer-book',
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      debugPrint('getAllReadBook ${res['data']}');

      RecentReadBookResponse ebookResponse =
          RecentReadBookResponse.fromJson(res);

      getExplorerBookList = ebookResponse.data ?? [];

      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  List<HomeLiteraryPicks>? audioBookViewAll = [];
  audioBookView() async {
    try {
      debugPrint('getEBookList');
      loading = true;
      Response<dynamic> response = await dioService.get(
          'bookuser/user/getallaudiobook',
          queryParameters: {"page_number": "1"},
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      debugPrint('audioBookView ${res['data']}');

      RecentReadBookResponse ebookResponse =
          RecentReadBookResponse.fromJson(res);

      audioBookViewAll = ebookResponse.data ?? [];
      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }
}

final categoryProviderNew = ChangeNotifierProvider((r) {
  return CategoryStateNew();
});
