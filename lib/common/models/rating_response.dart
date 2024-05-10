class RatingResponse {
  int? data;
  bool? success;
  String? message;

  RatingResponse({this.data, this.success, this.message});

  RatingResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}