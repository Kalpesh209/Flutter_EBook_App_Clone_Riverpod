// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_id')
  String? get bookId => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_title')
  String? get bookTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_usage')
  String? get bookUsage => throw _privateConstructorUsedError;
  @JsonKey(name: 'library_quantity')
  int? get libraryQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_year')
  int? get releaseYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'ISBN')
  String? get isbn => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_tag')
  String? get bookTag => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_name')
  String? get authorName => throw _privateConstructorUsedError;

  @JsonKey(name: 'rating')
  String? get rating => throw _privateConstructorUsedError;

  String? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'book_id') String? bookId,
      @JsonKey(name: 'book_title') String? bookTitle,
      @JsonKey(name: 'book_usage') String? bookUsage,
      @JsonKey(name: 'library_quantity') int? libraryQuantity,
      @JsonKey(name: 'release_year') int? releaseYear,
      @JsonKey(name: 'ISBN') String? isbn,
      String? language,
      String? about,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'book_tag') String? bookTag,
      @JsonKey(name: 'author_name') String? authorName,
      @JsonKey(name: 'rating') String? rating,
      String? tag});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookId = freezed,
    Object? bookTitle = freezed,
    Object? bookUsage = freezed,
    Object? libraryQuantity = freezed,
    Object? releaseYear = freezed,
    Object? isbn = freezed,
    Object? language = freezed,
    Object? about = freezed,
    Object? coverImage = freezed,
    Object? bookTag = freezed,
    Object? authorName = freezed,
    Object? rating = freezed,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      bookUsage: freezed == bookUsage
          ? _value.bookUsage
          : bookUsage // ignore: cast_nullable_to_non_nullable
              as String?,
      libraryQuantity: freezed == libraryQuantity
          ? _value.libraryQuantity
          : libraryQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      releaseYear: freezed == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int?,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTag: freezed == bookTag
          ? _value.bookTag
          : bookTag // ignore: cast_nullable_to_non_nullable
              as String?,

      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,

      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'book_id') String? bookId,
      @JsonKey(name: 'book_title') String? bookTitle,
      @JsonKey(name: 'book_usage') String? bookUsage,
      @JsonKey(name: 'library_quantity') int? libraryQuantity,
      @JsonKey(name: 'release_year') int? releaseYear,
      @JsonKey(name: 'ISBN') String? isbn,
      String? language,
      String? about,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'book_tag') String? bookTag,
      @JsonKey(name: 'author_name') String? authorName,
      @JsonKey(name: 'rating') String? rating,
      String? tag});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookId = freezed,
    Object? bookTitle = freezed,
    Object? bookUsage = freezed,
    Object? libraryQuantity = freezed,
    Object? releaseYear = freezed,
    Object? isbn = freezed,
    Object? language = freezed,
    Object? about = freezed,
    Object? coverImage = freezed,
    Object? bookTag = freezed,
    Object? authorName = freezed,
    Object? rating = freezed,
    Object? tag = freezed,
  }) {
    return _then(_$CartImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      bookUsage: freezed == bookUsage
          ? _value.bookUsage
          : bookUsage // ignore: cast_nullable_to_non_nullable
              as String?,
      libraryQuantity: freezed == libraryQuantity
          ? _value.libraryQuantity
          : libraryQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      releaseYear: freezed == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int?,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTag: freezed == bookTag
          ? _value.bookTag
          : bookTag // ignore: cast_nullable_to_non_nullable
              as String?,

      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  _$CartImpl(
      {this.id,
      @JsonKey(name: 'book_id') this.bookId,
      @JsonKey(name: 'book_title') this.bookTitle,
      @JsonKey(name: 'book_usage') this.bookUsage,
      @JsonKey(name: 'library_quantity') this.libraryQuantity,
      @JsonKey(name: 'release_year') this.releaseYear,
      @JsonKey(name: 'ISBN') this.isbn,
      this.language,
      this.about,
      @JsonKey(name: 'cover_image') this.coverImage,
      @JsonKey(name: 'book_tag') this.bookTag,
      @JsonKey(name: 'author_name') this.authorName,
      @JsonKey(name: 'rating') this.rating,
      this.tag});

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'book_id')
  final String? bookId;
  @override
  @JsonKey(name: 'book_title')
  final String? bookTitle;
  @override
  @JsonKey(name: 'book_usage')
  final String? bookUsage;
  @override
  @JsonKey(name: 'library_quantity')
  final int? libraryQuantity;
  @override
  @JsonKey(name: 'release_year')
  final int? releaseYear;
  @override
  @JsonKey(name: 'ISBN')
  final String? isbn;
  @override
  final String? language;
  @override
  final String? about;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @override
  @JsonKey(name: 'book_tag')
  final String? bookTag;
  @JsonKey(name: 'author_name')
  final String? authorName;

  @JsonKey(name: 'rating')
  final String? rating;
  @override
  final String? tag;

  @override
  String toString() {
    return 'Cart(id: $id, bookId: $bookId, bookTitle: $bookTitle, bookUsage: $bookUsage, libraryQuantity: $libraryQuantity, releaseYear: $releaseYear, isbn: $isbn, language: $language, about: $about, coverImage: $coverImage, bookTag: $bookTag, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.bookTitle, bookTitle) ||
                other.bookTitle == bookTitle) &&
            (identical(other.bookUsage, bookUsage) ||
                other.bookUsage == bookUsage) &&
            (identical(other.libraryQuantity, libraryQuantity) ||
                other.libraryQuantity == libraryQuantity) &&
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.language, language) || other.language == language) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.coverImage, coverImage) || other.coverImage == coverImage) &&
            (identical(other.bookTag, bookTag) || other.bookTag == bookTag) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bookId,
      bookTitle,
      bookUsage,
      libraryQuantity,
      releaseYear,
      isbn,
      language,
      about,
      coverImage,
      bookTag,
      tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  factory _Cart(
      {final String? id,
      @JsonKey(name: 'book_id') final String? bookId,
      @JsonKey(name: 'book_title') final String? bookTitle,
      @JsonKey(name: 'book_usage') final String? bookUsage,
      @JsonKey(name: 'library_quantity') final int? libraryQuantity,
      @JsonKey(name: 'release_year') final int? releaseYear,
      @JsonKey(name: 'ISBN') final String? isbn,
      final String? language,
      final String? about,
      @JsonKey(name: 'cover_image') final String? coverImage,
      @JsonKey(name: 'book_tag') final String? bookTag,
      @JsonKey(name: 'author_name') final String? authorName,
      @JsonKey(name: 'rating') final String? rating,
      final String? tag}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'book_id')
  String? get bookId;
  @override
  @JsonKey(name: 'book_title')
  String? get bookTitle;
  @override
  @JsonKey(name: 'book_usage')
  String? get bookUsage;
  @override
  @JsonKey(name: 'library_quantity')
  int? get libraryQuantity;
  @override
  @JsonKey(name: 'release_year')
  int? get releaseYear;
  @override
  @JsonKey(name: 'ISBN')
  String? get isbn;
  @override
  String? get language;
  @override
  String? get about;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;
  @override
  @JsonKey(name: 'book_tag')
  String? get bookTag;
  @override
  String? get tag;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
