import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/models/chapter-model/chapter_model.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../../common/helpers/snakbar_helper.dart';
import '../../../../../../globals.dart';

class AudiobookDetailState extends ChangeNotifier {
  List<Chapter> chapters = [];
  List<BookDetailsModal>? book;

  bool _isLoading = false;

  get loading => _isLoading;

  set loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  String _audioUrlString = '';

  get audioUrl => _audioUrlString;

  set audioUrl(val) {
    _audioUrlString = val;
    notifyListeners();
  }

  late ScrollController scrollController;

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();

  AudiobookDetailState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {}
    });
  }

  BookDetailsModal bookDetailsModal = BookDetailsModal();

  loadDetails(String bookId) async {
    debugPrint('loadDetails $bookId');
    authService.getToken().then((token) async {
      debugPrint('token $token');
      loading = true;
      dio.Response<dynamic> response = await dioService
          .get('bookuser/user/get-book-detail/$bookId',
              options: dio.Options(headers: {"Authorization": token}))
          .whenComplete(() => loading = false);
      bookDetailsModal = (response.data['data'] != null
          ? BookDetailsModal.fromJson(response.data['data'])
          : null)!;
      getChaptersById(bookId);
      notifyListeners();
    });
  }

  void getChaptersById(String bookId) async {
    debugPrint('getChaptersById bookId $bookId');

    chapters.clear();
    loading = true;
    authService.getToken().then((token) async {
      try {
        dio.Response<dynamic> response = await dioService
            .get("audio-book/user/get-chapter-list",
                queryParameters: {"book_id": bookId},
                options: dio.Options(headers: {"Authorization": token}))
            .whenComplete(() => loading = false);

        ChapterResponse chapterResponse =
            ChapterResponse.fromJson(response.data!);

        chapters = chapterResponse.data!.bookChapter!;

        if (chapters.isNotEmpty) {
          setAudioBookUrl(chapters, 0);
        }
      } on dio.DioException catch (e) {
        debugPrint('${e.response!.statusCode}');
      }
    });
  }

  likeAlbum(String trackId) async {
    Response<dynamic> response = await dioService.post(
      'bookuser/user/wishlist',
      options: Options(headers: {"Authorization": token}),
      data: {
        "type": "book",
        "book_id": trackId,
      },
    );
    Map<String, dynamic> res = response.data;
    debugPrint('res $res');
    if (res["success"]) {
      SnackbarHelper.success(res["message"]);
    } else {
      SnackbarHelper.error("Try Again");
    }

    notifyListeners();
  }

  setRating(String id, double rating) {
    bookDetailsModal.rating = rating.toString();
    notifyListeners();
  }

  int _selectedIndex = 0;
  final player = AudioPlayer();
  PlayerState? playerState = PlayerState(false, ProcessingState.ready);
  Duration? duration;
  Duration? currentHead;
  bool repeatMode = false;

  get selectedIndex => _selectedIndex;

  set selectedIndex(status) {
    debugPrint('status $status');
    _selectedIndex = status;
    notifyListeners();
  }

  bool loaded = false;

  isPlaying() {
    return loaded && player.playing;
  }

  seek(int seconds) {
    player.seek(Duration(seconds: currentHead!.inSeconds + seconds));
    notifyListeners();
  }

  replay() {
    player.seek(Duration.zero);
    loadAudio();
  }

  nextTrack() async {
    if (_selectedIndex == (chapters?.length ?? 0) - 1) return;
    _selectedIndex++;
    await player.seek(Duration.zero);
    debugPrint('_selectedIndex $_selectedIndex');
    audioUrl = chapters?[_selectedIndex].audioUrl;
    loadAudio();
  }

  prevTrack() async {
    if (_selectedIndex == 0) return;
    _selectedIndex--;
    await player.seek(Duration.zero);
    debugPrint('_selectedIndex $_selectedIndex');
    audioUrl = chapters?[_selectedIndex].audioUrl;
    loadAudio();
  }

  loadAudio() async {
    debugPrint('loadAudio $audioUrl');
    await player.setUrl((audioUrl ?? ''));

    notifyListeners();
    debugPrint('player.duration ${player.duration}');
    duration = player.duration;
    notifyListeners();

    player.positionStream.listen((p) {
      currentHead = p;
      notifyListeners();
    });
    player.playerStateStream.listen((p) {
      debugPrint('PLAY STATE CHANGE : ${player.playerState}');
      if (player.processingState == ProcessingState.completed) {
        if (repeatMode) {
          replay();
        } else {
          player.stop();
        }
      }
      playerState = p;
      notifyListeners();
    });
    loaded = true;
    player.play();
    notifyListeners();
  }

  setAudioBookUrl(List<Chapter> listOfChapter, int currentIndex) {
    chapters = listOfChapter;
    _selectedIndex = currentIndex;
    notifyListeners();
    String strAudioUrl = chapters?[_selectedIndex].audioUrl ?? '';
    debugPrint('strAudioUrl $strAudioUrl');
    audioUrl = strAudioUrl;
    loadAudio();
  }
}

final audiobookDetailProvider = ChangeNotifierProvider((r) {
  var state = AudiobookDetailState();
  r.onDispose(() {
    state.player.dispose();
  });
  return state;
  /* r.onDispose(() {
    state.player.dispose();
  })

  return AudiobookDetailState();*/
});
