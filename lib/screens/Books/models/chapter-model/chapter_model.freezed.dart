// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChapterResponse _$ChapterResponseFromJson(Map<String, dynamic> json) {
  return _ChapterResponse.fromJson(json);
}

/// @nodoc
mixin _$ChapterResponse {
  ChapterData? get data => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterResponseCopyWith<ChapterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterResponseCopyWith<$Res> {
  factory $ChapterResponseCopyWith(
          ChapterResponse value, $Res Function(ChapterResponse) then) =
      _$ChapterResponseCopyWithImpl<$Res, ChapterResponse>;
  @useResult
  $Res call({ChapterData? data, bool? success, String? message});

  $ChapterDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ChapterResponseCopyWithImpl<$Res, $Val extends ChapterResponse>
    implements $ChapterResponseCopyWith<$Res> {
  _$ChapterResponseCopyWithImpl(this._value, this._then);

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
              as ChapterData?,
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
  $ChapterDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ChapterDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChapterResponseImplCopyWith<$Res>
    implements $ChapterResponseCopyWith<$Res> {
  factory _$$ChapterResponseImplCopyWith(_$ChapterResponseImpl value, $Res Function(_$ChapterResponseImpl) then) =__$$ChapterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChapterData? data, bool? success, String? message});

  @override
  $ChapterDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ChapterResponseImplCopyWithImpl<$Res>
    extends _$ChapterResponseCopyWithImpl<$Res, _$ChapterResponseImpl>
    implements _$$ChapterResponseImplCopyWith<$Res> {
  __$$ChapterResponseImplCopyWithImpl(
      _$ChapterResponseImpl _value, $Res Function(_$ChapterResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? success = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ChapterResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ChapterData?,
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
class _$ChapterResponseImpl implements _ChapterResponse {
  _$ChapterResponseImpl({this.data, this.success, this.message});

  factory _$ChapterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterResponseImplFromJson(json);

  @override
  final ChapterData? data;
  @override
  final bool? success;
  @override
  final String? message;

  @override
  String toString() {
    return 'ChapterResponse(data: $data, success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterResponseImpl &&
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
  _$$ChapterResponseImplCopyWith<_$ChapterResponseImpl> get copyWith =>
      __$$ChapterResponseImplCopyWithImpl<_$ChapterResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterResponseImplToJson(
      this,
    );
  }
}

abstract class _ChapterResponse implements ChapterResponse {
  factory _ChapterResponse(
      {final ChapterData? data,
      final bool? success,
      final String? message}) = _$ChapterResponseImpl;

  factory _ChapterResponse.fromJson(Map<String, dynamic> json) =
      _$ChapterResponseImpl.fromJson;

  @override
  ChapterData? get data;
  @override
  bool? get success;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ChapterResponseImplCopyWith<_$ChapterResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return _Chapter.fromJson(json);
}

/// @nodoc
mixin _$Chapter {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "chapter_content")
  String? get chapterContent => throw _privateConstructorUsedError;
  @JsonKey(name: "cover_image")
  String? get coverImage => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  List<String>? get bookTopic => throw _privateConstructorUsedError;
  @JsonKey(name: "audio_url")
  String? get audioUrl => throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterCopyWith<Chapter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) then) =
      _$ChapterCopyWithImpl<$Res, Chapter>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      @JsonKey(name: "chapter_content") String? chapterContent,
      @JsonKey(name: "cover_image") String? coverImage,
      String? tag,
      List<String>? bookTopic,
      @JsonKey(name: "audio_url") String? audioUrl});
}

/// @nodoc
class _$ChapterCopyWithImpl<$Res, $Val extends Chapter>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? chapterContent = freezed,
    Object? coverImage = freezed,
    Object? tag = freezed,
    Object? bookTopic = freezed,
    Object? audioUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterContent: freezed == chapterContent
          ? _value.chapterContent
          : chapterContent // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTopic: freezed == bookTopic
          ? _value.bookTopic
          : bookTopic // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterImplCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$$ChapterImplCopyWith(
          _$ChapterImpl value, $Res Function(_$ChapterImpl) then) =
      __$$ChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      @JsonKey(name: "chapter_content") String? chapterContent,
      @JsonKey(name: "cover_image") String? coverImage,
      String? tag,
      List<String>? bookTopic,
      @JsonKey(name: "audio_url") String? audioUrl});
}

/// @nodoc
class __$$ChapterImplCopyWithImpl<$Res>
    extends _$ChapterCopyWithImpl<$Res, _$ChapterImpl>
    implements _$$ChapterImplCopyWith<$Res> {
  __$$ChapterImplCopyWithImpl(
      _$ChapterImpl _value, $Res Function(_$ChapterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? chapterContent = freezed,
    Object? coverImage = freezed,
    Object? tag = freezed,
    Object? bookTopic = freezed,
    Object? audioUrl = freezed,
  }) {
    return _then(_$ChapterImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterContent: freezed == chapterContent
          ? _value.chapterContent
          : chapterContent // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      bookTopic: freezed == bookTopic
          ? _value._bookTopic
          : bookTopic // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterImpl implements _Chapter {
  _$ChapterImpl(
      {this.id,
      this.title,
      @JsonKey(name: "chapter_content") this.chapterContent,
      @JsonKey(name: "cover_image") this.coverImage,
      this.tag,
      final List<String>? bookTopic,
      @JsonKey(name: "audio_url") this.audioUrl})
      : _bookTopic = bookTopic;

  factory _$ChapterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  @JsonKey(name: "chapter_content")
  final String? chapterContent;
  @override
  @JsonKey(name: "cover_image")
  final String? coverImage;
  @override
  final String? tag;
  final List<String>? _bookTopic;
  @override
  List<String>? get bookTopic {
    final value = _bookTopic;
    if (value == null) return null;
    if (_bookTopic is EqualUnmodifiableListView) return _bookTopic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "audio_url")
  final String? audioUrl;

  @override
  String toString() {
    return 'Chapter(id: $id, title: $title, chapterContent: $chapterContent, coverImage: $coverImage, tag: $tag, bookTopic: $bookTopic, audioUrl: $audioUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.chapterContent, chapterContent) ||
                other.chapterContent == chapterContent) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            const DeepCollectionEquality()
                .equals(other._bookTopic, _bookTopic) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      chapterContent,
      coverImage,
      tag,
      const DeepCollectionEquality().hash(_bookTopic),
      audioUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      __$$ChapterImplCopyWithImpl<_$ChapterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterImplToJson(
      this,
    );
  }
}

abstract class _Chapter implements Chapter {
  factory _Chapter(
      {final String? id,
      final String? title,
      @JsonKey(name: "chapter_content") final String? chapterContent,
      @JsonKey(name: "cover_image") final String? coverImage,
      final String? tag,
      final List<String>? bookTopic,
      @JsonKey(name: "audio_url") final String? audioUrl}) = _$ChapterImpl;

  factory _Chapter.fromJson(Map<String, dynamic> json) = _$ChapterImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: "chapter_content")
  String? get chapterContent;
  @override
  @JsonKey(name: "cover_image")
  String? get coverImage;
  @override
  String? get tag;
  @override
  List<String>? get bookTopic;
  @override
  @JsonKey(name: "audio_url")
  String? get audioUrl;
  @override
  @JsonKey(ignore: true)
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapterData _$ChapterDataFromJson(Map<String, dynamic> json) {
  return _ChapterData.fromJson(json);
}

/// @nodoc
mixin _$ChapterData {
  List<Chapter>? get bookChapter => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get AllCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterDataCopyWith<ChapterData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterDataCopyWith<$Res> {
  factory $ChapterDataCopyWith(
          ChapterData value, $Res Function(ChapterData) then) =
      _$ChapterDataCopyWithImpl<$Res, ChapterData>;
  @useResult
  $Res call({List<Chapter>? bookChapter, int? count, int? AllCount});
}

/// @nodoc
class _$ChapterDataCopyWithImpl<$Res, $Val extends ChapterData>
    implements $ChapterDataCopyWith<$Res> {
  _$ChapterDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookChapter = freezed,
    Object? count = freezed,
    Object? AllCount = freezed,
  }) {
    return _then(_value.copyWith(
      bookChapter: freezed == bookChapter
          ? _value.bookChapter
          : bookChapter // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      AllCount: freezed == AllCount
          ? _value.AllCount
          : AllCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterDataImplCopyWith<$Res>
    implements $ChapterDataCopyWith<$Res> {
  factory _$$ChapterDataImplCopyWith(
          _$ChapterDataImpl value, $Res Function(_$ChapterDataImpl) then) =
      __$$ChapterDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Chapter>? bookChapter, int? count, int? AllCount});
}

/// @nodoc
class __$$ChapterDataImplCopyWithImpl<$Res>
    extends _$ChapterDataCopyWithImpl<$Res, _$ChapterDataImpl>
    implements _$$ChapterDataImplCopyWith<$Res> {
  __$$ChapterDataImplCopyWithImpl(
      _$ChapterDataImpl _value, $Res Function(_$ChapterDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookChapter = freezed,
    Object? count = freezed,
    Object? AllCount = freezed,
  }) {
    return _then(_$ChapterDataImpl(
      bookChapter: freezed == bookChapter
          ? _value._bookChapter
          : bookChapter // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      AllCount: freezed == AllCount
          ? _value.AllCount
          : AllCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterDataImpl implements _ChapterData {
  _$ChapterDataImpl(
      {final List<Chapter>? bookChapter, this.count, this.AllCount})
      : _bookChapter = bookChapter;

  factory _$ChapterDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterDataImplFromJson(json);

  final List<Chapter>? _bookChapter;
  @override
  List<Chapter>? get bookChapter {
    final value = _bookChapter;
    if (value == null) return null;
    if (_bookChapter is EqualUnmodifiableListView) return _bookChapter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;
  @override
  final int? AllCount;

  @override
  String toString() {
    return 'ChapterData(bookChapter: $bookChapter, count: $count, AllCount: $AllCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterDataImpl &&
            const DeepCollectionEquality()
                .equals(other._bookChapter, _bookChapter) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.AllCount, AllCount) ||
                other.AllCount == AllCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_bookChapter), count, AllCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterDataImplCopyWith<_$ChapterDataImpl> get copyWith =>
      __$$ChapterDataImplCopyWithImpl<_$ChapterDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterDataImplToJson(
      this,
    );
  }
}

abstract class _ChapterData implements ChapterData {
  factory _ChapterData(
      {final List<Chapter>? bookChapter,
      final int? count,
      final int? AllCount}) = _$ChapterDataImpl;

  factory _ChapterData.fromJson(Map<String, dynamic> json) =
      _$ChapterDataImpl.fromJson;

  @override
  List<Chapter>? get bookChapter;
  @override
  int? get count;
  @override
  int? get AllCount;
  @override
  @JsonKey(ignore: true)
  _$$ChapterDataImplCopyWith<_$ChapterDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
