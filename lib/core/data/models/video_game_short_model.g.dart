// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_game_short_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoGameShortModel _$VideoGameShortModelFromJson(Map<String, dynamic> json) =>
    VideoGameShortModel(
      json['game_id'] as int,
      json['game_name'] as String,
    );

Map<String, dynamic> _$VideoGameShortModelToJson(
        VideoGameShortModel instance) =>
    <String, dynamic>{
      'game_id': instance.remoteid,
      'game_name': instance.name,
    };
