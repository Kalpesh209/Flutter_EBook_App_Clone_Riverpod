import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';
import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/home_notification_model.dart';

import 'home_category_model.dart';
import 'home_literarypicks_model.dart';

class HomePageResponse {
  Data? data;
  bool? success;
  String? message;

  HomePageResponse({this.data, this.success, this.message});

  HomePageResponse.fromJson(Map<String, dynamic> json) {
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
  List<HomeCategory>? homeCategory;
  List<HomeNotification>? homeNotification;
  List<HomeLiteraryPicks>? homeLiteraryPicks;
  List<HomeLiteraryPicks>? homeSliderOne;
  List<HomeLiteraryPicks>? homeSliderTwo;
  List<HomeLiteraryPicks>? homeGenreYouLoved;
  List<HomeLiteraryPicks>? homeFreshPageEdits;
  List<HomeLiteraryPicks>? homeTrendingBook;
  List<HomeLiteraryPicks>? homeStaffPicks;
  List<HomeLiteraryPicks>? homeHistory;
  List<HomeLiteraryPicks>? homeTopPicks;
  List<HomeLiteraryPicks>? homeSimilartitles;

  List<HomeLiteraryPicks>? listBookCategoryWise;

  /* List<BookDetailsModal>? ebook;
  List<BookDetailsModal>? meditation;
  List<BookDetailsModal>? yoga;
  List<BookDetailsModal>? music;
  List<BookDetailsModal>? comic;
  List<BookDetailsModal>? library;
  List<BookDetailsModal>? audio;
  List<BookDetailsModal>? featuredCategory;*/

  Data({
    this.homeCategory,
    this.homeNotification,
    this.homeLiteraryPicks,
    this.homeSliderOne,
    this.homeSliderTwo,
    this.homeGenreYouLoved,
    this.homeFreshPageEdits,
    this.homeTrendingBook,
    this.homeStaffPicks,
    this.homeHistory,
    this.homeTopPicks,
    this.homeSimilartitles,
    this.listBookCategoryWise,
    /* this.ebook,
      this.meditation,
      this.yoga,
      this.music,
      this.comic,
      this.library,
      this.audio,
      this.featuredCategory*/
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['notification'] != null) {
      homeNotification = <HomeNotification>[];
      json['notification'].forEach((v) {
        homeNotification!.add(HomeNotification.fromJson(v));
      });
    }
    if (json['category'] != null) {
      homeCategory = <HomeCategory>[];
      json['category'].forEach((v) {
        homeCategory!.add(HomeCategory.fromJson(v));
      });
    }

    if (json['literarypicks'] != null) {
      homeLiteraryPicks = <HomeLiteraryPicks>[];
      json['literarypicks'].forEach((v) {
        homeLiteraryPicks!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['sliderone'] != null) {
      homeSliderOne = <HomeLiteraryPicks>[];
      json['sliderone'].forEach((v) {
        homeSliderOne!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    if (json['slidertwo'] != null) {
      homeSliderTwo = <HomeLiteraryPicks>[];
      json['slidertwo'].forEach((v) {
        homeSliderTwo!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['genreyouloved'] != null) {
      homeGenreYouLoved = <HomeLiteraryPicks>[];
      json['genreyouloved'].forEach((v) {
        homeGenreYouLoved!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['freshpagedits'] != null) {
      homeFreshPageEdits = <HomeLiteraryPicks>[];
      json['freshpagedits'].forEach((v) {
        homeFreshPageEdits!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['trandingebook'] != null) {
      homeTrendingBook = <HomeLiteraryPicks>[];
      json['trandingebook'].forEach((v) {
        homeTrendingBook!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['staffpicks'] != null) {
      homeStaffPicks = <HomeLiteraryPicks>[];
      json['staffpicks'].forEach((v) {
        homeStaffPicks!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['history'] != null) {
      homeHistory = <HomeLiteraryPicks>[];
      json['history'].forEach((v) {
        homeHistory!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    if (json['topPicks'] != null) {
      homeTopPicks = <HomeLiteraryPicks>[];
      json['topPicks'].forEach((v) {
        homeTopPicks!.add(HomeLiteraryPicks.fromJson(v));
      });
    }
    if (json['similartitles'] != null) {
      homeSimilartitles = <HomeLiteraryPicks>[];
      json['similartitles'].forEach((v) {
        homeSimilartitles!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    if (json['book'] != null) {
      listBookCategoryWise = <HomeLiteraryPicks>[];
      json['book'].forEach((v) {
        listBookCategoryWise!.add(HomeLiteraryPicks.fromJson(v));
      });
    }

    /* if (json['ebook'] != null) {
      ebook = <BookDetailsModal>[];
      json['ebook'].forEach((v) {
        ebook!.add(BookDetailsModal.fromJson(v));
      });
    }
    if (json['meditation'] != null) {
      meditation = <BookDetailsModal>[];
      json['meditation'].forEach((v) {
        meditation!.add(BookDetailsModal.fromJson(v));
      });
    }
    if (json['yoga'] != null) {
      yoga = <BookDetailsModal>[];
      json['yoga'].forEach((v) {
        yoga!.add(BookDetailsModal.fromJson(v));
      });
    }
    if (json['music'] != null) {
      music = <BookDetailsModal>[];
      json['music'].forEach((v) {
        music!.add(BookDetailsModal.fromJson(v));
      });
    }
    if (json['comic'] != null) {
      comic = <BookDetailsModal>[];
      json['comic'].forEach((v) {
        comic!.add(BookDetailsModal.fromJson(v));
      });
    }
    if (json['library'] != null) {
      library = <BookDetailsModal>[];
      json['library'].forEach((v) {
        library!.add(BookDetailsModal.fromJson(v));
      });
    }
    if (json['audio'] != null) {
      audio = <BookDetailsModal>[];
      json['audio'].forEach((v) {
        audio!.add(BookDetailsModal.fromJson(v));
      });
    }
    if (json['featuredCategory'] != null) {
      featuredCategory = <BookDetailsModal>[];
      json['featuredCategory'].forEach((v) {
        featuredCategory!.add(BookDetailsModal.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (homeCategory != null) {
      data['category'] = homeCategory!.map((v) => v.toJson()).toList();
    }

    /*  if (ebook != null) {
      data['ebook'] = ebook!.map((v) => v.toJson()).toList();
    }
    if (meditation != null) {
      data['meditation'] = meditation!.map((v) => v.toJson()).toList();
    }
    if (yoga != null) {
      data['yoga'] = yoga!.map((v) => v.toJson()).toList();
    }
    if (music != null) {
      data['music'] = music!.map((v) => v.toJson()).toList();
    }
    if (comic != null) {
      data['comic'] = comic!.map((v) => v.toJson()).toList();
    }
    if (library != null) {
      data['library'] = library!.map((v) => v.toJson()).toList();
    }
    if (audio != null) {
      data['audio'] = audio!.map((v) => v.toJson()).toList();
    }
    if (featuredCategory != null) {
      data['featuredCategory'] =
          featuredCategory!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}
