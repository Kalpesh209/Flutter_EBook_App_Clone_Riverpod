import '../../home/models/home_literarypicks_model.dart';
import 'audio_auther_model.dart';
import 'category_ebook.dart';


class AudioBookPageResponse {
  Data? data;
  bool? success;
  String? message;

  AudioBookPageResponse.dart({this.data, this.success, this.message});

  AudioBookPageResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Data {

  List<HomeLiteraryPicks>? audioBookAdventure;
  List<HomeLiteraryPicks>? literAtureList;
  List<HomeLiteraryPicks>? regionalList;
  List<AuthorNotes>? authorNotesList;
  List<HomeLiteraryPicks>? audioCategoryList;

  Data({

    this.audioBookAdventure,
    this.literAtureList,
    this.regionalList,
    this.authorNotesList,
    this.audioCategoryList,


  });

  Data.fromJson(Map<String, dynamic> json) {

    if (json['audiobookadventure'] != null) {
      audioBookAdventure = <HomeLiteraryPicks>[];
      json['audiobookadventure'].forEach((v) {
        audioBookAdventure!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['literaturelist'] != null) {
      literAtureList = <HomeLiteraryPicks>[];
      json['literaturelist'].forEach((v) {
        literAtureList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    if (json['regionallist'] != null) {
      regionalList = <HomeLiteraryPicks>[];
      json['regionallist'].forEach((v) {
        regionalList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

   if (json['authorlist'] != null) {
     authorNotesList = <AuthorNotes>[];
      json['authorlist'].forEach((v) {
        authorNotesList!.add(AuthorNotes.fromJson(v));
      });
    }if (json['categorylist'] != null) {
      audioCategoryList = <HomeLiteraryPicks>[];
      json['categorylist'].forEach((v) {
        audioCategoryList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (audioBookAdventure != null) {
      data['audiobookadventure'] = audioBookAdventure!.map((v) => v.toJson()).toList();
    }
    if (literAtureList != null) {
      data['literaturelist'] = literAtureList!.map((v) => v.toJson()).toList();
    }
    if (regionalList != null) {
      data['regionallist'] = regionalList!.map((v) => v.toJson()).toList();
    }
    if (audioCategoryList != null) {
      data['categorylist'] = audioCategoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
