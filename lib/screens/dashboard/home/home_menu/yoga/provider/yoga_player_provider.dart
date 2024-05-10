import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/modals/yoga_book_details_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/home_menu/yoga/modals/yoga_response.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class YogaPlayerState extends ChangeNotifier {
  YogaPlayerState();

  void pushFullScreenVideo() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  exitFullScreenVideo() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  VideoPlayerController? videoController;
  PlayerState? playerState = PlayerState.playing;
  StreamSubscription? listener;

  List<BookDetailsModal> albums = [];

  Duration? duration;
  Duration? currentHead;
  int currentTrackIndex = 0;

  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
    notifyListeners();
  }

  bool _loadingAll = false;

  get loadingAll => _loadingAll;

  set loadingAll(status) {
    _loadingAll = status;
    notifyListeners();
  }

  bool _loadingVideo = false;

  get loadingVideo => _loadingVideo;

  set loadingVideo(status) {
    _loadingVideo = status;
    notifyListeners();
  }

  BookDetailsModal? bookDetailsModal = BookDetailsModal();

  bool _isPortrait = true;

  get isPortrait => _isPortrait;

  set isPortrait(status) {
    _isPortrait = status;
    notifyListeners();
  }

  bool isHide = false;

  onTapPortrait() {
    debugPrint('onTapPortrait');
    isPortrait = !isPortrait;
    isPortrait ? exitFullScreenVideo() : pushFullScreenVideo();
    Future.delayed(const Duration(milliseconds: 5000), () {
      isHide = true;
    });
    notifyListeners();
  }

  loadTracks(String? categoryId) async {
    debugPrint('loadTracks categoryId $categoryId');
    loadingAll = true;
    dio.Response<dynamic> response = await dioService
        .get(
          'yogauser/user/get-all-yoga-category-wise?category_id=$categoryId&per_page=100&page_number=1',
        )
        .whenComplete(() => loadingAll = false);
    Map<String, dynamic> res = response.data;
    YogaResponse yogaResponse = YogaResponse.fromJson(res);
    albums = yogaResponse.data?.yogaAlbum ?? [];
    albums.asMap().forEach((key, value) {
      if (bookDetailsModal?.id == null || bookDetailsModal?.id == '') {
        currentTrackIndex = 0;
        bookDetailsModal = value;
        loadAlbum();
      } else if (bookDetailsModal?.id == value.id) {
        currentTrackIndex = key;
      }
    });

    debugPrint('albums length ${albums.length}');
    notifyListeners();
  }

  onTapItem(BookDetailsModal book) async {
    debugPrint('yoga_album_id=${bookDetailsModal?.id}');
    bookDetailsModal = book;
    loadingVideo = true;
    dio.Response<dynamic> response = await dioService.get(
      'yogauser/user/get-chapter-list?yoga_album_id=${bookDetailsModal?.id}',
      // queryParameters: {
      //   'yoga_album_id ': bookDetailsModal?.id,
      // },
    );
    Map<String, dynamic> res = response.data;
    debugPrint('response.data ${response.data}');
    YogaBookDetailsResponse yogaResponse =
        YogaBookDetailsResponse.fromJson(res);
    BookDetailsModal? newBookDetailsModal = yogaResponse.data?.yogaChapter?[0];
    bookDetailsModal?.bookId = newBookDetailsModal?.id ?? '';
    bookDetailsModal?.videoUrl = newBookDetailsModal?.videoUrl ?? '';
    bookDetailsModal?.description = newBookDetailsModal?.description ?? '';
    loadVideo();
    notifyListeners();
  }

  loadDetails(String bookId) async {
    debugPrint('loadDetails $bookId');
    authService.getToken().then((token) async {
      debugPrint('token $token');
      loading = true;
      dio.Response<dynamic> response = await dioService
          .get('yogauser/user/get-yoga-detail/$bookId',
              options: dio.Options(headers: {"Authorization": token}))
          .whenComplete(() => loading = false);
      bookDetailsModal = (response.data['data'] != null
          ? BookDetailsModal.fromJson(response.data['data'])
          : null)!;
      loadTrack();
      notifyListeners();
    });
  }

  loadTrack() async {
    if (albums.isEmpty) {
      if ((bookDetailsModal?.categoryId ?? '') != '') {
        debugPrint('..... ${bookDetailsModal?.categoryId ?? ''}');
        loadTracks(bookDetailsModal?.categoryId ?? '');
      }
    }
    if (bookDetailsModal?.id != null || bookDetailsModal?.id != '') {
      loadAlbum();
    }
  }

  loadAlbum() async {
    debugPrint('bookDetailsModal?.id ${bookDetailsModal?.id}');
    loading = true;
    dio.Response<dynamic> response = await dioService
        .get(
          'yogauser/user/get-chapter-list?yoga_album_id=${bookDetailsModal?.id}',
          // queryParameters: {
          //   'yoga_album_id ': bookDetailsModal?.id,
          // },
        )
        .whenComplete(() => loading = false);
    Map<String, dynamic> res = response.data;
    YogaBookDetailsResponse yogaResponse =
        YogaBookDetailsResponse.fromJson(res);
    if ((yogaResponse.data?.yogaChapter?.length ?? 0) > 0) {
      BookDetailsModal? newBookDetailsModal =
          yogaResponse.data?.yogaChapter![0];
      bookDetailsModal?.bookId = newBookDetailsModal?.id ?? '';
      bookDetailsModal?.videoUrl = newBookDetailsModal?.videoUrl ?? '';
      bookDetailsModal?.description = newBookDetailsModal?.description ?? '';
      loadVideo();
    }
    notifyListeners();
  }

  loadVideo() async {
    var videoUrl = Uri.parse(bookDetailsModal?.videoUrl ?? '');
    // var videoUrl = Uri.parse(
    //     'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
    debugPrint('videoUrl $videoUrl');
    videoController?.dispose();
    videoController = VideoPlayerController.networkUrl(videoUrl);
    await videoController?.initialize();
    duration = videoController?.value.duration;
    // if (currentTrackIndex != 0) {
    loadingVideo = false;
    videoController!.play();
    // }

    // await player.play(UrlSource(currentTrack?.trackUrl ?? ''));
    notifyListeners();
    videoController?.addListener(() async {
      currentHead = videoController?.value.position;
      if (videoController?.value.position == videoController?.value.duration) {
        // if last song
        if (currentTrackIndex == albums.length - 1) {
          // await videoController?.seekTo(Duration.zero);
          debugPrint("PAUSED");
          await videoController?.pause();
          WakelockPlus.toggle(enable: false);
        } else {
          //play next song
          // load(currentTrackIndex + 1);
        }
      }

      debugPrint("CH: $currentHead");
      debugPrint("DR: $duration");

      WakelockPlus.enable();
      WakelockPlus.toggle(enable: true);

      notifyListeners();
    });
    // notifyListeners();
  }

  nextTrack() async {
    if (currentTrackIndex == albums.length - 1) return;
    currentTrackIndex++;
    onTapItem(albums[currentTrackIndex]);
  }

  prevTrack() async {
    if (currentTrackIndex == 0) return;
    currentTrackIndex--;
    onTapItem(albums[currentTrackIndex]);
  }

  isPlaying() {
    if (videoController == null) return false;
    return (videoController!.value.isPlaying);
  }

  likeAlbum(String trackId) async {
    debugPrint("Album: ${bookDetailsModal?.id}");
    await dioService.post(
      'bookuser/user/wishlist',
      options: Options(headers: {"Authorization": token}),
      data: {
        "type": "Yoga",
        "book_id": bookDetailsModal?.id,
      },
    );
    // Map<String, dynamic> res = response.data;
    if (trackId == bookDetailsModal!.id) {
      bookDetailsModal?.isFavourite = !bookDetailsModal!.isFavourite!;
    }
    notifyListeners();
  }
}

final yogaPlayerProvider =
    ChangeNotifierProvider.family.autoDispose((r, String bookId) {
  var state = YogaPlayerState()..loadDetails(bookId);
  r.onDispose(() {
    state.videoController?.dispose();
    state.listener?.cancel();
    WakelockPlus.toggle(enable: false);
  });
  return state;
});
