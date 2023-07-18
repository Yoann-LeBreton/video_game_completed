// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_game_short_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoGameShortModel _$VideoGameShortModelFromJson(Map<String, dynamic> json) =>
    VideoGameShortModel(
      json['game_id'] as int,
      json['game_name'] as String,
      json['game_image'] as String,
      json['release_world'] as int,
      json['profile_platform'] as String,
    );

Map<String, dynamic> _$VideoGameShortModelToJson(
        VideoGameShortModel instance) =>
    <String, dynamic>{
      'game_id': instance.remoteId,
      'game_name': instance.name,
      'game_image': instance.imageName,
      'release_world': instance.releaseYear,
      'profile_platform': instance.platforms,
    };
