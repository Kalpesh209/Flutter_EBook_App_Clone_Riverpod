// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MusicTrack _$MusicTrackFromJson(Map<String, dynamic> json) {
  return _MusicTrack.fromJson(json);
}

/// @nodoc
mixin _$MusicTrack {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sr_no')
  int? get srNo => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'track_url')
  String? get trackUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favourite')
  bool? get isFavourite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicTrackCopyWith<MusicTrack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicTrackCopyWith<$Res> {
  factory $MusicTrackCopyWith(
          MusicTrack value, $Res Function(MusicTrack) then) =
      _$MusicTrackCopyWithImpl<$Res, MusicTrack>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'sr_no') int? srNo,
      String? title,
      String? description,
      String? tag,
      String? image,
      @JsonKey(name: 'track_url') String? trackUrl,
      @JsonKey(name: 'is_favourite') bool? isFavourite});
}

/// @nodoc
class _$MusicTrackCopyWithImpl<$Res, $Val extends MusicTrack>
    implements $MusicTrackCopyWith<$Res> {
  _$MusicTrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? srNo = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? tag = freezed,
    Object? image = freezed,
    Object? trackUrl = freezed,
    Object? isFavourite = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      srNo: freezed == srNo
          ? _value.srNo
          : srNo // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      trackUrl: freezed == trackUrl
          ? _value.trackUrl
          : trackUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MusicTrackImplCopyWith<$Res>
    implements $MusicTrackCopyWith<$Res> {
  factory _$$MusicTrackImplCopyWith(
          _$MusicTrackImpl value, $Res Function(_$MusicTrackImpl) then) =
      __$$MusicTrackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'sr_no') int? srNo,
      String? title,
      String? description,
      String? tag,
      String? image,
      @JsonKey(name: 'track_url') String? trackUrl,
      @JsonKey(name: 'is_favourite') bool? isFavourite});
}

/// @nodoc
class __$$MusicTrackImplCopyWithImpl<$Res>
    extends _$MusicTrackCopyWithImpl<$Res, _$MusicTrackImpl>
    implements _$$MusicTrackImplCopyWith<$Res> {
  __$$MusicTrackImplCopyWithImpl(
      _$MusicTrackImpl _value, $Res Function(_$MusicTrackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? srNo = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? tag = freezed,
    Object? image = freezed,
    Object? trackUrl = freezed,
    Object? isFavourite = freezed,
  }) {
    return _then(_$MusicTrackImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      srNo: freezed == srNo
          ? _value.srNo
          : srNo // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      trackUrl: freezed == trackUrl
          ? _value.trackUrl
          : trackUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicTrackImpl implements _MusicTrack {
  _$MusicTrackImpl(
      {this.id,
      @JsonKey(name: 'sr_no') this.srNo,
      this.title,
      this.description,
      this.tag,
      this.image,
      @JsonKey(name: 'track_url') this.trackUrl,
      @JsonKey(name: 'is_favourite') this.isFavourite});

  factory _$MusicTrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicTrackImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'sr_no')
  final int? srNo;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? tag;
  @override
  final String? image;
  @override
  @JsonKey(name: 'track_url')
  final String? trackUrl;
  @override
  @JsonKey(name: 'is_favourite')
  final bool? isFavourite;

  @override
  String toString() {
    return 'MusicTrack(id: $id, srNo: $srNo, title: $title, description: $description, tag: $tag, image: $image, trackUrl: $trackUrl, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicTrackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.srNo, srNo) || other.srNo == srNo) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.trackUrl, trackUrl) ||
                other.trackUrl == trackUrl) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, srNo, title, description,
      tag, image, trackUrl, isFavourite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicTrackImplCopyWith<_$MusicTrackImpl> get copyWith =>
      __$$MusicTrackImplCopyWithImpl<_$MusicTrackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicTrackImplToJson(
      this,
    );
  }
}

abstract class _MusicTrack implements MusicTrack {
  factory _MusicTrack(
          {final String? id,
          @JsonKey(name: 'sr_no') final int? srNo,
          final String? title,
          final String? description,
          final String? tag,
          final String? image,
          @JsonKey(name: 'track_url') final String? trackUrl,
          @JsonKey(name: 'is_favourite') final bool? isFavourite}) =
      _$MusicTrackImpl;

  factory _MusicTrack.fromJson(Map<String, dynamic> json) =
      _$MusicTrackImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'sr_no')
  int? get srNo;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get tag;
  @override
  String? get image;
  @override
  @JsonKey(name: 'track_url')
  String? get trackUrl;
  @override
  @JsonKey(name: 'is_favourite')
  bool? get isFavourite;
  @override
  @JsonKey(ignore: true)
  _$$MusicTrackImplCopyWith<_$MusicTrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
