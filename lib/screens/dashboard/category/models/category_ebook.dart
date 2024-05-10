class EBookCategoryPicks {
  String? id;
  String? type;
  String? mainType;
  String? language;
  bool? isFeatured;
  String? image;
  String? createAt;
  String? updateAt;

  EBookCategoryPicks({
    this.id,
    this.type,
    this.mainType,
    this.language,
    this.isFeatured,
    this.image,
    this.createAt,
    this.updateAt,
  });

  EBookCategoryPicks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    mainType = json['main_type'];
    language = json['language'];
    isFeatured = json['is_featured'];
    image = json['image'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['main_type'] = mainType;
    data['language'] = language;
    data['is_featured'] = isFeatured;
    data['image'] = image;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;

    return data;
  }
}
