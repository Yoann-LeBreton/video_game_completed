// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoGameModel _$VideoGameModelFromJson(Map<String, dynamic> json) =>
    VideoGameModel(
      json['game_id'] as int,
      json['game_name'] as String,
      json['game_image'] as String,
      json['profile_summary'] as String,
    );

Map<String, dynamic> _$VideoGameModelToJson(VideoGameModel instance) =>
    <String, dynamic>{
      'game_id': instance.remoteId,
      'game_name': instance.name,
      'game_image': instance.imageName,
      'profile_summary': instance.summary,
    };
