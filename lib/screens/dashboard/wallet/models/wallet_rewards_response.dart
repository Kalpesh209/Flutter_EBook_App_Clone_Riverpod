class WalletRewardsResponse {
  RewardsData? data;
  bool? success;
  String? message;

  WalletRewardsResponse({this.data, this.success, this.message});

  WalletRewardsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? RewardsData.fromJson(json['data']) : null;
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

class RewardsData {
  int? userRewardPoint;
  List<Rewards>? rewards;

  RewardsData({this.userRewardPoint, this.rewards});

  RewardsData.fromJson(Map<String, dynamic> json) {
    userRewardPoint = json['userRewardPoint'];
    if (json['rewards'] != null) {
      rewards = <Rewards>[];
      json['rewards'].forEach((v) {
        rewards!.add(Rewards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userRewardPoint'] = userRewardPoint;
    if (rewards != null) {
      data['rewards'] = rewards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rewards {
  String? id;
  String? title;
  int? point;
  int? numberOfDays;
  String? availableAt;
  String? createdAt;
  String? updatedAt;

  Rewards(
      {this.id,
        this.title,
        this.point,
        this.numberOfDays,
        this.availableAt,
        this.createdAt,
        this.updatedAt});

  Rewards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    point = json['point'];
    numberOfDays = json['number_of_days'];
    availableAt = json['availableAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['point'] = point;
    data['number_of_days'] = numberOfDays;
    data['availableAt'] = availableAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
