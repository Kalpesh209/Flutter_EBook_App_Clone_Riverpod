class BookChallengeDashboardResponse {
  Data? data;
  bool? success;
  String? message;

  BookChallengeDashboardResponse({this.data, this.success, this.message});

  BookChallengeDashboardResponse.fromJson(Map<String, dynamic> json) {
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
  MainUser? user;
  List<Invitations>? invitations;
  List<AcceptedChallengesStatus>? acceptedChallengesStatus;

  Data({this.user, this.invitations});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? MainUser.fromJson(json['user']) : null;
    if (json['invitations'] != null) {
      invitations = <Invitations>[];
      json['invitations'].forEach((v) {
        invitations!.add(Invitations.fromJson(v));
      });
    }
    if (json['acceptedChallengesStatus'] != null) {
      acceptedChallengesStatus = <AcceptedChallengesStatus>[];
      json['acceptedChallengesStatus'].forEach((v) {
        acceptedChallengesStatus!.add(AcceptedChallengesStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (invitations != null) {
      data['invitations'] = invitations!.map((v) => v.toJson()).toList();
    }
    if (acceptedChallengesStatus != null) {
      data['acceptedChallengesStatus'] =
          acceptedChallengesStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainUser {
  String? name;
  int? point;
  String? profileImage;
  MainUser({this.name, this.point, this.profileImage});
  MainUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    point = json['point'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['point'] = point;
    data['profile_image'] = profileImage;
    return data;
  }
}

class Invitations {
  String? id;
  String? status;
  String? createdAt;
  String? challengeEndAt;
  InviteUser? user;
  InviteUser? challenger;
  List<ChallengeBooks>? challengeBooks;

  Invitations(
      {this.id,
        this.status,
        this.createdAt,
        this.challengeEndAt,
        this.user,
        this.challenger,
        this.challengeBooks});

  Invitations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    challengeEndAt = json['challenge_end_at'];
    user = json['user'] != null ? InviteUser.fromJson(json['user']) : null;
    challenger = json['challenger'] != null
        ? InviteUser.fromJson(json['challenger'])
        : null;
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
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (challenger != null) {
      data['challenger'] = challenger!.toJson();
    }
    if (challengeBooks != null) {
      data['challengeBooks'] =
          challengeBooks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InviteUser {
  String? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? profileImage;

  InviteUser(
      {this.id,
        this.firstName,
        this.lastName,
        this.mobileNumber,
        this.profileImage});

  InviteUser.fromJson(Map<String, dynamic> json) {
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

class AcceptedChallengesStatus {
  String? id;
  String? status;
  String? createdAt;
  String? challengeEndAt;
  List<ChallengeBooks>? challengeBooks;
  InviteUser? challenger;

  AcceptedChallengesStatus(
      {this.id, this.status, this.challengeBooks, this.challenger});

  AcceptedChallengesStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    challengeEndAt = json['challenge_end_at'];
    if (json['challengeBooks'] != null) {
      challengeBooks = <ChallengeBooks>[];
      json['challengeBooks'].forEach((v) {
        challengeBooks!.add(ChallengeBooks.fromJson(v));
      });
    }
    challenger = json['challenger'] != null
        ? InviteUser.fromJson(json['challenger'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['challenge_end_at'] = challengeEndAt;
    if (challengeBooks != null) {
      data['challengeBooks'] =
          challengeBooks!.map((v) => v.toJson()).toList();
    }
    if (challenger != null) {
      data['challenger'] = challenger!.toJson();
    }
    return data;
  }
}

