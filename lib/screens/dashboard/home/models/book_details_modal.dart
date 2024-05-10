class BookDetailsModal {
  String? id;
  String? bookId;
  String? yogaId;
  String? title;
  String? subTitle;
  String? tags;
  String? language;
  String? image;
  String? categoryId;
  String? category;
  bool? isPublish;
  String? rating;
  String? bookTag;
  String? tag;
  String? releaseYear;
  String? about;
  int? chapter;
  String? authorName;
  String? coverImage;
  String? bookTitle;
  String? contentType;
  String? source;
  bool? isFavourite;
  String? description;
  bool? isCart;
  String? type;
  bool? isFeatured;
  String? cartId;
  int? chapters;
  int? srNo;
  String? videoUrl;
  String? bookContentLanguage;

  BookDetailsModal({
    this.id,
    this.bookId,
    this.yogaId,
    this.title,
    this.subTitle,
    this.tags,
    this.language,
    this.image,
    this.categoryId,
    this.category,
    this.isPublish,
    this.rating,
    this.bookTag,
    this.tag,
    this.releaseYear,
    this.about,
    this.chapter,
    this.authorName,
    this.coverImage,
    this.bookTitle,
    this.contentType,
    this.source,
    this.isFavourite,
    this.description,
    this.isCart,
    this.type,
    this.isFeatured,
    this.cartId,
    this.chapters,
    this.srNo,
    this.videoUrl,
    this.bookContentLanguage,
  });

  BookDetailsModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['book_id'];
    yogaId = json['yoga_id'];
    title = json['title'];
    subTitle = json['sub_title'];
    tags = json['tags'];
    language = json['language'];
    image = json['image'];
    categoryId = json['category_id'];
    category = json['category'];
    isPublish = json['is_publish'];
    rating = json['rating']/* != null ? double.parse(json['rating'].toString()) : 0.0*/;
    bookTag = json['book_tag'];
    tag = json['tag'];
    releaseYear =
        json['release_year'] != null ? json['release_year'].toString() : '';
    about = json['about'];
    chapter = json['chapter'];
    authorName = json['author_name'];
    coverImage = json['cover_image'];
    bookTitle = json['book_title'];
    contentType = json['content_type'];
    source = json['source'];
    isFavourite = json['is_favourite'];
    description = json['description'];
    isCart = json['is_cart'];
    type = json['type'];
    isFeatured = json['is_featured'];
    cartId = json['cart_id'];
    chapters = json['chapters'];
    srNo = json['sr_no'];
    videoUrl = json['video_url'];
    bookContentLanguage = json['book_content_language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['book_id'] = bookId;
    data['yoga_id'] = yogaId;
    data['title'] = title;
    data['sub_title'] = subTitle;
    data['tags'] = tags;
    data['language'] = language;
    data['image'] = image;
    data['category_id'] = categoryId;
    data['category'] = category;
    data['is_publish'] = isPublish;
    data['rating'] = rating;
    data['book_tag'] = bookTag;
    data['tag'] = tag;
    data['release_year'] = releaseYear;
    data['about'] = about;
    data['chapter'] = chapter;
    data['author_name'] = authorName;
    data['cover_image'] = coverImage;
    data['book_title'] = bookTitle;
    data['content_type'] = contentType;
    data['source'] = source;
    data['is_favourite'] = isFavourite;
    data['description'] = description;
    data['is_cart'] = isCart;
    data['type'] = type;
    data['is_favourite'] = isFavourite;
    data['cart_id'] = cartId;
    data['chapters'] = chapters;
    data['sr_no'] = srNo;
    data['video_url'] = videoUrl;
    data['book_content_language'] = bookContentLanguage;
    return data;
  }
}
