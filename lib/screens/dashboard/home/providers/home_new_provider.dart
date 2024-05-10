import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/home_literarypicks_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/home_page_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/rewards_sync_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/update_dialog.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/helpers/snakbar_helper.dart';
import '../home_menu/library/checkout/models/cart_response/cart_response.dart';
import '../models/home_all_category_response.dart';
import '../models/home_category_model.dart';
import '../models/home_notification_model.dart';
import '../models/home_viewall_response.dart';

class HomeStateNew extends ChangeNotifier {
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
                nothanks: () => getHomePageDetails());
          },
        );
      }
    }
  }

  checkRewardsCall(BuildContext context) async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();

    SharedPreferences preferences = await prefs;
    Object? lastVisitDate = preferences.get("is_reward_show");

    String toDayDate = DateTime.now()
        .day
        .toString(); // Here is you just get only date not Time.

    if (toDayDate == lastVisitDate) {
      // this is the user same day visit again and again
    } else {
      // this is the user first time visit
      preferences.setString("is_reward_show", toDayDate);
      checkRewards(context);
    }
  }

  void checkRewards(BuildContext context) async {
    try {
      debugPrint('checkRewards');
      loading = true;
      Response<dynamic> response = await dioService.get('rewards/sync',
          queryParameters: {'language': "en"},
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      RewardsSyncResponse syncResponse = RewardsSyncResponse.fromJson(res);
      String syncPoints = getSyncPoints(syncResponse.data?.syncDay);
      rewardsSyncSave(syncPoints);
      rewardCard(context, syncPoints);
      dailyReward(context, syncResponse.data?.syncDay);
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  String getSyncPoints(int? syncDay) {
    String points = '';
    if (syncDay == 1) {
      points = '10';
    } else if (syncDay == 1) {
      points = '20';
    } else if (syncDay == 3) {
      points = '30';
    } else if (syncDay == 4) {
      points = '40';
    } else if (syncDay == 5) {
      points = '50';
    } else if (syncDay == 6) {
      points = '60';
    } else if (syncDay == 7) {
      points = '100';
    } else {
      points = '10';
    }
    return points;
  }

  Future<void> dailyReward(BuildContext context, int? currentDay) async {
    await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return RewardDialog(currentDay: currentDay);
      },
    );
  }

  Future<void> rewardCard(BuildContext context, String? syncDay) async {
    await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return RewardCardDialog(syncDay: syncDay);
      },
    );
  }

  rewardsSyncSave(points) async {
    try {
      debugPrint('getHomePageDetails');
      loading = true;
      Response<dynamic> response = await dioService.post('rewards/sync/save',
          data: {"point": points},
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
    }
  }

  List<HomeCategory>? homeCategory = [];
  List<HomeNotification>? notificationList = [];
  List<HomeLiteraryPicks>? homeLiteraryPicks = [];
  List<HomeLiteraryPicks>? homeSliderOne = [];
  List<HomeLiteraryPicks>? homeSliderTwo = [];
  List<HomeLiteraryPicks>? homeGenreYouLoved = [];
  List<HomeLiteraryPicks>? homeFreshPageEdits = [];
  List<HomeLiteraryPicks>? homeTrendingBook = [];
  List<HomeLiteraryPicks>? homeStaffPicks = [];
  List<HomeLiteraryPicks>? homeHistory = [];
  List<HomeLiteraryPicks>? homeTopPicks = [];
  List<HomeLiteraryPicks>? homeSimilartitles = [];

  List<BookDetailsModal>? listOfLibrary = [];
  List<BookDetailsModal>? listOfEbook = [];
  List<BookDetailsModal>? listOfMeditation = [];
  List<BookDetailsModal>? listOfYoga = [];
  List<BookDetailsModal>? listOfMusic = [];
  List<BookDetailsModal>? listOfComic = [];
  List<BookDetailsModal>? listOfAudio = [];
  List<dynamic>? listOfFeaturedCategory = [];

  getHomePageDetails() async {
    try {
      Trace customTrace =
          FirebasePerformance.instance.newTrace('bookuser/user/homepage');
      await customTrace.start();

      debugPrint('getHomePageDetails');
      loading = true;
      Response<dynamic> response = await dioService.get(
          'bookuser/user/homepage',
          queryParameters: {'language': "en"},
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      HomePageResponse ebookResponse = HomePageResponse.fromJson(res);

      homeCategory?.clear();
      homeCategory = ebookResponse.data?.homeCategory ?? [];
      notificationList = ebookResponse.data?.homeNotification ?? [];
      homeLiteraryPicks = ebookResponse.data?.homeLiteraryPicks ?? [];
      homeSliderOne = ebookResponse.data?.homeSliderOne ?? [];
      homeSliderTwo = ebookResponse.data?.homeSliderTwo ?? [];
      homeGenreYouLoved = ebookResponse.data?.homeGenreYouLoved ?? [];
      homeFreshPageEdits = ebookResponse.data?.homeFreshPageEdits ?? [];
      homeTrendingBook = ebookResponse.data?.homeTrendingBook ?? [];
      homeStaffPicks = ebookResponse.data?.homeStaffPicks ?? [];
      homeHistory = ebookResponse.data?.homeHistory ?? [];
      homeTopPicks = ebookResponse.data?.homeTopPicks ?? [];
      homeSimilartitles = ebookResponse.data?.homeSimilartitles ?? [];

      /*listOfLibrary = ebookResponse.data?.library ?? [];
      listOfEbook = ebookResponse.data?.ebook ?? [];
      listOfMeditation = ebookResponse.data?.meditation ?? [];
      listOfYoga = ebookResponse.data?.yoga ?? [];
      listOfMusic = ebookResponse.data?.music ?? [];
      listOfComic = ebookResponse.data?.comic ?? [];
      listOfAudio = ebookResponse.data?.audio ?? [];
      listOfFeaturedCategory = ebookResponse.data?.featuredCategory ?? [];*/

      var leng = homeCategory?.length;

      debugPrint('homeCategory   $leng');

      await customTrace.stop();
      loading = false;
      loadCart();
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  Future<void> onTapNotification(HomeNotification notificationData) async {
    debugPrint('onTapNotification');
    try {
      Response<dynamic> response = await dioService.put(
          'notification/user/read/${notificationData.id}',
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;

      // notifyListeners();
    } catch (e) {
      debugPrint('e $e');
    }

    notificationList?.asMap().forEach((key, value) {
      if (notificationData.id == value.id) {
        notificationList?.remove(notificationData);
      }
    });
    // notifyListeners();
    getHomePageDetails();
  }

  List<HomeCategory>? allCategory = [];

  getallCategory(String type, String pageno) async {
    Trace customTrace =
        FirebasePerformance.instance.newTrace('Explore Categories');
    await customTrace.start();

    try {
      debugPrint('getallCategory');
      loading = true;
      Response<dynamic> response = await dioService.get(
          'bookuser/user/getallcategory',
          queryParameters: {'type': type, 'page_number': pageno},
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      AllCategoryPageResponse ebookResponse =
          AllCategoryPageResponse.fromJson(res);

      allCategory?.clear();
      allCategory = ebookResponse.data ?? [];
      loading = false;
      customTrace.stop();
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  onReload() {
    getHomePageDetails();
  }

  List<HomeLiteraryPicks>? listBookCategoryWise = [];

  getBookCategoryWise(categoryId, type) async {
    try {
      debugPrint('getallCategory');
      loading = true;
      Response<dynamic> response = await dioService.get(
          'bookuser/user/get-book-category-wise',
          queryParameters: {
            'category_id': categoryId,
            'type': type,
            'page_number': "1"
          },
          options: Options(headers: {"Authorization": token}));
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      HomePageResponse ebookResponse = HomePageResponse.fromJson(res);

      listBookCategoryWise?.clear();
      listBookCategoryWise = ebookResponse.data?.listBookCategoryWise ?? [];
      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

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
    loadCart();

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
    loadCart();
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

  List<HomeLiteraryPicks>? listBookByType = [];

  allBookByType(categoryId, page) async {
    loading = true;
    try {
      debugPrint('getallbookbytype');

      Response<dynamic> response = await dioService.post(
        'bookuser/user/getallbookbytype',
        data: {'type': categoryId, 'page_number': page},
      ).whenComplete(() => {loading = false});
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      HomeAllViewResponse ebookResponse = HomeAllViewResponse.fromJson(res);

      listBookByType?.clear();
      listBookByType = ebookResponse.data ?? [];

      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  allEBookByType(categoryId, page) async {
    loading = true;
    try {
      debugPrint('getallbookbytype');

      Response<dynamic> response = await dioService.get(
        'bookuser/user/getallebookBytype',
        queryParameters: {'type': categoryId, 'page_number': page},
      ).whenComplete(() => {loading = false});
      debugPrint('response.data ${response.data}');
      Map<String, dynamic> res = response.data;
      HomeAllViewResponse ebookResponse = HomeAllViewResponse.fromJson(res);

      listBookByType?.clear();
      listBookByType = ebookResponse.data ?? [];

      notifyListeners();
    } catch (e) {
      debugPrint('e $e');
      loading = false;
    }
  }

  List<BookDetailsModal> books = [];

  loadCart() async {
    books = [];
    Response<dynamic> response =
        await dioService.get('bookorder/user/cart-list');
    Map<String, dynamic> res = response.data;
    CartResponse cartResponse = CartResponse.fromJson(res);
    for (var element in cartResponse.data!.cart!) {
      books.add(BookDetailsModal.fromJson(element.toJson()));
    }

    notifyListeners();
  }
}

final homeProviderNew = ChangeNotifierProvider((r) {
  return HomeStateNew();
});
