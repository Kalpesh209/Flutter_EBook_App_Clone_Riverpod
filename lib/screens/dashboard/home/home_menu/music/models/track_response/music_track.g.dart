// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MusicTrackImpl _$$MusicTrackImplFromJson(Map<String, dynamic> json) =>
    _$MusicTrackImpl(
      id: json['id'] as String?,
      srNo: json['sr_no'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      tag: json['tag'] as String?,
      image: json['image'] as String?,
      trackUrl: json['track_url'] as String?,
      isFavourite: json['is_favourite'] as bool?,
    );

Map<String, dynamic> _$$MusicTrackImplToJson(_$MusicTrackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sr_no': instance.srNo,
      'title': instance.title,
      'description': instance.description,
      'tag': instance.tag,
      'image': instance.image,
      'track_url': instance.trackUrl,
      'is_favourite': instance.isFavourite,
    };
