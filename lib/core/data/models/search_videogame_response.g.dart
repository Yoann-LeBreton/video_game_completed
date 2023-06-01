// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_videogame_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchVideogameResponse _$SearchVideogameResponseFromJson(
        Map<String, dynamic> json) =>
    SearchVideogameResponse(
      json['category'] as String,
      json['count'] as int?,
      json['pageCurrent'] as int?,
      json['pageTotal'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => VideoGameShortModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchVideogameResponseToJson(
        SearchVideogameResponse instance) =>
    <String, dynamic>{
      'category': instance.category,
      'count': instance.count,
      'pageCurrent': instance.pageCurrent,
      'pageTotal': instance.pageTotal,
      'data': instance.games,
    };
