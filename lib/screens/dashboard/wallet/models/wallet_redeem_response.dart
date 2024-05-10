class WalletRedeemResponse {
  RedeemData? data;
  bool? success;
  String? message;

  WalletRedeemResponse({this.data, this.success, this.message});

  WalletRedeemResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? RedeemData.fromJson(json['data']) : null;
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

class RedeemData {
  List<RedeemRewards>? rewards;
  MetaData? metaData;

  RedeemData({this.rewards, this.metaData});

  RedeemData.fromJson(Map<String, dynamic> json) {
    if (json['rewards'] != null) {
      rewards = <RedeemRewards>[];
      json['rewards'].forEach((v) {
        rewards!.add(RedeemRewards.fromJson(v));
      });
    }
    metaData = json['meta_data'] != null
        ? MetaData.fromJson(json['meta_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rewards != null) {
      data['rewards'] = rewards!.map((v) => v.toJson()).toList();
    }
    if (metaData != null) {
      data['meta_data'] = metaData!.toJson();
    }
    return data;
  }
}

class RedeemRewards {
  String? id;
  String? title;
  int? point;
  String? expiredAt;
  String? createdAt;
  String? updatedAt;

  RedeemRewards(
      {this.id,
        this.title,
        this.point,
        this.expiredAt,
        this.createdAt,
        this.updatedAt});

  RedeemRewards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    point = json['point'];
    expiredAt = json['expiredAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['point'] = point;
    data['expiredAt'] = expiredAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class MetaData {
  int? total;
  int? perPage;

  MetaData({this.total, this.perPage});

  MetaData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['perPage'] = perPage;
    return data;
  }
}
