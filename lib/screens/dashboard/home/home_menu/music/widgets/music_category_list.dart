import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/view_all.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/models/music_category.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/models/music_response/music_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/music_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_list_item.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/widgets/common/home_section_title.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class MusicCategoryListState extends ChangeNotifier {
  final MusicCategory category;
  List<BookDetailsModal> albums = [];
  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  MusicCategoryListState(this.category);

  load() async {
    loading = true;
    dio.Response<dynamic> response = await dioService
        .get(
            'musicuser/user/get-music-category-wise?category_id=${category.categoryId}')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    MusicResponse musicResponse = MusicResponse.fromJson(res);
    albums = musicResponse.data?.musicAlbum ?? [];
    notifyListeners();
  }
}

final musicCategoryListProvider =
    ChangeNotifierProvider.family.autoDispose((r, MusicCategory category) {
  return MusicCategoryListState(category)..load();
});

class MusicCategoryList extends ConsumerWidget {
  final MusicCategory category;
  final bool hideTitle;

  const MusicCategoryList(this.category, {Key? key, this.hideTitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(musicCategoryListProvider(category));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hideTitle == false)
          HomeSectionTitle(
              showView: true,
              title: category.categoryName ?? '',
              onTap: () {
                debugPrint("Music category: ${category.categoryId}");
                Get.to(
                  () => ViewAllScreen(
                    heading: category.categoryName!,
                    meditationCategoryId: "",
                    musicCategoryId: category.categoryId,
                    fromScreen: "music",
                  ),
                );
              }),
        if (hideTitle == false) SizedBox(height: Get.height * 0.01),
        SizedBox(
          height: 240.h,
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
                        return MusicListItem(
                          album: album,
                          onTap: () {
                            Get.to(() => MusicPlayer(album));
                            ref
                                .watch(musicScreenProvider)
                                .addLastPlayedId(album.id!);
                          },
                        );
                      },
                    ),
        )
      ],
    );
  }
}
