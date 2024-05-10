  class AuthorNotes {
  String? id;
  String? authorName;
  String? image;
  String? createAt;
  String? updateAt;

  AuthorNotes({
    this.id,
    this.authorName,
    this.image,
    this.createAt,
    this.updateAt,
  });

  AuthorNotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorName = json['author_name'];
    image = json['image'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['author_name'] = authorName;
    data['image'] = image;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;

    return data;
  }
}
