import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/readable_duration.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/tag_remover.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/widgets/full_screen_loader.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/countdown_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/models/track_response/meditation_track.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/models/track_response/track_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/timer_set_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/mini_timer.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/meditation/widgets/timer_picker.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class MusicPlayerState2 extends ChangeNotifier {
  List<MeditationTrack> tracks = [];
  Duration? duration;
  Duration? currentHead;
  PlayerState? playerState = PlayerState.playing;
  int currentTrackIndex = 0;
  MeditationTrack? currentTrack;
  bool repeatMode = false;
  BookDetailsModal album;

  MusicPlayerState2(this.album);

  VideoPlayerController? _controller;

  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  bool loaded = false;

  loadTracks() async {
    debugPrint('album.id ${album.id}');
    loading = true;
    dio.Response<dynamic> response = await dioService
        .get(
            'meditationuser/user/get-chapter-list?meditation_album_id=${album.id}')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    debugPrint("Track data: $res");
    TrackResponse trackResponse = TrackResponse.fromJson(res);
    tracks = trackResponse.data?.meditationChapter ?? [];
    load(0);
    notifyListeners();
  }

  nextTrack() async {
    if (currentTrackIndex == tracks.length - 1) return;
    currentTrackIndex++;
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(tracks[currentTrackIndex].trackUrl!));
    await _controller?.seekTo(Duration.zero);
    load(currentTrackIndex);
  }

  prevTrack() async {
    if (currentTrackIndex == 0) return;
    currentTrackIndex--;
    await _controller?.seekTo(Duration.zero);
    load(currentTrackIndex);
  }

  isPlaying() {
    if (_controller == null) return false;
    return (_controller!.value.isPlaying);
  }

  seek(int seconds) async {
    await _controller
        ?.seekTo(Duration(seconds: currentHead!.inSeconds + seconds));
    notifyListeners();
  }

  load(index) async {
    debugPrint('index $index');
    currentTrack = tracks[index];
    currentTrackIndex = index;
    var videoUrl = Uri.parse(currentTrack!.trackUrl!);
    debugPrint('videoUrl $videoUrl');
    _controller?.dispose();
    _controller = VideoPlayerController.networkUrl(videoUrl);
    await _controller?.initialize();
    duration = _controller?.value.duration;
    if (currentTrackIndex != 0) {
      _controller!.play();
    }

    // await player.play(UrlSource(currentTrack?.trackUrl ?? ''));
    notifyListeners();
    _controller?.addListener(() async {
      currentHead = _controller?.value.position;
      if (_controller?.value.position == _controller?.value.duration) {
        if (repeatMode) {
          _controller?.seekTo(Duration.zero);
        } else {
          // if last song
          debugPrint("Pause REPEAT: $repeat");
          if (currentTrackIndex == tracks.length - 1 && repeat == false) {
            // await _controller?.seekTo(Duration.zero);
            debugPrint("PAUSED");
            await _controller?.pause();
          } else {
            //play next song
            // load(currentTrackIndex + 1);
          }
        }
      }

      debugPrint("REPEAT: $repeat");
      debugPrint("CH: $currentHead");
      debugPrint("DR: $duration");
      if (repeat == true) {
        _controller!.setLooping(true);
      }

      notifyListeners();
    });
    loaded = true;
    // notifyListeners();
  }

  toggleRepeat() {
    repeatMode = !repeatMode;
    notifyListeners();
  }

  likeAlbum(String trackId) async {
    debugPrint("ALbum: ${album.id}");
    await dioService.post(
      'bookuser/user/wishlist',
      options: Options(headers: {"Authorization": token}),
      data: {
        "type": "Meditation",
        "book_id": trackId,
      },
    );
    // Map<String, dynamic> res = response.data;
    if (trackId == currentTrack!.id) {
      currentTrack =
          currentTrack!.copyWith(isFavourite: !currentTrack!.isFavourite!);
    }
    notifyListeners();
  }

  restart() async {
    await _controller?.seekTo(Duration.zero);
    _controller?.play();
  }

  StreamSubscription? listener;
}

final musicPlayerProvider =
    ChangeNotifierProvider.family.autoDispose((r, BookDetailsModal album) {
  var state = MusicPlayerState2(album)..loadTracks();
  r.onDispose(() {
    state._controller?.dispose();
    state.listener?.cancel();
  });
  state.listener = eventBus.on<TimerEnd>().listen((event) {
    state._controller?.pause();
    WakelockPlus.toggle(enable: false);
  });
  eventBus.on<TimerPaused>().listen((e) => state._controller?.pause());
  eventBus.on<TimerResumed>().listen((e) => state._controller?.play());
  return state;
});

class MusicPlayer2 extends ConsumerWidget {
  final BookDetailsModal album;

  const MusicPlayer2(this.album, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String bookId = Get.parameters['book_id'] ?? '';
    debugPrint('book_id :$bookId');

    var state = ref.watch(musicPlayerProvider(album));
    var timerState = ref.watch(timerSetScreenProvider);
    debugPrint('timerState.pendingSecond ${timerState.pendingSecond}');

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: const BackButton(color: Colors.white),
        title: Text(
          state.currentTrack?.title ?? '',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {
              if (timerState.pendingSecond > 0) {
                Get.to(() => const CountDownScreen());
                return;
              }
              Get.to(() => const TimerSetScreen());
            },
            child: const MiniTimer(),
          ),
          SizedBox(width: Get.width * 0.04),
        ],
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: state.loading
          ? loadingCenter()
          : state.tracks.isEmpty
              ? const Center(
                  child: Text("No tracks to play"),
                )
              : Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Expanded(
                        child: ColoredBox(
                          color: Colors.white,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              state._controller != null
                                  ? VideoPlayer(state._controller!)
                                  : const SizedBox(),
                              Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color.fromARGB(
                                                0, 157, 157, 157),
                                            Colors.black.withOpacity(1),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          state.isPlaying()
                                              ? SizedBox(
                                                  height: Get.height * 0.3)
                                              : const SizedBox(),
                                          AnimatedContainer(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            height: state.isPlaying() ? 80 : 0,
                                            duration: const Duration(
                                                milliseconds: 200),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        state.currentTrack
                                                                ?.title ??
                                                            '--',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 26,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        removeAllHtmlTags(state
                                                                .currentTrack
                                                                ?.description ??
                                                            ''),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: Get.width * 0.02),
                                                InkWell(
                                                  onTap: () => state.likeAlbum(
                                                      state.currentTrack!.id!),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        state.currentTrack!
                                                                    .isFavourite ==
                                                                true
                                                            ? Icons.star
                                                            : Icons.star_border,
                                                        color: state.currentTrack!
                                                                    .isFavourite ==
                                                                true
                                                            ? themeColor
                                                            : Colors.white,
                                                        size: 36,
                                                      ),
                                                      // Text(
                                                      //   '100',
                                                      //   style: TextStyle(color: Colors.white),
                                                      // )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            alignment: Alignment.center,
                                            height: 100,
                                            child: state.isPlaying()
                                                ? Row(
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
                                                      if (state.isPlaying())
                                                        InkWell(
                                                          onTap: () {
                                                            state._controller
                                                                ?.pause();
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
                                                            state._controller
                                                                ?.play();
                                                          },
                                                          child:
                                                              SvgPicture.asset(
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
                                                  ).marginSymmetric(
                                                    horizontal: 8.0)
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(),
                                                      InkWell(
                                                        onTap: () async =>
                                                            await state
                                                                .seek(-10),
                                                        child: SvgPicture.asset(
                                                          Assets.icons.seekBack,
                                                          width:
                                                              Get.width * 0.1,
                                                          height:
                                                              Get.width * 0.1,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          if (state
                                                                  .playerState ==
                                                              PlayerState
                                                                  .completed) {
                                                            await state
                                                                ._controller!
                                                                .seekTo(Duration
                                                                    .zero);
                                                            // state.player.play();
                                                          }
                                                          state._controller!
                                                              .play();
                                                        },
                                                        child: SvgPicture.asset(
                                                          Assets.icons.play,
                                                          width: 60,
                                                          height: 60,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async =>
                                                            await state
                                                                .seek(10),
                                                        child: SvgPicture.asset(
                                                          Assets.icons
                                                              .seekForward,
                                                          width:
                                                              Get.width * 0.1,
                                                          height:
                                                              Get.width * 0.1,
                                                        ),
                                                      ),
                                                      Container(),
                                                    ],
                                                  ),
                                          ),
                                          AnimatedContainer(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            height: state.isPlaying() ? 0 : 80,
                                            duration: const Duration(
                                                milliseconds: 200),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    state.currentTrack?.title ??
                                                        '',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 28,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    removeAllHtmlTags(state
                                                            .currentTrack
                                                            ?.description ??
                                                        ''),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          Get.height * 0.018),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 8,
                                            child: Slider(
                                              thumbColor: Colors.white,
                                              activeColor: themeColor,
                                              inactiveColor: FPcolors.graylight,
                                              min: 0,
                                              max: state.duration?.inSeconds
                                                      .toDouble() ??
                                                  0.0,
                                              value: state
                                                      .currentHead?.inSeconds
                                                      .toDouble() ??
                                                  0.0,
                                              onChanged: (value) async {
                                                debugPrint('value.... $value');
                                                final position = Duration(
                                                    seconds: value.toInt());
                                                await state._controller
                                                    ?.seekTo(position);

                                                await state._controller?.play();
                                              },
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: double.infinity,
                                          //   height: 6,                                          //   child:
                                          //       TweenAnimationBuilder<double>(
                                          //     duration: const Duration(
                                          //         milliseconds: 250),
                                          //     curve: Curves.easeInOut,
                                          //     tween: Tween<double>(
                                          //       begin: 0,
                                          //       end: 0.5,
                                          //     ),
                                          //     builder: (context, value, _) {
                                          //       var durationInSeconds =
                                          //           state.duration?.inSeconds ??
                                          //               1;
                                          //       return LinearProgressIndicator(
                                          //         value: (state.currentHead
                                          //                     ?.inSeconds ??
                                          //                 0) /
                                          //             (durationInSeconds > 0
                                          //                 ? durationInSeconds
                                          //                 : 1),
                                          //       );
                                          //     },
                                          //   ),
                                          // ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 24.w,
                                              vertical: 16.h,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  formatDurationInHhMmSs(
                                                      state.currentHead ??
                                                          const Duration(
                                                              seconds: 0)),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (state.loading) const FullScreenLoader()
                            ],
                          ),
                        ),
                      ),
                      state.loading
                          ? const SizedBox()
                          : AnimatedContainer(
                              height: state.isPlaying() == false
                                  ? Get.height * 0.5 -
                                      MediaQuery.of(context).padding.top
                                  : 0,
                              duration: const Duration(milliseconds: 200),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Get.width * 0.06),
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
                                  child: ListView.builder(
                                      itemCount: state.tracks.length,
                                      itemBuilder: (ctx, index) {
                                        var track = state.tracks[index];
                                        return Meditation(
                                          state: state,
                                          track: track,
                                          index: index,
                                        );
                                      }),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
    );
  }
}

class Meditation extends StatefulWidget {
  const Meditation({
    super.key,
    required this.state,
    required this.index,
    required this.track,
  });

  final MusicPlayerState2 state;
  final int index;
  final MeditationTrack track;

  @override
  State<Meditation> createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.track.isFavourite!;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => widget.state.load(widget.index),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.01,
            horizontal: Get.height * 0.03,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Get.width * 0.04),
                child: FancyShimmerImage(
                  imageUrl: widget.track.image ?? '',
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
                      widget.track.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      removeAllHtmlTags(widget.track.description ?? ''),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  widget.state.likeAlbum(widget.track.id!);
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: isLiked == true
                    ? const Icon(
                        Icons.star,
                        color: themeColor,
                      )
                    : const Icon(Icons.star_border),
              )
            ],
          ),
        ),
      ),
    );
  }
}
