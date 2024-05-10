class RewardSaveResponse {
  String? data;
  bool? success;
  String? message;

  RewardSaveResponse({this.data, this.success, this.message});

  RewardSaveResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = data;
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
