class CreateChallengeResponse {
  Data? data;
  bool? success;
  String? message;

  CreateChallengeResponse({this.data, this.success, this.message});

  CreateChallengeResponse.fromJson(Map<String, dynamic> json) {
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
  bool? applicationUser;

  Data({this.applicationUser});

  Data.fromJson(Map<String, dynamic> json) {
    applicationUser = json['applicationUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['applicationUser'] = applicationUser;
    return data;
  }
}