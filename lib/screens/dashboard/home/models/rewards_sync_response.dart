class RewardsSyncResponse {
  Data? data;
  bool? success;
  String? message;

  RewardsSyncResponse({this.data, this.success, this.message});

  RewardsSyncResponse.fromJson(Map<String, dynamic> json) {
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
  int? syncDay;

  Data({this.syncDay});

  Data.fromJson(Map<String, dynamic> json) {
    syncDay = json['sync_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sync_day'] = syncDay;
    return data;
  }
}