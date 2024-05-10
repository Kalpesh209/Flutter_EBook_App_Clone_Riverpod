// To parse this JSON data, do
//
//     final audiobookcategorimodel = audiobookcategorimodelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_ebook_app_clone_riverpod/screens/dashboard/home/models/book_details_modal.dart';

Audiobookcategorimodel audiobookcategorimodelFromJson(String str) =>
    Audiobookcategorimodel.fromJson(json.decode(str));

String audiobookcategorimodelToJson(Audiobookcategorimodel data) =>
    json.encode(data.toJson());

class Audiobookcategorimodel {
  Data data;
  bool success;
  String message;

  Audiobookcategorimodel({
    required this.data,
    required this.success,
    required this.message,
  });

  factory Audiobookcategorimodel.fromJson(Map<String, dynamic> json) =>
      Audiobookcategorimodel(
        data: Data.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "success": success,
        "message": message,
      };
}

class Data {
  List<Category> category;
  int count;
  int allCount;

  Data({
    required this.category,
    required this.count,
    required this.allCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        count: json["count"],
        allCount: json["AllCount"],
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "count": count,
        "AllCount": allCount,
      };
}

class Category {
  String categoryId;
  String categoryName;
  List<BookDetailsModal> books;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.books,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        books: List<BookDetailsModal>.from(
            json["books"].map((x) => BookDetailsModal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
      };
}
