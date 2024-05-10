

class FavouriteBookPicks{
  String? id;
  String? bookId;
  String? mainTitle;
  String? bookUsage;
  String? aboutUs;
  int? chapter;
  String? bookTitle;
  String? subTitle;
  String? contentType;
  String? categoryId;
  String? source;
  int? releaseYear;
  String? language;
  String? coverImage;
  String? bookTag;
  String? authorName;
  String? tag;
  bool? isPublish;
  String? createdAt;
  String? rating;
  bool? isRead;
  bool? isAudioBook;


  FavouriteBookPicks({
    this.id,
    this.bookId,
    this.mainTitle,
    this.bookUsage,
    this.aboutUs,
    this.chapter,
    this.bookTitle,
    this.subTitle,
    this.categoryId,
    this.contentType,
    this.source,
    this.releaseYear,
    this.language,
    this.coverImage,
    this.bookTag,
    this.authorName,
    this.tag,
    this.isPublish,
    this.createdAt,
    this.rating,
    this.isRead,
    this.isAudioBook,
});

  FavouriteBookPicks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['book_id'];
    mainTitle = json['main_title'];
    bookUsage = json['book_usage'];
    aboutUs = json['about'];
    chapter = json['chapter'];
    bookTitle = json['book_title'];
    subTitle = json['sub_title'];
    categoryId = json['category_id'];
    contentType = json['content_type'];
    source = json['source'];
    releaseYear = json['release_year'];
    language = json['language'];
    coverImage = json['cover_image'];
    bookTag = json['book_tag'];
    authorName = json['author_name'];
    tag = json['tag'];
    isPublish = json['is_publish'];
    createdAt = json['created_at'];
    rating = json['rating'];
    isRead = json['is_cart'];
    isAudioBook = json['is_audio_book'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['book_id'] = bookId;
    data['main_title'] = mainTitle;
    data['book_usage'] = bookUsage;
    data['about'] = aboutUs;
    data['chapter'] = chapter;
    data['book_title'] = bookTitle;
    data['sub_title'] = subTitle;
    data['category_id'] = categoryId;
    data['content_type'] = contentType;
    data['source'] = source;
    data['release_year'] = releaseYear;
    data['language'] = language;
    data['cover_image'] = coverImage;
    data['book_tag'] = bookTag;
    data['author_name'] = authorName;
    data['tag'] = tag;
    data['rating'] = rating;
    data['is_cart'] = isRead;
    data['is_publish'] = isPublish;
    data['created_at'] = createdAt;
    data['is_audio_book'] = isAudioBook;

    return data;
  }
}