class NotificationResponse {
  List<NotificationData>? data;
  bool? success;
  String? message;

  NotificationResponse({this.data, this.success, this.message});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(NotificationData.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class NotificationData {
  String? id;
  String? title;
  String? content;
  String? image;
  String? body;
  String? notificationType;
  bool? isRead;
  String? createdAt;

  NotificationData({
    this.id,
    this.title,
    this.content,
    this.image,
    this.body,
    this.notificationType,
    this.isRead,
    this.createdAt,
  });

  NotificationData.fromJson(Map<String, dynamic> json) {
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
