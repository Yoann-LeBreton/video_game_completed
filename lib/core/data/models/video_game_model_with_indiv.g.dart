// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_game_model_with_indiv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoGameWithIndivModel _$VideoGameWithIndivModelFromJson(
        Map<String, dynamic> json) =>
    VideoGameWithIndivModel(
      (json['game'] as List<dynamic>)
          .map((e) => VideoGameModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['individuality'] as List<dynamic>)
          .map((e) => IndividualityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoGameWithIndivModelToJson(
        VideoGameWithIndivModel instance) =>
    <String, dynamic>{
      'game': instance.games,
      'individuality': instance.individualities,
    };
