class BookInvitationResponse {
  Data? data;
  bool? success;
  String? message;

  BookInvitationResponse({this.data, this.success, this.message});

  BookInvitationResponse.fromJson(Map<String, dynamic> json) {
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
  List<InvitationsStatus>? invitations;
  MetaData? metaData;

  Data({this.invitations, this.metaData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['invitations'] != null) {
      invitations = <InvitationsStatus>[];
      json['invitations'].forEach((v) {
        invitations!.add(InvitationsStatus.fromJson(v));
      });
    }
    metaData =
        json['meta_data'] != null ? MetaData.fromJson(json['meta_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (invitations != null) {
      data['invitations'] = invitations!.map((v) => v.toJson()).toList();
    }
    if (metaData != null) {
      data['meta_data'] = metaData!.toJson();
    }
    return data;
  }
}

class InvitationsStatus {
  String? id;
  String? status;
  String? createdAt;
  String? challengeEndAt;
  String? challengeDays;
  String? pointValue;
  User? user;
  User? challenger;
  List<ChallengeBooks>? challengeBooks;

  InvitationsStatus(
      {this.id,
      this.status,
      this.createdAt,
      this.challengeEndAt,
      this.challengeDays,
      this.pointValue,
      this.user,
      this.challenger,
      this.challengeBooks});

  InvitationsStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    challengeEndAt = json['challenge_end_at'];
    challengeDays = json['challenge_days'];
    pointValue = json['point_value'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    challenger =
        json['challenger'] != null ? User.fromJson(json['challenger']) : null;
    if (json['challengeBooks'] != null) {
      challengeBooks = <ChallengeBooks>[];
      json['challengeBooks'].forEach((v) {
        challengeBooks!.add(ChallengeBooks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['challenge_end_at'] = challengeEndAt;
    data['challenge_days'] = challengeDays;
    data['point_value'] = pointValue;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (challenger != null) {
      data['challenger'] = challenger!.toJson();
    }
    if (challengeBooks != null) {
      data['challengeBooks'] = challengeBooks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? profileImage;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNumber = json['mobile_number'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile_number'] = mobileNumber;
    data['profile_image'] = profileImage;
    return data;
  }
}

class ChallengeBooks {
  String? id;
  String? orderStatus;
  Book? book;

  ChallengeBooks({this.id, this.orderStatus, this.book});

  ChallengeBooks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderStatus = json['order_status'];
    book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_status'] = orderStatus;
    if (book != null) {
      data['book'] = book!.toJson();
    }
    return data;
  }
}

class Book {
  String? id;
  String? bookTitle;
  String? coverImage;
  ContentType? contentType;
  AuthorMaster? authorMaster;
  int? rating;

  Book(
      {this.id,
      this.bookTitle,
      this.coverImage,
      this.contentType,
      this.authorMaster,
      this.rating});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookTitle = json['book_title'];
    coverImage = json['cover_image'];
    contentType = json['contentType'] != null
        ? ContentType.fromJson(json['contentType'])
        : null;
    authorMaster = json['authorMaster'] != null
        ? AuthorMaster.fromJson(json['authorMaster'])
        : null;
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['book_title'] = bookTitle;
    data['cover_image'] = coverImage;
    if (contentType != null) {
      data['contentType'] = contentType!.toJson();
    }
    if (authorMaster != null) {
      data['authorMaster'] = authorMaster!.toJson();
    }
    data['rating'] = rating;
    return data;
  }
}

class ContentType {
  String? id;
  String? type;

  ContentType({this.id, this.type});

  ContentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class AuthorMaster {
  String? id;
  String? authorName;

  AuthorMaster({this.id, this.authorName});

  AuthorMaster.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorName = json['author_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['author_name'] = authorName;
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
