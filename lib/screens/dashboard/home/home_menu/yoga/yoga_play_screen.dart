import 'package:audioplayers/audioplayers.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/readable_duration.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/tag_remover.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/full_screen_loader.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/provider/yoga_player_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../../adhelper.dart';
import '../../../../../utils.dart';

class YogaPlayerScreen extends ConsumerStatefulWidget {
  const YogaPlayerScreen({Key? key}) : super(key: key);

  @override
  YogaPlayerScreenState createState() => YogaPlayerScreenState();
}

class YogaPlayerScreenState extends ConsumerState<YogaPlayerScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(name: 'my_rewards_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref.watch(walletProvider).getRewardsData();
    });

    /* //Add mob
    loadRewardedAd(AdHelper.rewardedAdUnitIdForMyRewards);
    showAdmob();
*/
  }

/*class YogaPlayerScreen extends ConsumerWidget {
  const YogaPlayerScreen({Key? key}) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    String bookId = Get.parameters['book_id'] ?? '';
    debugPrint('book_id :$bookId');
    var state = ref.watch(yogaPlayerProvider(bookId));
    return WillPopScope(
      onWillPop: () async {
        //ref.watch(yogaPlayerProvider).lastPlayedAlbum();
        state.exitFullScreenVideo();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          actions: state.isPortrait
              ? [
                  InkWell(
                    onTap: () =>
                        state.likeAlbum(state.bookDetailsModal?.id ?? ''),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          state.bookDetailsModal?.isFavourite == true
                              ? Icons.star
                              : Icons.star_border,
                          color: state.bookDetailsModal?.isFavourite == true
                              ? themeColor
                              : Colors.black,
                          size: 32.h,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.more_vert_sharp,
                          color: Colors.black,
                          size: 32.h,
                        ),
                      ],
                    ),
                  ),
                ]
              : [],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: state.loading
            ? const FullScreenLoader()
            : Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                      child: ColoredBox(
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: () {
                            debugPrint('state.isHide ${state.isHide}');
                            state.isHide = (false);
                            Future.delayed(const Duration(milliseconds: 5000),
                                () {
                              state.isHide = true;
                            });
                          },
                          child: Stack(
                            fit: state.isPortrait
                                ? StackFit.loose
                                : StackFit.expand,
                            alignment: Alignment.bottomCenter,
                            children: [
                              state.videoController != null
                                  ? OrientationBuilder(
                                      builder: (context, orientation) {
                                        // state.isPortrait = orientation ==
                                        //     Orientation.portrait;
                                        return GestureDetector(
                                          onTap: () {
                                            debugPrint(
                                                'state.isHide ${state.isHide}');
                                            state.isHide = (false);
                                          },
                                          child: VideoPlayer(
                                              state.videoController!),
                                        );
                                      },
                                    )
                                  : const SizedBox(),
                              // state.videoController != null
                              //     ? AspectRatio(
                              //         aspectRatio: state.videoController
                              //                 ?.value.aspectRatio ??
                              //             16 / 9,
                              //         child:
                              //             VideoPlayer(state.videoController!),
                              //       )
                              //     : const SizedBox(),
                              Container(
                                height: Get.height * 0.4,
                                alignment: Alignment.bottomCenter,
                                // decoration: state.isPortrait
                                //     ?
                                //     : const BoxDecoration(),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(0, 157, 157, 157),
                                      Colors.black
                                          .withOpacity(state.isHide ? 0 : 1),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: state.isPlaying()
                                    ? !state.isPortrait
                                        ? AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            height: state.isHide
                                                ? 0
                                                : Get.height * 0.6,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16.w,
                                              ),
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.6,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            state.prevTrack();
                                                          },
                                                          child: Image.asset(
                                                            Assets
                                                                .icons
                                                                .icPrevious
                                                                .keyName,
                                                            height: 30.h,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        if (state.isPlaying())
                                                          InkWell(
                                                            onTap: () {
                                                              state
                                                                  .onTapPortrait();
                                                              state
                                                                  .videoController!
                                                                  .pause();
                                                            },
                                                            child: SvgPicture
                                                                .asset(
                                                              Assets
                                                                  .icons.pause,
                                                              height: 30.h,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        if (!state.isPlaying())
                                                          InkWell(
                                                            onTap: () async {
                                                              state
                                                                  .videoController!
                                                                  .play();
                                                            },
                                                            child: SvgPicture
                                                                .asset(
                                                              Assets.icons.play,
                                                              height: 30.h,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        InkWell(
                                                          onTap: () {
                                                            state.nextTrack();
                                                          },
                                                          child: Image.asset(
                                                            Assets.icons.icNext
                                                                .keyName,
                                                            height: 30.h,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.16,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        formatDurationInHhMmSs(
                                                            state.duration ??
                                                                const Duration(
                                                                    seconds:
                                                                        0)),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 8),
                                                      ),
                                                      IconButton(
                                                        onPressed: () => state
                                                            .onTapPortrait(),
                                                        icon: Icon(
                                                          state.isPortrait
                                                              ? Icons
                                                                  .fullscreen_rounded
                                                              : Icons
                                                                  .fullscreen_exit_rounded,
                                                          color: Colors.white,
                                                          size: 30.h,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    height: 0,
                                                    child: Slider(
                                                      thumbColor:
                                                          Colors.transparent,
                                                      activeColor: themeColor,
                                                      inactiveColor:
                                                          FPcolors.graylight,
                                                      min: 0,
                                                      max: state.duration
                                                              ?.inSeconds
                                                              .toDouble() ??
                                                          0.0,
                                                      value: state.currentHead
                                                              ?.inSeconds
                                                              .toDouble() ??
                                                          0.0,
                                                      onChanged: (value) async {
                                                        final position =
                                                            Duration(
                                                                seconds: value
                                                                    .toInt());
                                                        await state
                                                            .videoController
                                                            ?.seekTo(position);

                                                        await state
                                                            .videoController
                                                            ?.play();
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          70.r),
                                                              child:
                                                                  FancyShimmerImage(
                                                                imageUrl: state
                                                                        .bookDetailsModal
                                                                        ?.image ??
                                                                    '',
                                                                width: 70.r,
                                                                height: 70.r,
                                                                errorWidget:
                                                                    Image.network(
                                                                        'https://cdn-icons-png.flaticon.com/512/3208/3208679.png'),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 16),
                                                            Flexible(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    state.bookDetailsModal
                                                                            ?.title ??
                                                                        '',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    state.bookDetailsModal
                                                                            ?.tag ??
                                                                        '',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          8,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          InkWell(
                                                            onTap: () => state
                                                                .likeAlbum(state
                                                                    .bookDetailsModal!
                                                                    .id!),
                                                            child: Icon(
                                                              state.bookDetailsModal
                                                                          ?.isFavourite ==
                                                                      true
                                                                  ? Icons.star
                                                                  : Icons
                                                                      .star_border,
                                                              color: state.bookDetailsModal
                                                                          ?.isFavourite ==
                                                                      true
                                                                  ? themeColor
                                                                  : Colors
                                                                      .white,
                                                              size: 32.h,
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Icon(
                                                              Icons
                                                                  .more_vert_sharp,
                                                              color:
                                                                  Colors.white,
                                                              size: 32.h,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            height: Get.height * 0.15,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16.w,
                                              ),
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        formatDurationInHhMmSs(
                                                            state.duration ??
                                                                const Duration(
                                                                    seconds:
                                                                        0)),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                      IconButton(
                                                        onPressed: () => state
                                                            .onTapPortrait(),
                                                        icon: Icon(
                                                          state.isPortrait
                                                              ? Icons
                                                                  .fullscreen_rounded
                                                              : Icons
                                                                  .fullscreen_exit_rounded,
                                                          color: Colors.white,
                                                          size: 30.h,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          state.prevTrack();
                                                        },
                                                        child: Image.asset(
                                                          Assets
                                                              .icons
                                                              .icPrevious
                                                              .keyName,
                                                          height: 30.h,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.08),
                                                      if (state.isPlaying())
                                                        InkWell(
                                                          onTap: () {
                                                            state
                                                                .videoController!
                                                                .pause();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                            Assets.icons.pause,
                                                            height: 30.h,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      if (!state.isPlaying())
                                                        InkWell(
                                                          onTap: () async {
                                                            state
                                                                .videoController!
                                                                .play();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                            Assets.icons.play,
                                                            height: 30.h,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.08),
                                                      InkWell(
                                                        onTap: () {
                                                          state.nextTrack();
                                                        },
                                                        child: Image.asset(
                                                          Assets.icons.icNext
                                                              .keyName,
                                                          height: 30.h,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                    : AnimatedContainer(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w),
                                        duration:
                                            const Duration(milliseconds: 200),
                                        height: Get.height * 0.4,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const SizedBox(),
                                            Center(
                                              child: state.loadingVideo
                                                  ? loadingCenter()
                                                  : InkWell(
                                                      onTap: () async {
                                                        if (state.playerState ==
                                                            PlayerState
                                                                .completed) {
                                                          await state
                                                              .videoController!
                                                              .seekTo(Duration
                                                                  .zero);
                                                          // state.player.play();
                                                        }
                                                        state.videoController!
                                                            .play();
                                                      },
                                                      child: SvgPicture.asset(
                                                        Assets.icons.play,
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        state.bookDetailsModal
                                                                ?.title ??
                                                            '',
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 28,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        removeAllHtmlTags(state
                                                                .bookDetailsModal
                                                                ?.tag ??
                                                            ''),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      SizedBox(
                                                          height: Get.height *
                                                              0.018),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  formatDurationInHhMmSs(
                                                      state.duration ??
                                                          const Duration(
                                                              seconds: 0)),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    state.isPlaying()
                        ? !state.isPortrait
                            ? Container()
                            : containerDetails(context, state)
                        : const SizedBox(),
                    containerList(context, state)
                  ],
                ),
              ),
      ),
    );
  }

  containerDetails(BuildContext context, YogaPlayerState state) {
    debugPrint(
        'description ${state.bookDetailsModal?.description ?? 'Description not available.'}');
    return AnimatedContainer(
      height: state.isPlaying() == false
          ? 0
          : Get.height * 0.4 - MediaQuery.of(context).padding.top,
      duration: const Duration(milliseconds: 200),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 6,
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  tween: Tween<double>(
                    begin: 0,
                    end: 0.5,
                  ),
                  builder: (context, value, _) {
                    var durationInSeconds = state.duration?.inSeconds ?? 1;
                    return LinearProgressIndicator(
                      value: (state.currentHead?.inSeconds ?? 0) /
                          (durationInSeconds > 0 ? durationInSeconds : 1),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.bookDetailsModal?.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.sp,
                          ),
                        ),
                        Text(
                          state.bookDetailsModal?.subTitle ?? 'not available',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 16.w),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.r),
                        child: FancyShimmerImage(
                          imageUrl: state.bookDetailsModal?.image ?? '',
                          width: 60.r,
                          height: 60.r,
                          errorWidget: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/3208/3208679.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
              const Divider(color: Colors.black12),
              SizedBox(
                height: 150.h,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    // child: Text(
                    //   album.about ?? 'not available',
                    //   style: TextStyle(
                    //     fontSize: 18.sp,
                    //   ),
                    // ),
                    child: Html(
                        data: state.bookDetailsModal?.description ??
                            'Description not available.'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  containerList(BuildContext context, YogaPlayerState state) {
    return AnimatedContainer(
      height: state.isPlaying() == false
          ? Get.height * 0.5 - MediaQuery.of(context).padding.top
          : 0,
      duration: const Duration(milliseconds: 200),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Get.width * 0.06),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Get.width * 0.08),
            topRight: Radius.circular(Get.width * 0.08),
          ),
          color: Colors.white,
        ),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: state.albums.isEmpty
              ? const Center(
                  child: Text("No tracks to play"),
                )
              : state.loadingAll
                  ? loadingCenter()
                  : ListView.builder(
                      itemCount: state.albums.length,
                      itemBuilder: (ctx, index) {
                        var album = state.albums[index];
                        return tracksListItem(album, state);
                      },
                    ),
        ),
      ),
    );
  }

  tracksListItem(BookDetailsModal album, YogaPlayerState state) {
    return Material(
      child: InkWell(
        onTap: () => state.onTapItem(album),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.01,
            horizontal: Get.height * 0.03,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Get.width * 0.04),
                child: FancyShimmerImage(
                  imageUrl: album.image ?? '',
                  width: Get.width * 0.18,
                  height: Get.width * 0.18,
                  errorWidget: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3208/3208679.png'),
                ),
              ),
              SizedBox(width: Get.width * 0.02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      album.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      album.category ?? '', //Description not available.
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    //Html(data: album.description ?? ''),
                  ],
                ),
              ),
              // Text(
              //   '8 min',
              //   style: TextStyle(fontSize: 12.sp, color: FPcolors.color72777A),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
