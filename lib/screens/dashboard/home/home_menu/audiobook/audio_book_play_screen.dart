import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/readable_duration.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/app_text_styles.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/models/chapter-model/chapter_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/audiobook/providers/audio_book_player_provider.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';

class AudioBookPlayScreen extends ConsumerStatefulWidget {
  final BookDetailsModal bookDetails;
  final List<Chapter> chapters;
  final int selectedIndex;

  const AudioBookPlayScreen({
    Key? key,
    required this.bookDetails,
    required this.chapters,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  AudioBookPlayScreenState createState() => AudioBookPlayScreenState();
}

class AudioBookPlayScreenState extends ConsumerState<AudioBookPlayScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref
      //     .read(audioBookPlayerProvider)
      //     .getAudioBookUrl(widget.chapterDetails.id ?? '');

      ref
          .read(audioBookPlayerProvider)
          .setAudioBookUrl(widget.chapters, widget.selectedIndex);

      FirebaseAnalytics.instance
          .logEvent(name: 'open_book_chapter', parameters: {
        'book_id': widget.bookDetails.id,
        'chapter_id': widget.chapters[widget.selectedIndex].id,
      }).then((n) => debugPrint('Book_chapter'));
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(audioBookPlayerProvider);

    return WillPopScope(
      onWillPop: () {
        state.onBackPress(context, widget.bookDetails.id ?? '');
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF3F3F3),
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              state.onBackPress(context, widget.bookDetails.id ?? '');
            },
          ),
          actions: [
            InkWell(
              onTap: () {
                Share.share(
                  "Check out this famous Ebook!. Download the app from playstore https:play.google.com/store/apps/details?id=in.freshpage.android with invitation code ${authService.user?.verificationCode} ",
                  subject: "",
                );
              },
              child: Assets.icons.share2
                  .image(width: Get.width * 0.06)
                  .paddingAll(Get.width * 0.03),
            ),
            InkWell(
              onTap: () {},
              child: Assets.icons.moreVertical
                  .image(width: Get.width * 0.06)
                  .paddingAll(Get.width * 0.03),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.02),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Get.width * 0.04),
                          child: Image.network(
                            widget.bookDetails.coverImage ?? '',
                            width: Get.width * 0.47,
                            height: Get.height * 0.33,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return SizedBox(
                                width: Get.width * 0.47,
                                height: Get.height * 0.30,
                                child: const Center(child: Text("No Image")),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.012,
              ),
              Text(
                widget.bookDetails.bookTitle ?? '',
                style: AppStyles.titleStyle,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: Get.height * 0.005,
              ),
              Text(
                widget.chapters[state.selectedIndex].title ?? '',
                style: AppStyles.slideSubTitleStyle.copyWith(
                  color: const Color(0xff1B1B1B),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.06,
                  vertical: Get.height * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Get.width * 0.08),
                    topRight: Radius.circular(Get.width * 0.08),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 16,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            '0${state.selectedIndex + 1}',
                            style: const TextStyle(
                              color: Color(0xff1B1B1B),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.chapters[state.selectedIndex].title ?? '',
                            style: const TextStyle(
                              color: Color(0xff1B1B1B),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // AudioBookPlayer(),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  state.seek(-10);
                                },
                                icon: Image.asset(
                                  Assets.icons.icBackward10New.keyName,
                                  height: 32.h,
                                ),
                              ),
                              SizedBox(width: 24.w),
                              (state.loading ||
                                      state.player.processingState ==
                                          ProcessingState.buffering)
                                  ? const CircleAvatar(
                                      radius: 35,
                                      backgroundColor: themeColor,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 35,
                                      backgroundColor: themeColor,
                                      child: IconButton(
                                        onPressed: () async {
                                          if (state.isPlaying()) {
                                            state.player.pause();
                                          } else {
                                            state.player.play();
                                          }
                                        },
                                        icon: Icon(
                                          state.isPlaying()
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                        ),
                                        iconSize: 50,
                                      ),
                                    ),
                              SizedBox(width: 24.w),
                              IconButton(
                                onPressed: () async {
                                  state.seek(10);
                                },
                                icon: Image.asset(
                                  Assets.icons.icForward10New.keyName,
                                  height: 32.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatDurationInHhMmSs(state.currentHead ??
                                    const Duration(seconds: 0)),
                                style: TextStyle(
                                  color: FPcolors.color393939,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                formatDurationInHhMmSs(state.duration ??
                                    const Duration(seconds: 0)),
                                style: TextStyle(
                                  color: FPcolors.color393939,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Slider(
                          activeColor: themeColor,
                          inactiveColor: FPcolors.graylight,
                          min: 0,
                          max: state.duration?.inSeconds.toDouble() ?? 0.0,
                          value: state.currentHead?.inSeconds.toDouble() ?? 0.0,
                          onChanged: (value) async {
                            final position = Duration(seconds: value.toInt());
                            await state.player.seek(position);

                            await state.player.play();
                          },
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              onPressed: () async {
                                state.prevTrack();
                              },
                              icon: Image.asset(
                                Assets.icons.icPrevious.keyName,
                                height: 28.h,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                state.player.seek(const Duration(seconds: 0));
                              },
                              icon: Image.asset(
                                Assets.icons.icRefresh.keyName,
                                height: 28.h,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                state.nextTrack();
                              },
                              icon: Image.asset(
                                Assets.icons.icNext.keyName,
                                height: 28.h,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
