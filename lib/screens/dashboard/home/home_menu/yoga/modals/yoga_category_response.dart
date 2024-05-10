class YogaCategoryResponse {
  Data? data;
  bool? success;
  String? message;

  YogaCategoryResponse({this.data, this.success, this.message});

  YogaCategoryResponse.fromJson(Map<String, dynamic> json) {
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
  List<ContentType>? contentType;

  Data({this.contentType});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['contentType'] != null) {
      contentType = <ContentType>[];
      json['contentType'].forEach((v) {
        contentType!.add(ContentType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (contentType != null) {
      data['contentType'] = contentType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContentType {
  String? categoryId;
  String? categoryName;

  ContentType({this.categoryId, this.categoryName});

  ContentType.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}
