// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeditationTrackImpl _$$MeditationTrackImplFromJson(
        Map<String, dynamic> json) =>
    _$MeditationTrackImpl(
      id: json['id'] as String?,
      srNo: json['sr_no'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      tag: json['tag'] as String?,
      image: json['image'] as String?,
      trackUrl: json['video_url'] as String?,
      isFavourite: json['is_favourite'] as bool?,
    );

Map<String, dynamic> _$$MeditationTrackImplToJson(
        _$MeditationTrackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sr_no': instance.srNo,
      'title': instance.title,
      'description': instance.description,
      'tag': instance.tag,
      'image': instance.image,
      'video_url': instance.trackUrl,
      'is_favourite': instance.isFavourite,
    };
