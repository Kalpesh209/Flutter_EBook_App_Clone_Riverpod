import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/providers/viewAll_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/meditation_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_grid_item.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/widgets/music_player.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

class ViewAllScreen extends ConsumerStatefulWidget {
  const ViewAllScreen({
    Key? key,
    required this.heading,
    this.meditationCategoryId,
    this.musicCategoryId,
    this.fromScreen,
  }) : super(key: key);

  final String heading;
  final String? meditationCategoryId;
  final String? musicCategoryId;
  final String? fromScreen;

  @override
  ViewAllScreenState createState() => ViewAllScreenState();
}

class ViewAllScreenState extends ConsumerState<ViewAllScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      debugPrint("listener added");
      if (controller.position.pixels <=
          controller.position.maxScrollExtent - 200) {
        if (widget.meditationCategoryId == "" &&
            ref.watch(viewallprovider).musicAlbum.length <
                ref.watch(viewallprovider).musicCount) {
          debugPrint("loading more");
          ref.watch(viewallprovider).getMusicAlbum();
        } else if (ref.watch(viewallprovider).meditationAlbum.length <
            ref.watch(viewallprovider).meditationCount) {
          ref.watch(viewallprovider).getMeditationAlbum();
        }
      }
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.meditationCategoryId == "") {
        ref.watch(viewallprovider).setmusicEmpty();
        ref.watch(viewallprovider).setPageNo();
        ref.watch(viewallprovider).setId(widget.musicCategoryId!);
        ref.watch(viewallprovider).getMusicAlbum();
      } else if (widget.musicCategoryId == "") {
        ref.watch(viewallprovider).setmeditationEmpty();
        ref.watch(viewallprovider).setPageNo();
        ref.watch(viewallprovider).setId(widget.meditationCategoryId!);
        ref.watch(viewallprovider).getMeditationAlbum();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('meditationCategoryId ${widget.meditationCategoryId}');
    debugPrint('musicCategoryId ${widget.musicCategoryId}');
    var state = ref.watch(viewallprovider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          widget.heading,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: widget.meditationCategoryId == ""
          ? SingleChildScrollView(
              controller: controller,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.musicAlbum.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  crossAxisCount: 2,
                  childAspectRatio: Get.width / (Get.height / 1.49),
                ),
                itemBuilder: (context, index) {
                  BookDetailsModal album = state.musicAlbum[index];
                  return MusicGridItem(
                    album: album,
                    onTap: () => Get.to(() => MusicPlayer(album)),
                    fromScreen: widget.fromScreen ?? '',
                  );
                },
              ),
            )
          : SingleChildScrollView(
              controller: controller,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: state.meditationAlbum.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  crossAxisCount: 2,
                  childAspectRatio: Get.width / (Get.height / 1.49),
                ),
                itemBuilder: (context, index) {
                  BookDetailsModal album = state.meditationAlbum[index];
                  return MusicGridItem(
                    album: album,
                    fromScreen: widget.fromScreen ?? '',
                    onTap: () {
                      debugPrint('MusicGridItem onTap');
                      Get.to(() => MusicPlayer2(album));
                    },
                  );
                },
              ),
            ),
    );
  }
}
