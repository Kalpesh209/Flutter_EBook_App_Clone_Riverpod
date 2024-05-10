import '../../home/models/home_literarypicks_model.dart';
import 'category_ebook.dart';


class CategoryPageResponse {
  Data? data;
  bool? success;
  String? message;

  CategoryPageResponse({this.data, this.success, this.message});

  CategoryPageResponse.fromJson(Map<String, dynamic> json) {
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

  List<HomeLiteraryPicks>? eBookList;
  List<HomeLiteraryPicks>? audioBookList;
  List<HomeLiteraryPicks>? forYouBookList;

  List<HomeLiteraryPicks>? continueReadingList;
  List<HomeLiteraryPicks>? featureBooksList;
  List<HomeLiteraryPicks>? historyEBook;
  List<HomeLiteraryPicks>? hinduLibraryList;
  List<EBookCategoryPicks>? categoryList;
  List<HomeLiteraryPicks>? sportLibraryList;
  List<HomeLiteraryPicks>? spiritualLibraryList;
  List<HomeLiteraryPicks>? freedomFighterlistList;

  Data({

    this.eBookList,
    this.audioBookList,
    this.forYouBookList,


    this.continueReadingList,
    this.featureBooksList,
    this.historyEBook,
    this.hinduLibraryList,
    this.categoryList,
    this.sportLibraryList,
    this.spiritualLibraryList,
    this.freedomFighterlistList,

  });

  Data.fromJson(Map<String, dynamic> json) {

    if (json['ebook'] != null) {
      eBookList = <HomeLiteraryPicks>[];
      json['ebook'].forEach((v) {
        eBookList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['audiobok'] != null) {
      audioBookList = <HomeLiteraryPicks>[];
      json['audiobok'].forEach((v) {
        audioBookList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    if (json['foryoubook'] != null) {
      forYouBookList = <HomeLiteraryPicks>[];
      json['foryoubook'].forEach((v) {
        forYouBookList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    if (json['continuereading'] != null) {
      continueReadingList = <HomeLiteraryPicks>[];
      json['continuereading'].forEach((v) {
        continueReadingList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    if (json['featurebooks'] != null) {
      featureBooksList = <HomeLiteraryPicks>[];
      json['featurebooks'].forEach((v) {
        featureBooksList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    if (json['category'] != null) {
      categoryList = <EBookCategoryPicks>[];
      json['category'].forEach((v) {
        categoryList!.add(EBookCategoryPicks.fromJson(v));
      });
    }

    if (json['history'] != null) {
      historyEBook = <HomeLiteraryPicks>[];
      json['history'].forEach((v) {
        historyEBook!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    if (json['hindulibrary'] != null) {
      hinduLibraryList = <HomeLiteraryPicks>[];
      json['hindulibrary'].forEach((v) {
        hinduLibraryList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['sportlibrary'] != null) {
      sportLibraryList = <HomeLiteraryPicks>[];
      json['sportlibrary'].forEach((v) {
        sportLibraryList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    if (json['spirituallibrary'] != null) {
      spiritualLibraryList = <HomeLiteraryPicks>[];
      json['spirituallibrary'].forEach((v) {
        spiritualLibraryList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['freedomfighterlist'] != null) {
      freedomFighterlistList = <HomeLiteraryPicks>[];
      json['freedomfighterlist'].forEach((v) {
        freedomFighterlistList!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (eBookList != null) {
      data['ebook'] = eBookList!.map((v) => v.toJson()).toList();
    }
    if (audioBookList != null) {
      data['audiobok'] = audioBookList!.map((v) => v.toJson()).toList();
    }
    if (forYouBookList != null) {
      data['foryoubook'] = forYouBookList!.map((v) => v.toJson()).toList();
    }

    if (continueReadingList != null) {
      data['continuereading'] = continueReadingList!.map((v) => v.toJson()).toList();
    }
    if (featureBooksList != null) {
      data['featurebooks'] = featureBooksList!.map((v) => v.toJson()).toList();
    }
    if (categoryList != null) {
      data['category'] = categoryList!.map((v) => v.toJson()).toList();
    }
    if (historyEBook != null) {
      data['history'] = historyEBook!.map((v) => v.toJson()).toList();
    }
    if (hinduLibraryList != null) {
      data['hindulibrary'] = hinduLibraryList!.map((v) => v.toJson()).toList();
    }
    if (sportLibraryList != null) {
      data['sportlibrary'] = sportLibraryList!.map((v) => v.toJson()).toList();
    }
    if (spiritualLibraryList != null) {
      data['spirituallibrary'] = spiritualLibraryList!.map((v) => v.toJson()).toList();
    }
    if (freedomFighterlistList != null) {
      data['freedomfighterlist'] = freedomFighterlistList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
