// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_master.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookMaster _$BookMasterFromJson(Map<String, dynamic> json) {
  return _BookMaster.fromJson(json);
}

/// @nodoc
mixin _$BookMaster {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_title')
  String? get bookTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_year')
  int? get releaseYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_featured')
  bool? get isFeatured => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_audio_book')
  bool? get isAudioBook => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'ISBN')
  String? get isbn => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_tag')
  String? get bookTag => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_usage')
  String? get bookUsage => throw _privateConstructorUsedError;
  @JsonKey(name: 'library_quantity')
  int? get libraryQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_publish')
  bool? get isPublish => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookMasterCopyWith<BookMaster> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookMasterCopyWith<$Res> {
  factory $BookMasterCopyWith(
          BookMaster value, $Res Function(BookMaster) then) =
      _$BookMasterCopyWithImpl<$Res, BookMaster>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'book_title') String? bookTitle,
      @JsonKey(name: 'release_year') int? releaseYear,
      @JsonKey(name: 'is_featured') bool? isFeatured,
      @JsonKey(name: 'is_audio_book') bool? isAudioBook,
      String? language,
      String? about,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'ISBN') String? isbn,
      @JsonKey(name: 'book_tag') String? bookTag,
      String? tag,
      @JsonKey(name: 'book_usage') String? bookUsage,
      @JsonKey(name: 'library_quantity') int? libraryQuantity,
      @JsonKey(name: 'is_publish') bool? isPublish,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$BookMasterCopyWithImpl<$Res, $Val extends BookMaster>
    implements $BookMasterCopyWith<$Res> {
  _$BookMasterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookTitle = freezed,
    Object? releaseYear = freezed,
    Object? isFeatured = freezed,
    Object? isAudioBook = freezed,
    Object? language = freezed,
    Object? about = freezed,
    Object? coverImage = freezed,
    Object? isbn = freezed,
    Object? bookTag = freezed,
    Object? tag = freezed,
    Object? bookUsage = freezed,
    Object? libraryQuantity = freezed,
    Object? isPublish = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseYear: freezed == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAudioBook: freezed == isAudioBook
          ? _value.isAudioBook
          : isAudioBook // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTag: freezed == bookTag
          ? _value.bookTag
          : bookTag // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      bookUsage: freezed == bookUsage
          ? _value.bookUsage
          : bookUsage // ignore: cast_nullable_to_non_nullable
              as String?,
      libraryQuantity: freezed == libraryQuantity
          ? _value.libraryQuantity
          : libraryQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookMasterImplCopyWith<$Res>
    implements $BookMasterCopyWith<$Res> {
  factory _$$BookMasterImplCopyWith(
          _$BookMasterImpl value, $Res Function(_$BookMasterImpl) then) =
      __$$BookMasterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'book_title') String? bookTitle,
      @JsonKey(name: 'release_year') int? releaseYear,
      @JsonKey(name: 'is_featured') bool? isFeatured,
      @JsonKey(name: 'is_audio_book') bool? isAudioBook,
      String? language,
      String? about,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'ISBN') String? isbn,
      @JsonKey(name: 'book_tag') String? bookTag,
      String? tag,
      @JsonKey(name: 'book_usage') String? bookUsage,
      @JsonKey(name: 'library_quantity') int? libraryQuantity,
      @JsonKey(name: 'is_publish') bool? isPublish,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$BookMasterImplCopyWithImpl<$Res>
    extends _$BookMasterCopyWithImpl<$Res, _$BookMasterImpl>
    implements _$$BookMasterImplCopyWith<$Res> {
  __$$BookMasterImplCopyWithImpl(
      _$BookMasterImpl _value, $Res Function(_$BookMasterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookTitle = freezed,
    Object? releaseYear = freezed,
    Object? isFeatured = freezed,
    Object? isAudioBook = freezed,
    Object? language = freezed,
    Object? about = freezed,
    Object? coverImage = freezed,
    Object? isbn = freezed,
    Object? bookTag = freezed,
    Object? tag = freezed,
    Object? bookUsage = freezed,
    Object? libraryQuantity = freezed,
    Object? isPublish = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BookMasterImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseYear: freezed == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAudioBook: freezed == isAudioBook
          ? _value.isAudioBook
          : isAudioBook // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTag: freezed == bookTag
          ? _value.bookTag
          : bookTag // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      bookUsage: freezed == bookUsage
          ? _value.bookUsage
          : bookUsage // ignore: cast_nullable_to_non_nullable
              as String?,
      libraryQuantity: freezed == libraryQuantity
          ? _value.libraryQuantity
          : libraryQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookMasterImpl implements _BookMaster {
  _$BookMasterImpl(
      {this.id,
      @JsonKey(name: 'book_title') this.bookTitle,
      @JsonKey(name: 'release_year') this.releaseYear,
      @JsonKey(name: 'is_featured') this.isFeatured,
      @JsonKey(name: 'is_audio_book') this.isAudioBook,
      this.language,
      this.about,
      @JsonKey(name: 'cover_image') this.coverImage,
      @JsonKey(name: 'ISBN') this.isbn,
      @JsonKey(name: 'book_tag') this.bookTag,
      this.tag,
      @JsonKey(name: 'book_usage') this.bookUsage,
      @JsonKey(name: 'library_quantity') this.libraryQuantity,
      @JsonKey(name: 'is_publish') this.isPublish,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$BookMasterImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookMasterImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'book_title')
  final String? bookTitle;
  @override
  @JsonKey(name: 'release_year')
  final int? releaseYear;
  @override
  @JsonKey(name: 'is_featured')
  final bool? isFeatured;
  @override
  @JsonKey(name: 'is_audio_book')
  final bool? isAudioBook;
  @override
  final String? language;
  @override
  final String? about;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @override
  @JsonKey(name: 'ISBN')
  final String? isbn;
  @override
  @JsonKey(name: 'book_tag')
  final String? bookTag;
  @override
  final String? tag;
  @override
  @JsonKey(name: 'book_usage')
  final String? bookUsage;
  @override
  @JsonKey(name: 'library_quantity')
  final int? libraryQuantity;
  @override
  @JsonKey(name: 'is_publish')
  final bool? isPublish;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BookMaster(id: $id, bookTitle: $bookTitle, releaseYear: $releaseYear, isFeatured: $isFeatured, isAudioBook: $isAudioBook, language: $language, about: $about, coverImage: $coverImage, isbn: $isbn, bookTag: $bookTag, tag: $tag, bookUsage: $bookUsage, libraryQuantity: $libraryQuantity, isPublish: $isPublish, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookMasterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookTitle, bookTitle) ||
                other.bookTitle == bookTitle) &&
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.isAudioBook, isAudioBook) ||
                other.isAudioBook == isAudioBook) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.bookTag, bookTag) || other.bookTag == bookTag) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.bookUsage, bookUsage) ||
                other.bookUsage == bookUsage) &&
            (identical(other.libraryQuantity, libraryQuantity) ||
                other.libraryQuantity == libraryQuantity) &&
            (identical(other.isPublish, isPublish) ||
                other.isPublish == isPublish) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bookTitle,
      releaseYear,
      isFeatured,
      isAudioBook,
      language,
      about,
      coverImage,
      isbn,
      bookTag,
      tag,
      bookUsage,
      libraryQuantity,
      isPublish,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookMasterImplCopyWith<_$BookMasterImpl> get copyWith =>
      __$$BookMasterImplCopyWithImpl<_$BookMasterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookMasterImplToJson(
      this,
    );
  }
}

abstract class _BookMaster implements BookMaster {
  factory _BookMaster(
          {final String? id,
          @JsonKey(name: 'book_title') final String? bookTitle,
          @JsonKey(name: 'release_year') final int? releaseYear,
          @JsonKey(name: 'is_featured') final bool? isFeatured,
          @JsonKey(name: 'is_audio_book') final bool? isAudioBook,
          final String? language,
          final String? about,
          @JsonKey(name: 'cover_image') final String? coverImage,
          @JsonKey(name: 'ISBN') final String? isbn,
          @JsonKey(name: 'book_tag') final String? bookTag,
          final String? tag,
          @JsonKey(name: 'book_usage') final String? bookUsage,
          @JsonKey(name: 'library_quantity') final int? libraryQuantity,
          @JsonKey(name: 'is_publish') final bool? isPublish,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$BookMasterImpl;

  factory _BookMaster.fromJson(Map<String, dynamic> json) =
      _$BookMasterImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'book_title')
  String? get bookTitle;
  @override
  @JsonKey(name: 'release_year')
  int? get releaseYear;
  @override
  @JsonKey(name: 'is_featured')
  bool? get isFeatured;
  @override
  @JsonKey(name: 'is_audio_book')
  bool? get isAudioBook;
  @override
  String? get language;
  @override
  String? get about;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;
  @override
  @JsonKey(name: 'ISBN')
  String? get isbn;
  @override
  @JsonKey(name: 'book_tag')
  String? get bookTag;
  @override
  String? get tag;
  @override
  @JsonKey(name: 'book_usage')
  String? get bookUsage;
  @override
  @JsonKey(name: 'library_quantity')
  int? get libraryQuantity;
  @override
  @JsonKey(name: 'is_publish')
  bool? get isPublish;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BookMasterImplCopyWith<_$BookMasterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
