class WalletRewardsSubmitResponse {
  bool? success;
  String? message;

  WalletRewardsSubmitResponse({this.success, this.message});

  WalletRewardsSubmitResponse.fromJson(Map<String, dynamic> json) {

    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['success'] = success;
    data['message'] = message;
    return data;
  }
}


