class UserData {
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? roleType;
  String? verificationCode;
  String? inviteCodeLink;
  String? profileImage;

  UserData(
      {this.firstName,
      this.lastName,
      this.mobileNumber,
      this.email,
      this.roleType,
      this.verificationCode,
      this.inviteCodeLink,
      this.profileImage});

  UserData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    roleType = json['role_type'];
    verificationCode = json['verification_code'];
    inviteCodeLink = json['invite_code_link'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['role_type'] = roleType;
    data['verification_code'] = verificationCode;
    data['invite_code_link'] = inviteCodeLink;
    data['profile_image'] = profileImage;
    return data;
  }
}
