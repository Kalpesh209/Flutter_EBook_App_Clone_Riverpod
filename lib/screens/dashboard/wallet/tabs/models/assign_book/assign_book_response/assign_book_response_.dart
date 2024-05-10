class AssignBookResponse {
  Data? data;
  bool? success;
  String? message;

  AssignBookResponse({this.data, this.success, this.message});

  AssignBookResponse.fromJson(Map<String, dynamic> json) {
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
  List<BookOrder>? bookOrder;
  int? count;
  int? allCount;

  Data({this.bookOrder, this.count, this.allCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['bookOrder'] != null) {
      bookOrder = <BookOrder>[];
      json['bookOrder'].forEach((v) {
        bookOrder!.add(BookOrder.fromJson(v));
      });
    }
    count = json['count'];
    allCount = json['AllCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bookOrder != null) {
      data['bookOrder'] = bookOrder!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['AllCount'] = allCount;
    return data;
  }
}

class BookOrder {
  String? orderId;
  String? bookTitle;
  int? releaseYear;
  String? language;
  String? about;
  String? coverImage;
  String? bookTag;
  String? tag;
  bool? isPublish;
  String? orderNumber;
  User? user;
  BookMaster? bookMaster;

  //List<Null>? orderAddress;
  String? orderDate;
  String? assignDate;
  String? returnDate;
  String? orderStatus;
  dynamic bookCondition;
  dynamic image;
  dynamic remark;
  dynamic isExpanded;

  BookOrder({
    this.orderId,
    this.bookTitle,
    this.releaseYear,
    this.language,
    this.about,
    this.coverImage,
    this.bookTag,
    this.tag,
    this.isPublish,
    this.orderNumber,
    this.user,
    this.bookMaster,
    //this.orderAddress,
    this.orderDate,
    this.assignDate,
    this.returnDate,
    this.orderStatus,
    this.bookCondition,
    this.image,
    this.remark,
    this.isExpanded,
  });

  BookOrder.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    bookTitle = json['book_title'];
    releaseYear = json['release_year'];
    language = json['language'];
    about = json['about'];
    coverImage = json['cover_image'];
    bookTag = json['book_tag'];
    tag = json['tag'];
    isPublish = json['is_publish'];
    orderNumber = json['order_number'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    bookMaster = json['bookMaster'] != null
        ? BookMaster.fromJson(json['bookMaster'])
        : null;
    // if (json['orderAddress'] != null) {
    //   orderAddress = <Null>[];
    //   json['orderAddress'].forEach((v) {
    //     orderAddress!.add(Null.fromJson(v));
    //   });
    // }
    orderDate = json['order_date'];
    assignDate = json['assign_date'];
    returnDate = json['return_date'];
    orderStatus = json['order_status'];
    bookCondition = json['book_condition'];
    image = json['image'];
    remark = json['remark'];
    isExpanded = json['is_expended'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['book_title'] = bookTitle;
    data['release_year'] = releaseYear;
    data['language'] = language;
    data['about'] = about;
    data['cover_image'] = coverImage;
    data['book_tag'] = bookTag;
    data['tag'] = tag;
    data['is_publish'] = isPublish;
    data['order_number'] = orderNumber;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (bookMaster != null) {
      data['bookMaster'] = bookMaster!.toJson();
    }
    // if (orderAddress != null) {
    //   data['orderAddress'] = orderAddress!.map((v) => v.toJson()).toList();
    // }
    data['order_date'] = orderDate;
    data['assign_date'] = assignDate;
    data['return_date'] = returnDate;
    data['order_status'] = orderStatus;
    data['book_condition'] = bookCondition;
    data['image'] = image;
    data['remark'] = remark;
    data['is_expended'] = isExpanded;
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? mobileNumber;
  String? roleType;
  dynamic deviceType;
  dynamic deviceInfo;
  dynamic appId;
  bool? isQuizAttempt;
  String? verificationCode;
  bool? isVerified;
  bool? isActive;
  bool? isSuspended;
  bool? isAdmin;
  bool? isDeposit;
  bool? termsCondition;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
  String? sessionId;
  String? subscriptionId;
  dynamic fcmToken;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.mobileNumber,
      this.roleType,
      this.deviceType,
      this.deviceInfo,
      this.appId,
      this.isQuizAttempt,
      this.verificationCode,
      this.isVerified,
      this.isActive,
      this.isSuspended,
      this.isAdmin,
      this.isDeposit,
      this.termsCondition,
      this.profileImage,
      this.createdAt,
      this.updatedAt,
      this.sessionId,
      this.subscriptionId,
      this.fcmToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    mobileNumber = json['mobile_number'];
    roleType = json['role_type'];
    deviceType = json['device_type'];
    deviceInfo = json['device_info'];
    appId = json['app_id'];
    isQuizAttempt = json['is_quiz_attempt'];
    verificationCode = json['verification_code'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    isSuspended = json['is_suspended'];
    isAdmin = json['is_admin'];
    isDeposit = json['is_deposit'];
    termsCondition = json['terms_condition'];
    profileImage = json['profile_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sessionId = json['session_id'];
    subscriptionId = json['subscription_id'];
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['mobile_number'] = mobileNumber;
    data['role_type'] = roleType;
    data['device_type'] = deviceType;
    data['device_info'] = deviceInfo;
    data['app_id'] = appId;
    data['is_quiz_attempt'] = isQuizAttempt;
    data['verification_code'] = verificationCode;
    data['is_verified'] = isVerified;
    data['is_active'] = isActive;
    data['is_suspended'] = isSuspended;
    data['is_admin'] = isAdmin;
    data['is_deposit'] = isDeposit;
    data['terms_condition'] = termsCondition;
    data['profile_image'] = profileImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['session_id'] = sessionId;
    data['subscription_id'] = subscriptionId;
    data['fcmToken'] = fcmToken;
    return data;
  }
}

class BookMaster {
  String? id;
  String? bookTitle;
  int? releaseYear;
  bool? isFeatured;
  bool? isAudioBook;
  String? language;
  String? about;
  String? coverImage;
  String? iSBN;
  String? bookTag;
  String? tag;
  String? bookUsage;
  int? libraryQuantity;
  bool? isPublish;
  String? createdAt;
  String? updatedAt;

  BookMaster(
      {this.id,
      this.bookTitle,
      this.releaseYear,
      this.isFeatured,
      this.isAudioBook,
      this.language,
      this.about,
      this.coverImage,
      this.iSBN,
      this.bookTag,
      this.tag,
      this.bookUsage,
      this.libraryQuantity,
      this.isPublish,
      this.createdAt,
      this.updatedAt});

  BookMaster.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookTitle = json['book_title'];
    releaseYear = json['release_year'];
    isFeatured = json['is_featured'];
    isAudioBook = json['is_audio_book'];
    language = json['language'];
    about = json['about'];
    coverImage = json['cover_image'];
    iSBN = json['ISBN'];
    bookTag = json['book_tag'];
    tag = json['tag'];
    bookUsage = json['book_usage'];
    libraryQuantity = json['library_quantity'];
    isPublish = json['is_publish'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['book_title'] = bookTitle;
    data['release_year'] = releaseYear;
    data['is_featured'] = isFeatured;
    data['is_audio_book'] = isAudioBook;
    data['language'] = language;
    data['about'] = about;
    data['cover_image'] = coverImage;
    data['ISBN'] = iSBN;
    data['book_tag'] = bookTag;
    data['tag'] = tag;
    data['book_usage'] = bookUsage;
    data['library_quantity'] = libraryQuantity;
    data['is_publish'] = isPublish;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
