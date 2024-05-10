// import 'dart:math';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_ebook_app_clone/screens/dashboard/home/home_menu/music/models/music_category.dart';
// import 'package:flutter_ebook_app_clone/screens/dashboard/home/home_menu/music/models/music_category_response/music_category_response.dart';
// import 'package:new_version_plus/new_version_plus.dart';
// import 'package:package_info_plus/package_info_plus.dart';
//
// import '../../../../config/services/setup_singleton_services.dart';
// import '../../../../globals.dart';
// import '../../../../update_dialog.dart';
// import '../../../Books/models/EbookModel/ebook_model.dart';
//
// //import '../../../music/models/music_category.dart';
// import '../../home/home_menu/audiobook/models/audio_book_modal.dart';
// import '../../home/home_menu/audiobook/models/audioooksCategory/audiobooks_category_model.dart';
// import '../../home/home_menu/meditation/models/meditation_category.dart';
// import '../../home/home_menu/meditation/models/meditation_category_response/meditation_category_response.dart';
//
// class HomeState extends ChangeNotifier {
//   bool _loading = true;
//   bool isShowUpdate = true;
//   bool _loading2 = true;
//   String version = "";
//   int n2 = 0;
//   int n3 = 0;
//   int n4 = 0;
//   int n5 = 0;
//
//   get loading => _loading;
//
//   set loading(status) {
//     _loading = status;
//     notifyListeners();
//   }
//
//   get loading2 => _loading2;
//
//   set loading2(status) {
//     _loading2 = status;
//     notifyListeners();
//   }
//
//   void setVersion() async {
//     loading2 = true;
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     debugPrint("VERSION: ${packageInfo.version}");
//     version = packageInfo.version;
//     loading2 = false;
//   }
//
//   void checkVersion(NewVersionPlus newversion, BuildContext context) async {
//     final status = await newversion.getVersionStatus();
//     if (status != null) {
//       debugPrint('Version: ${status.originalStoreVersion}');
//       debugPrint('Can Update Version: ${status.canUpdate}');
//       debugPrint('local version: ${status.localVersion}');
//       if (status.canUpdate && isShowUpdate == true) {
//         if (!context.mounted) return;
//         await showDialog(
//           barrierDismissible: false,
//           context: context,
//           builder: (BuildContext context) {
//             return UpdateDialog(
//               originalStoreVersion: status.originalStoreVersion!,
//               applink: status.appStoreLink,
//             );
//           },
//         );
//       }
//     }
//   }
//
//   List<Ebook> libraryBooks = [];
//
//   getLibraryBooks() async {
//     loading = true;
//     Response<dynamic> response = await dioService.get(
//         'library/user/home-screen-featured?language=en',
//         options: Options(headers: {"Authorization": token}));
//     Map<String, dynamic> res = response.data;
//     EbookResponse ebookResponse = EbookResponse.fromJson(res);
//     libraryBooks = ebookResponse.data!.book ?? [];
//     n3 = libraryBooks.length >= 2
//         ? Random().nextInt(libraryBooks.length - 1)
//         : 0;
//     loading = false;
//   }
//
//   getYogaBooks() async {
//     debugPrint('getYogaBooks');
//     loading = true;
//     Response<dynamic> response = await dioService
//         .get('yogauser/user/get-yoga-category-wise',
//             options: Options(headers: {"Authorization": token}))
//         .onError((error, stackTrace) {
//       print(error);
//       print(stackTrace);
//       throw e;
//     });
//     debugPrint('yoga response.data ${response.data}');
//     // Map<String, dynamic> res = response.data;
//     // EbookResponse ebookResponse = EbookResponse.fromJson(res);
//     // libraryBooks = ebookResponse.data!.book ?? [];
//     // n3 = libraryBooks.length >= 2
//     //     ? Random().nextInt(libraryBooks.length - 1)
//     //     : 0;
//     loading = false;
//   }
//
//   List<MeditationCategory> meditationCategories = [];
//
//   getMeditationBooks() async {
//     loading = true;
//     try {
//       Response<dynamic> response = await dioService
//           .get(
//               'category/user/get-category-type-list?type=Meditation&language=en')
//           .whenComplete(() => loading = false);
//       Map<String, dynamic> res = response.data;
//       MeditationCategoryResponse meditationCategoryResponse =
//           MeditationCategoryResponse.fromJson(res);
//       meditationCategories = meditationCategoryResponse.data!.contentType!
//           .map((e) => MeditationCategory.fromJson(e.toJson()))
//           .toList();
//       n4 = meditationCategories.length >= 2
//           ? Random().nextInt(meditationCategories.length - 1)
//           : 0;
//       loading = false;
//     } on DioException catch (e) {
//       if (e.response!.statusCode == 404) {
//         debugPrint('e.response ${e.response}');
//       }
//     }
//   }
//
//   List<Ebook> books = [];
//
//   void getEBooks() async {
//     loading = true;
//     try {
//       Response<dynamic> response = await dioService.get(
//           'bookuser/user/get-new-book?language=en',
//           options: Options(headers: {"Authorization": token}));
//
//       Map<String, dynamic> res = response.data;
//       EbookResponse ebookResponse = EbookResponse.fromJson(res);
//       debugPrint("bookResponse: ${ebookResponse.data!.book}");
//       books = ebookResponse.data!.book!;
//       n2 = books.length >= 2 ? Random().nextInt(books.length - 1) : 0;
//       loading = false;
//     } on DioException catch (e) {
//       if (e.response!.statusCode == 404) {
//         debugPrint('e.response ${e.response}');
//       }
//     }
//   }
//
//   List<MusicCategory> musicCategories = [];
//
//   getMusicBooks() async {
//     loading = true;
//     try {
//       Response<dynamic> response = await dioService
//           .get('category/user/get-category-type-list?type=Music&language=en')
//           .whenComplete(() => loading = false);
//       debugPrint('getMusicBooks  ${response.data}');
//       Map<String, dynamic> res = response.data;
//       MusicCategoryResponse musicCategoryResponse =
//           MusicCategoryResponse.fromJson(res);
//       musicCategories = musicCategoryResponse.data!.contentType!
//           .map((e) => MusicCategory.fromJson(e.toJson()))
//           .toList();
//       n5 = musicCategories.length >= 2
//           ? Random().nextInt(musicCategories.length - 1)
//           : 0;
//       loading = false;
//     } on DioException catch (e) {
//       if (e.response!.statusCode == 404) {
//         debugPrint('e.response ${e.response}');
//       }
//     }
//   }
//
//   List<AudioBook> listOfAudioBooks = [];
//
//   Future<void> getAudioBooks() async {
//     loading = true;
//     try {
//       Response<dynamic> response = await dioService
//           .get('audio-book/user/get-audio-book-with-category?language=en')
//           .whenComplete(() => loading = false);
//
//       Audiobookcategorimodel audioBooksResponse =
//           Audiobookcategorimodel.fromJson(response.data);
//       debugPrint(
//           "Audio categories: ${audioBooksResponse.data.category.length}");
//       List<Category> categories = audioBooksResponse.data.category;
//       categories.asMap().forEach((key, value) {
//         if (value.books.isNotEmpty) {
//           listOfAudioBooks.add(value.books.first);
//         }
//       });
//       listOfAudioBooks.shuffle();
//     } on DioException catch (e) {
//       if (e.response!.statusCode == 404) {
//         debugPrint('e.response ${e.response}');
//       }
//     }
//   }
//
//   onReload() {
//     getLibraryBooks();
//     getYogaBooks();
//     getMeditationBooks();
//     getEBooks();
//     getMusicBooks();
//     getAudioBooks();
//   }
// }
//
// final homeProvider = ChangeNotifierProvider((r) {
//   return HomeState();
// });
