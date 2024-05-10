import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ebook_app_clone_riverpod/config/services/setup_singleton_services.dart';
import 'package:flutter_ebook_app_clone_riverpod/constants/constants_db.dart';
import 'package:flutter_ebook_app_clone_riverpod/globals.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/Books/models/chapter-model/chapter_model.dart';
import 'package:just_audio/just_audio.dart';

import '../models/audio_book_url_response.dart';

class AudioBookPlayerState with ChangeNotifier {
  Duration? duration;
  Duration? currentHead;
  final player = AudioPlayer();
  PlayerState? playerState = PlayerState(false, ProcessingState.ready);
  String? audioUrl;
  bool repeatMode = false;
  List<Chapter>? chapters;
  int _selectedIndex = 0;

  get selectedIndex => _selectedIndex;

  set selectedIndex(status) {
    debugPrint('status $status');
    _selectedIndex = status;
    notifyListeners();
  }

  bool _loading = false;

  get loading => _loading;

  set loading(status) {
    _loading = status;
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

  toggleRepeat() {
    repeatMode = !repeatMode;
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

  getAudioBookUrl(String chapterId) async {
    debugPrint('getAudioBookUrl bookId $chapterId');
    _loading = true;
    notifyListeners();
    try {
      Response<dynamic> response = await dioService
          .get("audio-book/user/audio-url/$chapterId",
              options: Options(headers: {"Authorization": token}))
          .whenComplete(() => _loading = false);

      debugPrint('audioBookUrlResponse: ${response.data!}');
      AudioBookUrlResponse audioBookUrlResponse =
          AudioBookUrlResponse.fromJson(response.data!);
      audioUrl = audioBookUrlResponse.data?.audioUrl ?? '';
      loadAudio();
    } on DioException catch (e) {
      debugPrint('statusCode ${e.response!.statusCode}');
    }
    notifyListeners();
  }

  onBackPress(BuildContext context, String id) {
    debugPrint('onBackPress');
    addBookId(id);
    player.stop();
    Navigator.pop(context);
  }

  void addBookId(String id) async {
    final String? strings =
        await storageService.read(key: continueListeningAudio);
    if (strings == null) {
      final List<String> ids = [];
      ids.add(id);
      await storageService.write(
          key: continueListeningAudio, value: jsonEncode(ids));
    } else {
      final List<dynamic> ids = jsonDecode(strings);
      if (!ids.contains(id)) {
        ids.add(id);

        await storageService.write(
            key: continueListeningAudio, value: jsonEncode(ids));
      }
    }
    debugPrint("CHAPTER ADDED");
    notifyListeners();
  }
}

final audioBookPlayerProvider = ChangeNotifierProvider((r) {
  var state = AudioBookPlayerState();
  r.onDispose(() {
    state.player.dispose();
  });
  return state;
});
