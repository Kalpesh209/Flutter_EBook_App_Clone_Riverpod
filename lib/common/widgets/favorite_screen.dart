import 'package:dio/dio.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/favorite_screen_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/route/route_names.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';

import '../../screens/dashboard/home/home_menu/meditation/widgets/meditation_player.dart';
import '../../screens/dashboard/home/home_menu/yoga/yoga_list_item.dart';
import '../../screens/favorite/audio_book_screen.dart';
import '../../screens/favorite/fav_ebook_screen.dart';
import '../../screens/favorite/library_book_screen.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  FavoriteScreenState createState() => FavoriteScreenState();
}

class FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(favoriteProvider).getFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var state = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favourite’s",
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            Assets.settings.svg.appbarBackbutton,
            height: 30,
            width: 30,
          ),
          onPressed: () =>
              {Get.offAndToNamed(dashboard)} /*Navigator.of(context).pop()*/,
        ),
      ),
      body: state.loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      /* HomeSectionTitle(showView: false, title: ' Library Book ', onTap: () {}),
                const SizedBox(height: 10),
                SizedBox(
                  height: width * 0.4,
                  child: state.loading
                      ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            height: width * 0.4,
                            width: width * 0.4,
                          ),
                        ),
                      ],
                    ),
                  )
                      : state.favouriteBook!.isEmpty
                      ? Container(

                    decoration: BoxDecoration(
                      color: FPcolors.fpPrimaryLight1,
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                    child: const Center(
                      child: Text('No Albums Found'),
                    ),
                  ) : ListView.builder(
                    itemCount: state.favouriteBook?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      var album = state.favouriteBook?[index];
                      return LibraryBookScreen(
                        album: album,
                        onTap: () {
                          Get.toNamed(
                            bookDetails,
                            parameters: {
                              'book_id': album?.id.toString() ?? ''
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                HomeSectionTitle(showView: false, title: ' Audio Book ', onTap: () {}),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200.h,
                  child: state.loading
                      ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            height: width * 0.4,
                            width: width * 0.4,
                          ),
                        ),
                      ],
                    ),
                  )
                      : state.favouriteEBook!.isEmpty
                      ? Container(
                    decoration: BoxDecoration(
                      color: FPcolors.fpPrimaryLight1,
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                    child: const Center(
                      child: Text('No Albums Found'),
                    ),
                  )
                      : ListView.builder(
                    itemCount: state.favouriteAudio?.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index) {
                      var album = state.favouriteEBook?[index];
                      return AudioFavBookScreen(
                        album: album,
                        onTap: () {
                          Get.toNamed(
                            audioDetails,
                            parameters: {
                              'book_id': album?.id.toString() ?? ''
                            },
                          );
                        },
                      );
                    },
                  ),
                ),

                HomeSectionTitle(showView: false, title: ' E-book ', onTap: () {}),
                const SizedBox(height: 10),
                  SizedBox(
                  height: 200.h,
                  child: state.loading
                      ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            height: width * 0.4,
                            width: width * 0.4,
                          ),
                        ),
                      ],
                    ),
                  )
                      : state.favouriteEBook!.isEmpty
                      ? Container(
                    decoration: BoxDecoration(
                      color: FPcolors.fpPrimaryLight1,
                      borderRadius: BorderRadius.circular(width * 0.04),
                    ),
                    child: const Center(
                      child: Text('No Albums Found'),
                    ),
                  )
                      : ListView.builder(
                    itemCount: state.favouriteEBook?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      var album = state.favouriteEBook?[index];
                      return FavEBookScreen(
                        album: album,
                        onTap: () {
                          Get.toNamed(
                            eBookDetails,
                            parameters: {
                              'book_id': album?.id.toString() ?? ''
                            },
                          );
                        },
                      );
                    },
                  ),
                ),*/

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.favouriteEBook?.length,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.33),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          var album = state.favouriteEBook?[index];
                          return FavEBookScreen(
                            album: album,
                            onTap: () {
                              Get.toNamed(
                                eBookDetails,
                                parameters: {
                                  'book_id': album?.bookId.toString() ?? ''
                                },
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
      /*body: SingleChildScrollView(
        child:  Column(
            children: [
              HomeSectionTitle(showView: false, title: 'Library Book ', onTap: () {}),
              const SizedBox(height: 10),
              SizedBox(
                height: width * 0.4,
                child: state.loading
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (ctx, index) => Column(
                          children: [
                            SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                height: width * 0.4,
                                width: width * 0.4,
                              ),
                            ),
                          ],
                        ),
                      )
                    : state.favouriteBook!.isEmpty
                        ? Container(
                            decoration: BoxDecoration(
                              color: FPcolors.fpPrimaryLight1,
                              borderRadius: BorderRadius.circular(width * 0.04),
                            ),
                            child: const Center(
                              child: Text('No Albums Found'),
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.favouriteBook?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              var album = state.favouriteBook?[index];
                              return LibraryBookScreen(
                                album: album,
                                onTap: () {
                                  Get.toNamed(
                                    yogaDetails,
                                    parameters: {
                                      'book_id': album?.id.toString() ?? ''
                                    },
                                  );
                                },
                              );
                            },
                          ),
              ),
              HomeSectionTitle(showView: false, title: 'Audio Book ', onTap: () {}),
              const SizedBox(height: 10),

              HomeSectionTitle(showView: false, title: 'E-book ', onTap: () {}),
              const SizedBox(height: 10),
              SizedBox(
                height: 200.h,
                child: state.loading
                    ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          height: width * 0.4,
                          width: width * 0.4,
                        ),
                      ),
                    ],
                  ),
                )
                    : state.favouriteEBook!.isEmpty
                    ? Container(
                  decoration: BoxDecoration(
                    color: FPcolors.fpPrimaryLight1,
                    borderRadius: BorderRadius.circular(width * 0.04),
                  ),
                  child: const Center(
                    child: Text('No Albums Found'),
                  ),
                )
                    : ListView.builder(
                  itemCount: state.favouriteEBook?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    var album = state.favouriteEBook?[index];
                    return FavEBookScreen(
                      album: album,
                      onTap: () {
                        Get.toNamed(
                          yogaDetails,
                          parameters: {
                            'book_id': album?.id.toString() ?? ''
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),

      ),*/
    );
  }
}
