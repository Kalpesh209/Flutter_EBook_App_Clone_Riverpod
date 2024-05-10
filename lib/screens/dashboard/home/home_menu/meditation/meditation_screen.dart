import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/container_with_top_logo.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/full_screen_loader.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/models/meditation_category_response/meditation_category_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/meditation_category_list.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/meditation_top_slider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/search/search_screen.dart';
import 'package:get/get.dart';

import 'models/meditation_category.dart';

class MeditationScreenState extends ChangeNotifier {
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  List<MeditationCategory> categories = [];

  loadCategories() async {
    loading = true;
    dio.Response<dynamic> response = await dioService
        .get('category/user/get-category-type-list?type=Meditation&language=en')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    MeditationCategoryResponse meditationCategoryResponse =
        MeditationCategoryResponse.fromJson(res);
    categories = meditationCategoryResponse.data!.contentType!
        .map((e) => MeditationCategory.fromJson(e.toJson()))
        .toList();
    notifyListeners();
  }
}

final meditationScreenProvider = ChangeNotifierProvider.autoDispose((r) {
  return MeditationScreenState()..loadCategories();
});

class MeditationScreen extends ConsumerWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(meditationScreenProvider);
    return RefreshIndicator(
      onRefresh: () async {
        state.loadCategories();
      },
      child: ContainerWithTopLogo(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Meditation'),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  Get.to(() => const SearchScreen(type: "Meditation"));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                  child: Assets.icons.search.image(width: Get.width * 0.06),
                ),
              )
            ],
          ),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      if (state.categories.isNotEmpty)
                        MeditationTopSlider(
                            state.categories[0].categoryId ?? ''),
                      // TopCarouselSlider(
                      //   '',
                      //   'Meditation',
                      //   (bookDetailsModal) {
                      //     Get.to(() => MusicPlayer2(bookDetailsModal));
                      //   },
                      // ),
                      SizedBox(height: Get.height * 0.04),
                      ...state.categories
                          .map((e) => MeditationCategoryList(e))
                          .toList(),
                    ]),
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
