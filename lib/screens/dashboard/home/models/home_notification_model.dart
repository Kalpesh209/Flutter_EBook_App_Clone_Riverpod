

class HomeNotification{
  String? id;
  String? title;
  String? content;
  String? image;
  String? body;
  String? notificationType;
  bool? isRead;
  String? createdAt;

  HomeNotification({
    this.id,
    this.title,
    this.content,
    this.image,
    this.body,
    this.notificationType,
    this.isRead,
    this.createdAt,
});

  HomeNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    body = json['body'];
    notificationType = json['notificationType'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['body'] = body;
    data['notificationType'] = notificationType;
    data['is_read'] = isRead;
    data['created_at'] = createdAt;

    return data;
  }
}