import 'package:dio/dio.dart' as dio;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/models/meditation_category.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/models/meditation_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/meditation_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/view_all.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/common/home_section_title.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class MeditationCategoryListState extends ChangeNotifier {
  final MeditationCategory category;
  List<BookDetailsModal> albums = [];
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  MeditationCategoryListState(this.category);

  load() async {
    debugPrint('categoryId ${category.categoryId}');
    loading = true;
    dio.Response<dynamic> response = await dioService
        .get(
            'meditationuser/user/get-meditation-category-wise?category_id=${category.categoryId}')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    MeditationResponse meditationResponse = MeditationResponse.fromJson(res);
    albums = meditationResponse.data?.meditationAlbum ?? [];
    notifyListeners();
  }
}

final meditationCategoryListProvider =
    ChangeNotifierProvider.family.autoDispose((r, MeditationCategory category) {
  return MeditationCategoryListState(category)..load();
});

class MeditationCategoryList extends ConsumerWidget {
  final MeditationCategory category;
  final bool hideTitle;

  const MeditationCategoryList(this.category,
      {Key? key, this.hideTitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(meditationCategoryListProvider(category));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hideTitle == false)
          HomeSectionTitle(
            title: category.categoryName ?? '',
            onTap: () {
              debugPrint("Meditation category: ${category.categoryId}");
              Get.to(
                () => ViewAllScreen(
                  heading: category.categoryName ?? '',
                  musicCategoryId: "",
                  meditationCategoryId: category.categoryId,
                  fromScreen: "meditation",
                ),
              );
            },
            showView: true,
          ),
        if (hideTitle == false) SizedBox(height: Get.height * 0.01),
        SizedBox(
          height: Get.width * 0.6,
          child: state.loading
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          height: Get.width * 0.4,
                          width: Get.width * 0.4,
                        ),
                      ).paddingOnly(left: 10),
                    ],
                  ),
                )
              : state.albums.isEmpty
                  ? Container(
                      margin: EdgeInsets.all(Get.width * 0.04),
                      decoration: BoxDecoration(
                        color: FPcolors.fpPrimaryLight1,
                        borderRadius: BorderRadius.circular(Get.width * 0.04),
                      ),
                      child: const Center(
                        child: Text('No Albums Found'),
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.albums.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        var album = state.albums[index];
                        return InkWell(
                          onTap: () => Get.to(() => MusicPlayer2(album)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Get.width * 0.04),
                                    child: FancyShimmerImage(
                                      imageUrl: album.image ?? '',
                                      height: Get.width * 0.4,
                                      width: Get.width * 0.4,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(Get.width * 0.04),
                                    child: SvgPicture.asset(Assets.icons.note),
                                  ),
                                ],
                              ),
                              SizedBox(height: Get.height * 0.01),
                              SizedBox(
                                width: Get.width * 0.4,
                                child: Text(
                                  album.title ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Text(
                                album.category ?? '',
                                style: TextStyle(
                                    fontSize: 14, color: FPcolors.fpgreyText),
                              ),
                            ],
                          ).paddingOnly(left: Get.width * 0.04),
                        );
                      },
                    ),
        )
      ],
    );
  }
}
