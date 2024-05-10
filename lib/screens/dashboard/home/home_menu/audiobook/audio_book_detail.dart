import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/rating.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/interstitial_ad.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/models/chapter-model/chapter_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/audio_book_play_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/providers/audiobook_detail_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/providers/audiobooks_screen_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/widgets/abookkdetail_part.dart';
import 'package:flutter_ebook_app_clone_riverpod/utils.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../common/helpers/readable_duration.dart';

class AudioBookDetail extends ConsumerStatefulWidget {
  const AudioBookDetail({Key? key}) : super(key: key);

  @override
  AudiobookDetailState createState() => AudiobookDetailState();
}

class AudiobookDetailState extends ConsumerState<AudioBookDetail> {
  @override
  void initState() {
    super.initState();
    print("initState----");
    String bookId = Get.parameters['book_id'] ?? '';
    debugPrint('book_id :$bookId');
    FirebaseAnalytics.instance.logEvent(
        name: 'open_book_detail',
        parameters: {'book_id': bookId}).then((n) => null);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // loadAd();
      ref.watch(audiobookDetailProvider).loadDetails(bookId);
      //   ref.read(audiobookDetailProvider).getChaptersById(bookId);
      // ref
      //     .read(audiobookDetailProvider)
      //     .setRating(widget.book?.rating?.toDouble() ?? 0.0);
    });
  }

  /* loadAd() {
    Interstitialad ad = Interstitialad();
    ad.loadAd();
    Future.delayed(const Duration(seconds: 5), () {
      ad.showAd();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(audiobookDetailProvider);
    return WillPopScope(
      onWillPop: () async {
        // ref.watch(audiobooksScreenProvider).continueReading();
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF3F3F3),
        appBar: AppBar(
          centerTitle: true,
          actions: [
            InkWell(
              //  onTap: state.createDynamicLink("audio_details_screen?book_id=${state.bookDetailsModal.id}"),
              onTap: () async {
                String shareUrl = await createDynamicLink(
                    "audio_details_screen?book_id=${state.bookDetailsModal.id}");
                //String shareText =   "${state.bookDetailsModal.bookTitle} \n Check out this famous Book. https://freshpage.in$audioDetails?book_id=${state.bookDetailsModal.id}";
                String shareText =
                    "${state.bookDetailsModal.bookTitle} \n Check out this famous Book. $shareUrl";
                print(shareText);
                shareBook(shareText, state.bookDetailsModal.coverImage ?? '');
              },
              child: Assets.icons.download
                  .image(width: Get.width * 0.055)
                  .paddingAll(Get.width * 0.03),
            ),
            /* InkWell(
              onTap: () {},
              child: Assets.icons.moreVertical
                  .image(width: Get.width * 0.06)
                  .paddingAll(Get.width * 0.03),
            )*/
            InkWell(
              onTap: () {
                state.likeAlbum(state.bookDetailsModal.id!);
                if (state.bookDetailsModal.isFavourite == true) {
                  state.bookDetailsModal.isFavourite = false;
                } else {
                  state.bookDetailsModal.isFavourite = true;
                }
              },
              child: state.bookDetailsModal.isFavourite == true
                  ? Assets.icons.favorite_fill
                      .image(width: Get.width * 0.06)
                      .paddingAll(Get.width * 0.04)
                  : Assets.icons.favorite
                      .image(width: Get.width * 0.06)
                      .paddingAll(Get.width * 0.04),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: state.loading
            ? loadingCenter()
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.02),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /* Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Get.width * 0.04),
                                    child: Image.network(
                                      state.bookDetailsModal.coverImage ?? '',
                                      width: Get.width * 0.37,
                                      height: Get.height * 0.23,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return SizedBox(
                                            width: Get.width * 0.37,
                                            height: Get.height * 0.23,
                                            child: const Center(
                                                child: Text("No Image")));
                                      },
                                    ),
                                  ),
                                  state.bookDetailsModal.coverImage == "V" ||
                                          state.bookDetailsModal.coverImage ==
                                              "v"
                                      ? const SizedBox()
                                      : Padding(
                                          padding:
                                              EdgeInsets.all(Get.width * 0.04),
                                          child: Assets.icons.bookWhite
                                              .image(width: Get.width * 0.1),
                                        ),
                                ],
                              ),*/
                              SizedBox(
                                height: Get.height * 0.35,
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      /* borderRadius:
                                    BorderRadius.circular(Get.width * 0.04),*/
                                      child: Image.network(
                                        state.bookDetailsModal.coverImage ?? '',
                                        width: Get.width * 1,
                                        height: Get.height * 0.3,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return SizedBox(
                                              width: Get.width * 1,
                                              height: Get.height * 0.3,
                                              child: Center(
                                                  child: SvgPicture.asset(Assets
                                                      .settings
                                                      .svg
                                                      .emptyimage)));
                                        },
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 4,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: Get.width * 0.15,
                                              right: Get.width * 0.15),
                                          decoration: BoxDecoration(
                                            color: FPcolors.fpPrimary,
                                            borderRadius: BorderRadius.circular(
                                                Get.width * 0.5),
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 1,
                                                        vertical: 1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () async {
                                                        state.prevTrack();
                                                      },
                                                      icon: Image.asset(
                                                        Assets
                                                            .icons
                                                            .icPreviousNew
                                                            .keyName,
                                                        height: 28.h,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.height * 0.010,
                                                    ),
                                                    IconButton(
                                                      onPressed: () async {
                                                        state.seek(-10);
                                                      },
                                                      icon: Image.asset(
                                                        Assets
                                                            .icons
                                                            .icBackward10New
                                                            .keyName,
                                                        height: 32.h,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.height * 0.010,
                                                    ),
                                                    (state.loading ||
                                                            state.player
                                                                    .processingState ==
                                                                ProcessingState
                                                                    .buffering)
                                                        ? const CircleAvatar(
                                                            radius: 35,
                                                            backgroundColor:
                                                                themeColor,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        : IconButton(
                                                            onPressed:
                                                                () async {
                                                              if (state
                                                                  .isPlaying()) {
                                                                state.player
                                                                    .pause();
                                                              } else {
                                                                state.player
                                                                    .play();
                                                              }
                                                            },
                                                            icon: state
                                                                    .isPlaying()
                                                                ? Image.asset(
                                                                    Assets
                                                                        .icons
                                                                        .iconPause
                                                                        .keyName,
                                                                    height:
                                                                        50.h,
                                                                  )
                                                                : Image.asset(
                                                                    Assets
                                                                        .icons
                                                                        .iconPlayArrow
                                                                        .keyName,
                                                                    height:
                                                                        50.h,
                                                                  ),
                                                            iconSize: 50,
                                                          ),
                                                    SizedBox(
                                                      width: Get.height * 0.010,
                                                    ),
                                                    IconButton(
                                                      onPressed: () async {
                                                        state.seek(10);
                                                      },
                                                      icon: Image.asset(
                                                        Assets
                                                            .icons
                                                            .icForward10New
                                                            .keyName,
                                                        height: 32.h,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.height * 0.010,
                                                    ),
                                                    IconButton(
                                                      onPressed: () async {
                                                        state.nextTrack();
                                                      },
                                                      icon: Image.asset(
                                                        Assets.icons.icNextNew
                                                            .keyName,
                                                        height: 28.h,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              )

                              /* state.bookDetailsModal.coverImage == "V" ||
                                      state.bookDetailsModal.coverImage == "v"
                                  ? const SizedBox()
                                  : Container(
                                      height: Get.height * 0.025,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.2),
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    )*/
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.022,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 200.w,
                                        child: Text(
                                          state.bookDetailsModal.bookTitle ??
                                              '',
                                          style: AppStyles.titleStyle,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.005,
                                      ),
                                      Text(
                                        state.bookDetailsModal.bookTag ?? '',
                                        style: AppStyles.slideSubTitleStyle
                                            .copyWith(
                                          color: const Color(0xff1B1B1B),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: RatingWidget(
                                    rating:
                                        state.bookDetailsModal.rating ?? 0.0,
                                    bookId: state.bookDetailsModal.id ?? '',
                                    provider: audiobookDetailProvider,
                                  )),
                            ]),
                        SizedBox(height: Get.height * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DetailPartWidget(
                                label: 'Chapters',
                                value: state.loading
                                    ? "..."
                                    : state.chapters.length.toString()),
                            DetailPartWidget(
                              label: 'Language',
                              value: (state.bookDetailsModal.language ??
                                  " English"),
                            ),
                            DetailPartWidget(
                                label: 'Release',
                                value: state.loading
                                    ? "..."
                                    : state.bookDetailsModal.releaseYear
                                        .toString()),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(Get.width * 0.06),
                          child: Html(
                            data: state.bookDetailsModal.about ?? '',
                          ),
                        )
                      ],
                    ),
                  ),
                  SlidingUpPanelWidget(
                    anchor: 0.5,
                    panelStatus: SlidingUpPanelStatus.anchored,
                    controlHeight: 30,
                    panelController: state.panelController,
                    child: _panel(state.scrollController),
                  )
                ],
              ),
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    var state = ref.watch(audiobookDetailProvider);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Get.width * 0.08),
          topRight: Radius.circular(Get.width * 0.08),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: Get.width * 0.06,
        right: Get.width * 0.06,
        top: Get.width * 0.02,
        bottom: Get.width * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          const Text(
            'Chapters',
            style: TextStyle(
              color: themeColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Expanded(
            child: state.loading
                ? const Align(
                    alignment: Alignment.topCenter,
                    child: CircularProgressIndicator())
                : state.chapters.isEmpty
                    ? const Align(
                        alignment: Alignment.topCenter,
                        child: Text("No Chapters"))
                    : ListView.builder(
                        itemCount: state.chapters.length,
                        itemBuilder: (c, index) {
                          Chapter chapter = state.chapters[index];
                          return InkWell(
                            onTap: () {
                              debugPrint('strAudioUrl ${chapter.audioUrl}');
                              if (chapter.audioUrl != null &&
                                  chapter.audioUrl != '') {
                                Get.to(
                                  () => AudioBookPlayScreen(
                                    bookDetails: state.bookDetailsModal,
                                    chapters: state.chapters,
                                    selectedIndex: index,
                                  ),
                                );
                              } else {
                                Get.snackbar(
                                  'Error',
                                  'Sorry content not available.',
                                  backgroundColor: FPcolors.colorF35A38,
                                  colorText: FPcolors.colorWhite,
                                  margin: const EdgeInsets.all(16.0),
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.017),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '0${index + 1}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff707070),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.05,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.695,
                                        child: Text(
                                          chapter.title!,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Assets.icons.icPlay
                                      .image(width: Get.width * 0.06)
                                ],
                              ),
                            ),
                          );
                        }),
          ),
        ],
      ),
    );
  }
}
