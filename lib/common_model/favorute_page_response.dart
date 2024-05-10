import '../screens/dashboard/home/models/home_literarypicks_model.dart';
import 'favourite_book_model.dart';

class FavoritePageResponse {
  Data? data;
  bool? success;
  String? message;

  FavoritePageResponse({this.data, this.success, this.message});

  FavoritePageResponse.fromJson(Map<String, dynamic> json) {
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
  List<FavouriteBookPicks>? favouriteBook;
  List<FavouriteBookPicks>? favouriteAudio;
  List<FavouriteBookPicks>? favouriteEBook;

  Data({
    this.favouriteBook,
    this.favouriteAudio,
    this.favouriteEBook,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['favouriteBook'] != null) {
      favouriteBook = <FavouriteBookPicks>[];
      json['favouriteBook'].forEach((v) {
        favouriteBook!.add(FavouriteBookPicks.fromJson(v));
      });
    }
    if (json['favouriteAudio'] != null) {
      favouriteAudio = <FavouriteBookPicks>[];
      json['favouriteAudio'].forEach((v) {
        favouriteAudio!.add(FavouriteBookPicks.fromJson(v));
      });
    }

    if (json['favouriteEBook'] != null) {
      favouriteEBook = <FavouriteBookPicks>[];
      json['favouriteEBook'].forEach((v) {
        favouriteEBook!.add(FavouriteBookPicks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (favouriteBook != null) {
      data['favouriteBook'] = favouriteBook!.map((v) => v.toJson()).toList();
    }

    if (favouriteAudio != null) {
      data['favouriteAudio'] = favouriteAudio!.map((v) => v.toJson()).toList();
    }

    if (favouriteEBook != null) {
      data['favouriteEBook'] = favouriteEBook!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
