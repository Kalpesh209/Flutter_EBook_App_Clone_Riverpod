// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteResponse _$FavoriteResponseFromJson(Map<String, dynamic> json) {
  return _FavoriteResponse.fromJson(json);
}

/// @nodoc
mixin _$FavoriteResponse {
  FavoriteData? get data => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteResponseCopyWith<FavoriteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteResponseCopyWith<$Res> {
  factory $FavoriteResponseCopyWith(
          FavoriteResponse value, $Res Function(FavoriteResponse) then) =
      _$FavoriteResponseCopyWithImpl<$Res, FavoriteResponse>;
  @useResult
  $Res call({FavoriteData? data, bool? success, String? message});

  $FavoriteDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FavoriteResponseCopyWithImpl<$Res, $Val extends FavoriteResponse>
    implements $FavoriteResponseCopyWith<$Res> {
  _$FavoriteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FavoriteData?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FavoriteDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $FavoriteDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavoriteResponseImplCopyWith<$Res>
    implements $FavoriteResponseCopyWith<$Res> {
  factory _$$FavoriteResponseImplCopyWith(_$FavoriteResponseImpl value,
          $Res Function(_$FavoriteResponseImpl) then) =
      __$$FavoriteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FavoriteData? data, bool? success, String? message});

  @override
  $FavoriteDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$FavoriteResponseImplCopyWithImpl<$Res>
    extends _$FavoriteResponseCopyWithImpl<$Res, _$FavoriteResponseImpl>
    implements _$$FavoriteResponseImplCopyWith<$Res> {
  __$$FavoriteResponseImplCopyWithImpl(_$FavoriteResponseImpl _value,
      $Res Function(_$FavoriteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_$FavoriteResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FavoriteData?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteResponseImpl implements _FavoriteResponse {
  _$FavoriteResponseImpl({this.data, this.success, this.message});

  factory _$FavoriteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteResponseImplFromJson(json);

  @override
  final FavoriteData? data;
  @override
  final bool? success;
  @override
  final String? message;

  @override
  String toString() {
    return 'FavoriteResponse(data: $data, success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, success, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteResponseImplCopyWith<_$FavoriteResponseImpl> get copyWith =>
      __$$FavoriteResponseImplCopyWithImpl<_$FavoriteResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteResponseImplToJson(
      this,
    );
  }
}

abstract class _FavoriteResponse implements FavoriteResponse {
  factory _FavoriteResponse(
      {final FavoriteData? data,
      final bool? success,
      final String? message}) = _$FavoriteResponseImpl;

  factory _FavoriteResponse.fromJson(Map<String, dynamic> json) =
      _$FavoriteResponseImpl.fromJson;

  @override
  FavoriteData? get data;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteResponseImplCopyWith<_$FavoriteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FavouriteMusic _$FavouriteMusicFromJson(Map<String, dynamic> json) {
  return _FavouriteMusic.fromJson(json);
}

/// @nodoc
mixin _$FavouriteMusic {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'track_id')
  String? get trackId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'track_url')
  dynamic get trackUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'music_id')
  dynamic get musicId => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavouriteMusicCopyWith<FavouriteMusic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteMusicCopyWith<$Res> {
  factory $FavouriteMusicCopyWith(
          FavouriteMusic value, $Res Function(FavouriteMusic) then) =
      _$FavouriteMusicCopyWithImpl<$Res, FavouriteMusic>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'track_id') String? trackId,
      String? title,
      String? description,
      String? image,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'track_url') dynamic trackUrl,
      @JsonKey(name: 'music_id') dynamic musicId,
      String? tag,
      int? rating});
}

/// @nodoc
class _$FavouriteMusicCopyWithImpl<$Res, $Val extends FavouriteMusic>
    implements $FavouriteMusicCopyWith<$Res> {
  _$FavouriteMusicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? trackId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? coverImage = freezed,
    Object? trackUrl = freezed,
    Object? musicId = freezed,
    Object? tag = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      trackId: freezed == trackId
          ? _value.trackId
          : trackId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      trackUrl: freezed == trackUrl
          ? _value.trackUrl
          : trackUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      musicId: freezed == musicId
          ? _value.musicId
          : musicId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouriteMusicImplCopyWith<$Res>
    implements $FavouriteMusicCopyWith<$Res> {
  factory _$$FavouriteMusicImplCopyWith(_$FavouriteMusicImpl value,
          $Res Function(_$FavouriteMusicImpl) then) =
      __$$FavouriteMusicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'track_id') String? trackId,
      String? title,
      String? description,
      String? image,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'track_url') dynamic trackUrl,
      @JsonKey(name: 'music_id') dynamic musicId,
      String? tag,
      int? rating});
}

/// @nodoc
class __$$FavouriteMusicImplCopyWithImpl<$Res>
    extends _$FavouriteMusicCopyWithImpl<$Res, _$FavouriteMusicImpl>
    implements _$$FavouriteMusicImplCopyWith<$Res> {
  __$$FavouriteMusicImplCopyWithImpl(
      _$FavouriteMusicImpl _value, $Res Function(_$FavouriteMusicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? trackId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? coverImage = freezed,
    Object? trackUrl = freezed,
    Object? musicId = freezed,
    Object? tag = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$FavouriteMusicImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      trackId: freezed == trackId
          ? _value.trackId
          : trackId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      trackUrl: freezed == trackUrl
          ? _value.trackUrl
          : trackUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      musicId: freezed == musicId
          ? _value.musicId
          : musicId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavouriteMusicImpl implements _FavouriteMusic {
  _$FavouriteMusicImpl(
      {this.id,
      @JsonKey(name: 'track_id') this.trackId,
      this.title,
      this.description,
      this.image,
      @JsonKey(name: 'cover_image') this.coverImage,
      @JsonKey(name: 'track_url') this.trackUrl,
      @JsonKey(name: 'music_id') this.musicId,
      this.tag,
      this.rating});

  factory _$FavouriteMusicImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavouriteMusicImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'track_id')
  final String? trackId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? image;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @override
  @JsonKey(name: 'track_url')
  final dynamic trackUrl;
  @override
  @JsonKey(name: 'music_id')
  final dynamic musicId;
  @override
  final String? tag;
  @override
  final int? rating;

  @override
  String toString() {
    return 'FavouriteMusic(id: $id, trackId: $trackId, title: $title, description: $description, image: $image, coverImage: $coverImage, trackUrl: $trackUrl, musicId: $musicId, tag: $tag, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteMusicImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trackId, trackId) || other.trackId == trackId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            const DeepCollectionEquality().equals(other.trackUrl, trackUrl) &&
            const DeepCollectionEquality().equals(other.musicId, musicId) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      trackId,
      title,
      description,
      image,
      coverImage,
      const DeepCollectionEquality().hash(trackUrl),
      const DeepCollectionEquality().hash(musicId),
      tag,
      rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteMusicImplCopyWith<_$FavouriteMusicImpl> get copyWith =>
      __$$FavouriteMusicImplCopyWithImpl<_$FavouriteMusicImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavouriteMusicImplToJson(
      this,
    );
  }
}

abstract class _FavouriteMusic implements FavouriteMusic {
  factory _FavouriteMusic(
      {final String? id,
      @JsonKey(name: 'track_id') final String? trackId,
      final String? title,
      final String? description,
      final String? image,
      @JsonKey(name: 'cover_image') final String? coverImage,
      @JsonKey(name: 'track_url') final dynamic trackUrl,
      @JsonKey(name: 'music_id') final dynamic musicId,
      final String? tag,
      final int? rating}) = _$FavouriteMusicImpl;

  factory _FavouriteMusic.fromJson(Map<String, dynamic> json) =
      _$FavouriteMusicImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'track_id')
  String? get trackId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get image;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;
  @override
  @JsonKey(name: 'track_url')
  dynamic get trackUrl;
  @override
  @JsonKey(name: 'music_id')
  dynamic get musicId;
  @override
  String? get tag;
  @override
  int? get rating;
  @override
  @JsonKey(ignore: true)
  _$$FavouriteMusicImplCopyWith<_$FavouriteMusicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteEbook _$FavoriteEbookFromJson(Map<String, dynamic> json) {
  return _FavoriteEbook.fromJson(json);
}

/// @nodoc
mixin _$FavoriteEbook {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_title')
  String? get bookTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_id')
  String? get bookId => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_year')
  int? get releaseYear => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_tag')
  dynamic get bookTag =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'author_name') dynamic author,
  String? get tag =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'is_publish') bool? isPublish,
// @JsonKey(name: 'is_featured') bool? isFeatured,
  int? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteEbookCopyWith<FavoriteEbook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteEbookCopyWith<$Res> {
  factory $FavoriteEbookCopyWith(
          FavoriteEbook value, $Res Function(FavoriteEbook) then) =
      _$FavoriteEbookCopyWithImpl<$Res, FavoriteEbook>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'book_title') String? bookTitle,
      @JsonKey(name: 'book_id') String? bookId,
      @JsonKey(name: 'release_year') int? releaseYear,
      String? language,
      String? about,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'book_tag') dynamic bookTag,
      String? tag,
      int? rating});
}

/// @nodoc
class _$FavoriteEbookCopyWithImpl<$Res, $Val extends FavoriteEbook>
    implements $FavoriteEbookCopyWith<$Res> {
  _$FavoriteEbookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookTitle = freezed,
    Object? bookId = freezed,
    Object? releaseYear = freezed,
    Object? language = freezed,
    Object? about = freezed,
    Object? coverImage = freezed,
    Object? bookTag = freezed,
    Object? tag = freezed,
    Object? rating = freezed,
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
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseYear: freezed == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as dynamic,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteEbookImplCopyWith<$Res>
    implements $FavoriteEbookCopyWith<$Res> {
  factory _$$FavoriteEbookImplCopyWith(
          _$FavoriteEbookImpl value, $Res Function(_$FavoriteEbookImpl) then) =
      __$$FavoriteEbookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'book_title') String? bookTitle,
      @JsonKey(name: 'book_id') String? bookId,
      @JsonKey(name: 'release_year') int? releaseYear,
      String? language,
      String? about,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'book_tag') dynamic bookTag,
      String? tag,
      int? rating});
}

/// @nodoc
class __$$FavoriteEbookImplCopyWithImpl<$Res>
    extends _$FavoriteEbookCopyWithImpl<$Res, _$FavoriteEbookImpl>
    implements _$$FavoriteEbookImplCopyWith<$Res> {
  __$$FavoriteEbookImplCopyWithImpl(
      _$FavoriteEbookImpl _value, $Res Function(_$FavoriteEbookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookTitle = freezed,
    Object? bookId = freezed,
    Object? releaseYear = freezed,
    Object? language = freezed,
    Object? about = freezed,
    Object? coverImage = freezed,
    Object? bookTag = freezed,
    Object? tag = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$FavoriteEbookImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTitle: freezed == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseYear: freezed == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as dynamic,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteEbookImpl implements _FavoriteEbook {
  _$FavoriteEbookImpl(
      {this.id,
      @JsonKey(name: 'book_title') this.bookTitle,
      @JsonKey(name: 'book_id') this.bookId,
      @JsonKey(name: 'release_year') this.releaseYear,
      this.language,
      this.about,
      @JsonKey(name: 'cover_image') this.coverImage,
      @JsonKey(name: 'book_tag') this.bookTag,
      this.tag,
      this.rating});

  factory _$FavoriteEbookImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteEbookImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'book_title')
  final String? bookTitle;
  @override
  @JsonKey(name: 'book_id')
  final String? bookId;
  @override
  @JsonKey(name: 'release_year')
  final int? releaseYear;
  @override
  final String? language;
  @override
  final String? about;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @override
  @JsonKey(name: 'book_tag')
  final dynamic bookTag;
// @JsonKey(name: 'author_name') dynamic author,
  @override
  final String? tag;
// @JsonKey(name: 'is_publish') bool? isPublish,
// @JsonKey(name: 'is_featured') bool? isFeatured,
  @override
  final int? rating;

  @override
  String toString() {
    return 'FavoriteEbook(id: $id, bookTitle: $bookTitle, bookId: $bookId, releaseYear: $releaseYear, language: $language, about: $about, coverImage: $coverImage, bookTag: $bookTag, tag: $tag, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteEbookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookTitle, bookTitle) ||
                other.bookTitle == bookTitle) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            const DeepCollectionEquality().equals(other.bookTag, bookTag) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bookTitle,
      bookId,
      releaseYear,
      language,
      about,
      coverImage,
      const DeepCollectionEquality().hash(bookTag),
      tag,
      rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteEbookImplCopyWith<_$FavoriteEbookImpl> get copyWith =>
      __$$FavoriteEbookImplCopyWithImpl<_$FavoriteEbookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteEbookImplToJson(
      this,
    );
  }
}

abstract class _FavoriteEbook implements FavoriteEbook {
  factory _FavoriteEbook(
      {final String? id,
      @JsonKey(name: 'book_title') final String? bookTitle,
      @JsonKey(name: 'book_id') final String? bookId,
      @JsonKey(name: 'release_year') final int? releaseYear,
      final String? language,
      final String? about,
      @JsonKey(name: 'cover_image') final String? coverImage,
      @JsonKey(name: 'book_tag') final dynamic bookTag,
      final String? tag,
      final int? rating}) = _$FavoriteEbookImpl;

  factory _FavoriteEbook.fromJson(Map<String, dynamic> json) =
      _$FavoriteEbookImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'book_title')
  String? get bookTitle;
  @override
  @JsonKey(name: 'book_id')
  String? get bookId;
  @override
  @JsonKey(name: 'release_year')
  int? get releaseYear;
  @override
  String? get language;
  @override
  String? get about;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;
  @override
  @JsonKey(name: 'book_tag')
  dynamic get bookTag;
  @override // @JsonKey(name: 'author_name') dynamic author,
  String? get tag;
  @override // @JsonKey(name: 'is_publish') bool? isPublish,
// @JsonKey(name: 'is_featured') bool? isFeatured,
  int? get rating;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteEbookImplCopyWith<_$FavoriteEbookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteMeditation _$FavoriteMeditationFromJson(Map<String, dynamic> json) {
  return _FavoriteMeditation.fromJson(json);
}

/// @nodoc
mixin _$FavoriteMeditation {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapter_id')
  String? get chapterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'meditation_id')
  String? get meditationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'video_url')
  String? get videoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteMeditationCopyWith<FavoriteMeditation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteMeditationCopyWith<$Res> {
  factory $FavoriteMeditationCopyWith(
          FavoriteMeditation value, $Res Function(FavoriteMeditation) then) =
      _$FavoriteMeditationCopyWithImpl<$Res, FavoriteMeditation>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'chapter_id') String? chapterId,
      @JsonKey(name: 'meditation_id') String? meditationId,
      @JsonKey(name: 'video_url') String? videoUrl,
      @JsonKey(name: 'cover_image') String? coverImage,
      String? title,
      String? description,
      int? rating,
      String? tag});
}

/// @nodoc
class _$FavoriteMeditationCopyWithImpl<$Res, $Val extends FavoriteMeditation>
    implements $FavoriteMeditationCopyWith<$Res> {
  _$FavoriteMeditationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chapterId = freezed,
    Object? meditationId = freezed,
    Object? videoUrl = freezed,
    Object? coverImage = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? rating = freezed,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterId: freezed == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as String?,
      meditationId: freezed == meditationId
          ? _value.meditationId
          : meditationId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteMeditationImplCopyWith<$Res>
    implements $FavoriteMeditationCopyWith<$Res> {
  factory _$$FavoriteMeditationImplCopyWith(_$FavoriteMeditationImpl value,
          $Res Function(_$FavoriteMeditationImpl) then) =
      __$$FavoriteMeditationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'chapter_id') String? chapterId,
      @JsonKey(name: 'meditation_id') String? meditationId,
      @JsonKey(name: 'video_url') String? videoUrl,
      @JsonKey(name: 'cover_image') String? coverImage,
      String? title,
      String? description,
      int? rating,
      String? tag});
}

/// @nodoc
class __$$FavoriteMeditationImplCopyWithImpl<$Res>
    extends _$FavoriteMeditationCopyWithImpl<$Res, _$FavoriteMeditationImpl>
    implements _$$FavoriteMeditationImplCopyWith<$Res> {
  __$$FavoriteMeditationImplCopyWithImpl(_$FavoriteMeditationImpl _value,
      $Res Function(_$FavoriteMeditationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chapterId = freezed,
    Object? meditationId = freezed,
    Object? videoUrl = freezed,
    Object? coverImage = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? rating = freezed,
    Object? tag = freezed,
  }) {
    return _then(_$FavoriteMeditationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterId: freezed == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as String?,
      meditationId: freezed == meditationId
          ? _value.meditationId
          : meditationId // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteMeditationImpl implements _FavoriteMeditation {
  _$FavoriteMeditationImpl(
      {this.id,
      @JsonKey(name: 'chapter_id') this.chapterId,
      @JsonKey(name: 'meditation_id') this.meditationId,
      @JsonKey(name: 'video_url') this.videoUrl,
      @JsonKey(name: 'cover_image') this.coverImage,
      this.title,
      this.description,
      this.rating,
      this.tag});

  factory _$FavoriteMeditationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteMeditationImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'chapter_id')
  final String? chapterId;
  @override
  @JsonKey(name: 'meditation_id')
  final String? meditationId;
  @override
  @JsonKey(name: 'video_url')
  final String? videoUrl;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? rating;
  @override
  final String? tag;

  @override
  String toString() {
    return 'FavoriteMeditation(id: $id, chapterId: $chapterId, meditationId: $meditationId, videoUrl: $videoUrl, coverImage: $coverImage, title: $title, description: $description, rating: $rating, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteMeditationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chapterId, chapterId) ||
                other.chapterId == chapterId) &&
            (identical(other.meditationId, meditationId) ||
                other.meditationId == meditationId) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, chapterId, meditationId,
      videoUrl, coverImage, title, description, rating, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteMeditationImplCopyWith<_$FavoriteMeditationImpl> get copyWith =>
      __$$FavoriteMeditationImplCopyWithImpl<_$FavoriteMeditationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteMeditationImplToJson(
      this,
    );
  }
}

abstract class _FavoriteMeditation implements FavoriteMeditation {
  factory _FavoriteMeditation(
      {final String? id,
      @JsonKey(name: 'chapter_id') final String? chapterId,
      @JsonKey(name: 'meditation_id') final String? meditationId,
      @JsonKey(name: 'video_url') final String? videoUrl,
      @JsonKey(name: 'cover_image') final String? coverImage,
      final String? title,
      final String? description,
      final int? rating,
      final String? tag}) = _$FavoriteMeditationImpl;

  factory _FavoriteMeditation.fromJson(Map<String, dynamic> json) =
      _$FavoriteMeditationImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'chapter_id')
  String? get chapterId;
  @override
  @JsonKey(name: 'meditation_id')
  String? get meditationId;
  @override
  @JsonKey(name: 'video_url')
  String? get videoUrl;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;
  @override
  String? get title;
  @override
  String? get description;
  @override
  int? get rating;
  @override
  String? get tag;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteMeditationImplCopyWith<_$FavoriteMeditationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteData _$FavoriteDataFromJson(Map<String, dynamic> json) {
  return _FavoriteData.fromJson(json);
}

/// @nodoc
mixin _$FavoriteData {
  List<BookDetailsModal>? get favouriteYoga => throw _privateConstructorUsedError;
  List<FavoriteEbook>? get favouriteBook => throw _privateConstructorUsedError;
  List<FavouriteMusic>? get favouriteMusic => throw _privateConstructorUsedError;
  List<FavoriteMeditation>? get favouriteMeditation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteDataCopyWith<FavoriteData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteDataCopyWith<$Res> {
  factory $FavoriteDataCopyWith(
          FavoriteData value, $Res Function(FavoriteData) then) =
      _$FavoriteDataCopyWithImpl<$Res, FavoriteData>;
  @useResult
  $Res call(
      {List<BookDetailsModal>? favouriteYoga,
      List<FavoriteEbook>? favouriteBook,
      List<FavouriteMusic>? favouriteMusic,
      List<FavoriteMeditation>? favouriteMeditation});
}

/// @nodoc
class _$FavoriteDataCopyWithImpl<$Res, $Val extends FavoriteData>
    implements $FavoriteDataCopyWith<$Res> {
  _$FavoriteDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favouriteYoga = freezed,
    Object? favouriteBook = freezed,
    Object? favouriteMusic = freezed,
    Object? favouriteMeditation = freezed,
  }) {
    return _then(_value.copyWith(
      favouriteYoga: freezed == favouriteYoga
          ? _value.favouriteYoga
          : favouriteYoga // ignore: cast_nullable_to_non_nullable
              as List<BookDetailsModal>?,
      favouriteBook: freezed == favouriteBook
          ? _value.favouriteBook
          : favouriteBook // ignore: cast_nullable_to_non_nullable
              as List<FavoriteEbook>?,
      favouriteMusic: freezed == favouriteMusic
          ? _value.favouriteMusic
          : favouriteMusic // ignore: cast_nullable_to_non_nullable
              as List<FavouriteMusic>?,
      favouriteMeditation: freezed == favouriteMeditation
          ? _value.favouriteMeditation
          : favouriteMeditation // ignore: cast_nullable_to_non_nullable
              as List<FavoriteMeditation>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteDataImplCopyWith<$Res>
    implements $FavoriteDataCopyWith<$Res> {
  factory _$$FavoriteDataImplCopyWith(
          _$FavoriteDataImpl value, $Res Function(_$FavoriteDataImpl) then) =
      __$$FavoriteDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BookDetailsModal>? favouriteYoga,
      List<FavoriteEbook>? favouriteBook,
      List<FavouriteMusic>? favouriteMusic,
      List<FavoriteMeditation>? favouriteMeditation});
}

/// @nodoc
class __$$FavoriteDataImplCopyWithImpl<$Res>
    extends _$FavoriteDataCopyWithImpl<$Res, _$FavoriteDataImpl>
    implements _$$FavoriteDataImplCopyWith<$Res> {
  __$$FavoriteDataImplCopyWithImpl(
      _$FavoriteDataImpl _value, $Res Function(_$FavoriteDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favouriteYoga = freezed,
    Object? favouriteBook = freezed,
    Object? favouriteMusic = freezed,
    Object? favouriteMeditation = freezed,
  }) {
    return _then(_$FavoriteDataImpl(
      favouriteYoga: freezed == favouriteYoga
          ? _value._favouriteYoga
          : favouriteYoga // ignore: cast_nullable_to_non_nullable
              as List<BookDetailsModal>?,
      favouriteBook: freezed == favouriteBook
          ? _value._favouriteBook
          : favouriteBook // ignore: cast_nullable_to_non_nullable
              as List<FavoriteEbook>?,
      favouriteMusic: freezed == favouriteMusic
          ? _value._favouriteMusic
          : favouriteMusic // ignore: cast_nullable_to_non_nullable
              as List<FavouriteMusic>?,
      favouriteMeditation: freezed == favouriteMeditation
          ? _value._favouriteMeditation
          : favouriteMeditation // ignore: cast_nullable_to_non_nullable
              as List<FavoriteMeditation>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteDataImpl implements _FavoriteData {
  _$FavoriteDataImpl(
      {final List<BookDetailsModal>? favouriteYoga,
      final List<FavoriteEbook>? favouriteBook,
      final List<FavouriteMusic>? favouriteMusic,
      final List<FavoriteMeditation>? favouriteMeditation})
      : _favouriteYoga = favouriteYoga,
        _favouriteBook = favouriteBook,
        _favouriteMusic = favouriteMusic,
        _favouriteMeditation = favouriteMeditation;

  factory _$FavoriteDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteDataImplFromJson(json);

  final List<BookDetailsModal>? _favouriteYoga;
  @override
  List<BookDetailsModal>? get favouriteYoga {
    final value = _favouriteYoga;
    if (value == null) return null;
    if (_favouriteYoga is EqualUnmodifiableListView) return _favouriteYoga;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FavoriteEbook>? _favouriteBook;
  @override
  List<FavoriteEbook>? get favouriteBook {
    final value = _favouriteBook;
    if (value == null) return null;
    if (_favouriteBook is EqualUnmodifiableListView) return _favouriteBook;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FavouriteMusic>? _favouriteMusic;
  @override
  List<FavouriteMusic>? get favouriteMusic {
    final value = _favouriteMusic;
    if (value == null) return null;
    if (_favouriteMusic is EqualUnmodifiableListView) return _favouriteMusic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FavoriteMeditation>? _favouriteMeditation;
  @override
  List<FavoriteMeditation>? get favouriteMeditation {
    final value = _favouriteMeditation;
    if (value == null) return null;
    if (_favouriteMeditation is EqualUnmodifiableListView)
      return _favouriteMeditation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FavoriteData(favouriteYoga: $favouriteYoga, favouriteBook: $favouriteBook, favouriteMusic: $favouriteMusic, favouriteMeditation: $favouriteMeditation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteDataImpl &&
            const DeepCollectionEquality()
                .equals(other._favouriteYoga, _favouriteYoga) &&
            const DeepCollectionEquality()
                .equals(other._favouriteBook, _favouriteBook) &&
            const DeepCollectionEquality()
                .equals(other._favouriteMusic, _favouriteMusic) &&
            const DeepCollectionEquality()
                .equals(other._favouriteMeditation, _favouriteMeditation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favouriteYoga),
      const DeepCollectionEquality().hash(_favouriteBook),
      const DeepCollectionEquality().hash(_favouriteMusic),
      const DeepCollectionEquality().hash(_favouriteMeditation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteDataImplCopyWith<_$FavoriteDataImpl> get copyWith =>
      __$$FavoriteDataImplCopyWithImpl<_$FavoriteDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteDataImplToJson(
      this,
    );
  }
}

abstract class _FavoriteData implements FavoriteData {
  factory _FavoriteData(
          {final List<BookDetailsModal>? favouriteYoga,
          final List<FavoriteEbook>? favouriteBook,
          final List<FavouriteMusic>? favouriteMusic,
          final List<FavoriteMeditation>? favouriteMeditation}) =
      _$FavoriteDataImpl;

  factory _FavoriteData.fromJson(Map<String, dynamic> json) =
      _$FavoriteDataImpl.fromJson;

  @override
  List<BookDetailsModal>? get favouriteYoga;
  @override
  List<FavoriteEbook>? get favouriteBook;
  @override
  List<FavouriteMusic>? get favouriteMusic;
  @override
  List<FavoriteMeditation>? get favouriteMeditation;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteDataImplCopyWith<_$FavoriteDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
