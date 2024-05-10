import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/full_screen_loader.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/constants_db.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/models/music_category.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/models/music_category_response/music_category_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/last_played_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_category_list.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_list_item.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_top_slider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/search/search_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/common/home_section_title.dart';
import 'package:get/get.dart' as getx;

class MusicScreenState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  List<MusicCategory> categories = [];
  List<BookDetailsModal> lastPlayed = [];

  void addLastPlayedId(String id) async {
    final String? strings = await storageService.read(key: lastPlayedMusic);
    if (strings == null) {
      final List<String> ids = [];
      ids.add(id);
      await storageService.write(key: lastPlayedMusic, value: jsonEncode(ids));
    } else {
      final List<dynamic> ids = jsonDecode(strings);
      if (!ids.contains(id)) {
        ids.add(id);

        await storageService.write(
            key: lastPlayedMusic, value: jsonEncode(ids));
      }
    }
    debugPrint("CHAPTER ADDED");
    notifyListeners();
  }

  void lastPlayedAlbum() async {
    // loading = true;
    lastPlayed = [];
    final String? ids = await storageService.read(key: lastPlayedMusic);
    if (ids != null && ids.isNotEmpty) {
      for (var id in jsonDecode(ids)) {
        debugPrint('lastPlayedAlbum id $id');
        try {
          Response<dynamic> response = await dioService.get(
            "musicuser/user/get-music-detail/$id",
            options: Options(headers: {"Authorization": token}),
          );
          Map<String, dynamic> res = response.data;
          BookDetailsModal album =
              BookDetailsModal.fromJson(response.data["data"]);
          debugPrint("Album data: ${album.subTitle}");

          if (!lastPlayed.contains(album)) {
            lastPlayed.add(album);
            // loading = false;
            notifyListeners();
          }
        } on DioException catch (_) {
          // print(e.message);
        }
        // EbookResponse bookResponse= EbookResponse.fromJson(responsee.data);
        // continueReadingbooks.add();
      }
    }
  }

  loadCategories() async {
    loading = true;
    dio.Response<dynamic> response = await dioService
        .get('category/user/get-category-type-list?type=Music&language=en')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    MusicCategoryResponse musicCategoryResponse =
        MusicCategoryResponse.fromJson(res);
    categories = musicCategoryResponse.data!.contentType!
        .map((e) => MusicCategory.fromJson(e.toJson()))
        .toList();
    notifyListeners();
  }
}

final musicScreenProvider = ChangeNotifierProvider.autoDispose((r) {
  return MusicScreenState();
});

class MusicScreen extends ConsumerStatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  MusicScreenStatee createState() => MusicScreenStatee();
}

class MusicScreenStatee extends ConsumerState<MusicScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(musicScreenProvider).loadCategories();
      ref.watch(musicScreenProvider).lastPlayedAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(musicScreenProvider);
    return RefreshIndicator(
      onRefresh: () async {
        state.loadCategories();
        ref.watch(musicScreenProvider).lastPlayedAlbum();
      },
      child: ContainerWithTopLogo(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Music'),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchScreen(
                      type: "Music",
                    );
                  }));
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getx.Get.width * 0.04),
                  child:
                      Assets.icons.search.image(width: getx.Get.width * 0.06),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: getx.Get.height,
                  width: getx.Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (state.categories.isNotEmpty)
                          MusicTopSlider(state.categories[0].categoryId ?? ''),
                        // TopCarouselSlider(
                        //   '',
                        //   'Music',
                        //       (bookDetailsModal) {
                        //     getx.Get.to(() => MusicPlayer2(bookDetailsModal));
                        //   },
                        // ),
                        SizedBox(height: getx.Get.height * 0.04),
                        state.lastPlayed.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //ebooks
                                  SizedBox(height: getx.Get.height * 0.03),
                                  HomeSectionTitle(
                                      showView: true,
                                      title: "Last Played",
                                      onTap: () {
                                        getx.Get.to(() => LastPlayedScreen(
                                            album: state.lastPlayed));
                                      }),
                                  SizedBox(height: getx.Get.height * 0.01),
                                  SizedBox(
                                    height: 240.h,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.lastPlayed.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (ctx, index) {
                                        var album = state.lastPlayed[index];
                                        return MusicListItem(
                                          album: album,
                                          onTap: () => getx.Get.to(
                                              () => MusicPlayer(album)),
                                        );
                                      },
                                    ),
                                  ),
                                  //end ebooks
                                ],
                              )
                            : const SizedBox(),
                        ...state.categories
                            .map((e) => MusicCategoryList(e))
                            .toList(),
                      ],
                    ),
                  ),
                ),
                if (state.loading) const FullScreenLoader()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
