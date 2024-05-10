import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/books/widgets/books_slider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/models/music_response/music_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';

import 'music_player.dart';

class MusicTopSliderState extends ChangeNotifier {
  List<dynamic> carouseslBooks = [];

  int _activeSlide = 0;

  get activeSlide => _activeSlide;

  set activeSlide(status) {
    _activeSlide = status;
    notifyListeners();
  }

  List<BookDetailsModal> albums = [];

  load(categoryId) async {
    dio.Response<dynamic> response = await dioService
        .get('musicuser/user/get-music-category-wise?category_id=$categoryId');
    Map<String, dynamic> res = response.data;
    MusicResponse musicResponse = MusicResponse.fromJson(res);
    albums = musicResponse.data?.musicAlbum ?? [];

    albums = [...albums];
    albums.shuffle(Random(10));
    notifyListeners();
    // Future.delayed(const Duration(milliseconds: 100), () => notifyListeners());
  }
}

final musicTopSliderProvider =
    ChangeNotifierProvider.family.autoDispose((r, String categoryId) {
  return MusicTopSliderState()..load(categoryId);
});

class MusicTopSlider extends ConsumerWidget {
  final String categoryId;

  const MusicTopSlider(this.categoryId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(musicTopSliderProvider(categoryId));
    return Column(
      children: [
        FlutterCarousel(
          items: List.generate(
            state.albums.length,
            (index) {
              var album = state.albums[index];
              return InkWell(
                onTap: () {
                  Get.to(() => MusicPlayer(album));
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(Get.width * 0.04),
                  ),
                  margin: EdgeInsets.all(Get.width * 0.04),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    fit: StackFit.expand,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: FancyShimmerImage(
                          boxFit: BoxFit.cover,
                          imageUrl: album.image ?? '',
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.all(Get.width * 0.06),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // const TagWidget(tag: 'New', background: Color(0xffFFD83D)),
                            //  SizedBox(height: Get.height * 0.01),
                            Text(
                              album.title ?? '',
                              style: AppStyles.titleStyle
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              album.subTitle ?? '',
                              maxLines: 1,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          options: CarouselOptions(
            height: 300.h,
            viewportFraction: 1,
            autoPlay: false,
            aspectRatio: 16 / 9,
            floatingIndicator: false,
            enableInfiniteScroll: true,
            indicatorMargin: 0.0,
            showIndicator: false,
            onPageChanged: (index, reason) => {state.activeSlide = index},
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            state.albums.length,
            (index) => Dot(
              active: index == state.activeSlide,
            ),
          ),
        )
      ],
    );
  }
}
