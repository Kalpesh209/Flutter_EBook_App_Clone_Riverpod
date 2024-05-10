import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ebook_app_clone_riverpod/common/helpers/readable_duration.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/colors/colors.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/constants.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/gen/assets.gen.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/common_widgets/common_widgets.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/models/track_response/music_track.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/models/track_response/track_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/music/music_screen.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerState extends ChangeNotifier {
  List<MusicTrack> tracks = [];
  Duration? duration;
  Duration? currentHead;
  final player = AudioPlayer();
  PlayerState? playerState = PlayerState(false, ProcessingState.ready);
  int currentTrackIndex = 0;
  MusicTrack? currentTrack;
  bool repeatMode = false;
  BookDetailsModal album;

  MusicPlayerState(this.album);

  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  bool loaded = false;

  loadTracks() async {
    debugPrint('album.toJson() ${album.toJson()}');
    debugPrint('album.id ${album.id}');
    loading = true;
    dio.Response<dynamic> response = await dioService
        .get('musicuser/user/get-track-list?music_album_id=${album.id}')
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    TrackResponse trackResponse = TrackResponse.fromJson(res);
    tracks = trackResponse.data?.musicTrack ?? [];
    load(0);
    notifyListeners();
  }

  nextTrack() async {
    if (currentTrackIndex == tracks.length - 1) return;
    currentTrackIndex++;
    await player.seek(Duration.zero);
    load(currentTrackIndex);
  }

  prevTrack() async {
    if (currentTrackIndex == 0) return;
    currentTrackIndex--;
    await player.seek(Duration.zero);
    load(currentTrackIndex);
  }

  isPlaying() {
    return loaded && player.playing;
  }

  seek(int seconds) {
    player.seek(Duration(seconds: currentHead!.inSeconds + seconds));
    notifyListeners();
  }

  replay() {
    player.seek(Duration.zero);
  }

  load(index) async {
    currentTrack = tracks[index];
    currentTrackIndex = index;
    notifyListeners();
    await player.setUrl((currentTrack?.trackUrl ?? ''));
    if (currentTrackIndex == 0) {
      player.pause();
    } else {
      player.play();
    }
    notifyListeners();
    duration = player.duration;
    notifyListeners();

    player.positionStream.listen((p) {
      currentHead = p;
      notifyListeners();
    });
    player.playerStateStream.listen((p) {
      debugPrint('PLAYE STATE CHAGE : ${player.playerState}');
      if (player.processingState == ProcessingState.completed) {
        if (repeatMode) {
          replay();
        } else {
          var newIndex = currentTrackIndex + 1;
          if (newIndex == tracks.length) {
            player.stop();
          } else {
            load(newIndex);
          }
        }
      }
      playerState = p;
      notifyListeners();
    });
    loaded = true;
    notifyListeners();
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
        "type": "Music",
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
}

final musicPlayerProvider =
    ChangeNotifierProvider.family.autoDispose((r, BookDetailsModal album) {
  var state = MusicPlayerState(album)..loadTracks();
  r.onDispose(() {
    state.player.dispose();
  });
  return state;
});

class MusicPlayer extends ConsumerWidget {
  final BookDetailsModal album;

  const MusicPlayer(this.album, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(musicPlayerProvider(album));
    return WillPopScope(
      onWillPop: () async {
        ref.watch(musicScreenProvider).lastPlayedAlbum();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          title: Text(
            album.title ?? '',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: state.loading
            ? loadingCenter()
            : Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                      child: ColoredBox(
                        color: Colors.white,
                        child: Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.network(
                              state.currentTrack == null
                                  ? album.image!
                                  : state.currentTrack!.image!,
                              width: Get.width,
                              height: Get.height,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(1),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: Get.height *
                                        (state.isPlaying() == false ? 0 : 0.3),
                                  ),
                                  AnimatedContainer(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    height: state.isPlaying() ? 80 : 0,
                                    duration: const Duration(milliseconds: 100),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                state.currentTrack?.title ??
                                                    '--',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 28,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                  state.currentTrack
                                                          ?.description ??
                                                      '',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 0.02),
                                        InkWell(
                                          onTap: () => state.likeAlbum(
                                              state.currentTrack!.id!),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                state.currentTrack
                                                            ?.isFavourite ==
                                                        true
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color: state.currentTrack
                                                            ?.isFavourite ==
                                                        true
                                                    ? themeColor
                                                    : Colors.white,
                                                size: 36,
                                              ),
                                              const Text(
                                                '',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    alignment: Alignment.center,
                                    height: Get.height * 0.16,
                                    child: state.isPlaying()
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () => state.replay(),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color: Colors.transparent,
                                                  ),
                                                  child: SvgPicture.asset(
                                                      Assets.icons.refreshCw),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  state.prevTrack();
                                                },
                                                child: Image.asset(
                                                  Assets
                                                      .icons.icPrevious.keyName,
                                                  height: 30.h,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              if (state.player.playing == true)
                                                InkWell(
                                                  onTap: () {
                                                    state.player.pause();
                                                  },
                                                  child: SvgPicture.asset(
                                                    Assets.icons.pause,
                                                    height: 30.h,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              if (!state.isPlaying())
                                                InkWell(
                                                  onTap: () async {
                                                    state.player.play();
                                                  },
                                                  child: SvgPicture.asset(
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
                                                  Assets.icons.icNext.keyName,
                                                  height: 30.h,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () =>
                                                    state.toggleRepeat(),
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      color: state.repeatMode
                                                          ? themeColor
                                                          : Colors.transparent,
                                                    ),
                                                    child: SvgPicture.asset(
                                                        Assets.icons.repeat)),
                                              ),
                                            ],
                                          ).marginSymmetric(horizontal: 8.0)
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(),
                                              InkWell(
                                                onTap: () async =>
                                                    state.seek(-10),
                                                child: SvgPicture.asset(
                                                  Assets.icons.seekBack,
                                                  width: Get.width * 0.1,
                                                  height: Get.width * 0.1,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  if (state.playerState ==
                                                      PlayerState(
                                                          state.player.playing,
                                                          ProcessingState
                                                              .completed)) {
                                                    await state.player
                                                        .seek(Duration.zero);
                                                    // state.player.play();
                                                  }
                                                  state.player.play();
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
                                                    state.seek(10),
                                                child: SvgPicture.asset(
                                                  Assets.icons.seekForward,
                                                  width: Get.width * 0.1,
                                                  height: Get.width * 0.1,
                                                ),
                                              ),
                                              Container(),
                                            ],
                                          ),
                                  ),
                                  AnimatedContainer(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    height: state.isPlaying() ? 0 : 90,
                                    duration: const Duration(milliseconds: 100),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            state.currentTrack?.title ?? '',
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            state.currentTrack?.description ??
                                                '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          SizedBox(height: Get.height * 0.03),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 6,
                                    child: Slider(
                                      thumbColor: Colors.white,
                                      activeColor: themeColor,
                                      inactiveColor: FPcolors.graylight,
                                      min: 0,
                                      max: state.duration?.inSeconds
                                              .toDouble() ??
                                          0.0,
                                      value: state.currentHead?.inSeconds
                                              .toDouble() ??
                                          0.0,
                                      onChanged: (value) async {
                                        final position =
                                            Duration(seconds: value.toInt());
                                        await state.player.seek(position);

                                        await state.player.play();
                                      },
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: double.infinity,
                                  //   height: 6,
                                  //   child: TweenAnimationBuilder<double>(
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
                                  //
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
                                  SizedBox(height: 16.h),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          formatDurationInHhMmSs(
                                              state.currentHead ??
                                                  const Duration(seconds: 0)),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          formatDurationInHhMmSs(
                                              state.duration ??
                                                  const Duration(seconds: 0)),
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
                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      height: state.isPlaying() == false
                          ? Get.height * 0.5 -
                              MediaQuery.of(context).padding.top
                          : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: Get.width * 0.06),
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
                                return Music(
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
      ),
    );
  }
}

class Music extends StatefulWidget {
  const Music({
    super.key,
    required this.state,
    required this.index,
    required this.track,
  });

  final MusicPlayerState state;
  final int index;
  final MusicTrack track;

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
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
                      widget.track.description ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    // Html(data: track.description),
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
