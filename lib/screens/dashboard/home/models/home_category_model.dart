

class HomeCategory{
  String? id;
  String? type;
  String? mainType;
  String? language;
  bool? isFeature;
  String? image;
  String? createdAt;
  String? updatedAt;

  HomeCategory({
    this.id,
    this.type,
    this.mainType,
    this.language,
    this.isFeature,
    this.image,
    this.createdAt,
    this.updatedAt,
});

  HomeCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    mainType = json['main_type'];
    language = json['language'];
    isFeature = json['is_feature'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['main_type'] = mainType;
    data['language'] = language;
    data['is_feature'] = isFeature;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    return data;
  }
}