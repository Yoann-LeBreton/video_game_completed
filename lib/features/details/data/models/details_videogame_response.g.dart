// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_videogame_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsVideoGameResponse _$DetailsVideoGameResponseFromJson(
        Map<String, dynamic> json) =>
    DetailsVideoGameResponse(
      DetailsVideoGameProps.fromJson(json['props'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsVideoGameResponseToJson(
        DetailsVideoGameResponse instance) =>
    <String, dynamic>{
      'props': instance.props,
    };

DetailsVideoGameProps _$DetailsVideoGamePropsFromJson(
        Map<String, dynamic> json) =>
    DetailsVideoGameProps(
      DetailsVideoGamePageProps.fromJson(
          json['pageProps'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsVideoGamePropsToJson(
        DetailsVideoGameProps instance) =>
    <String, dynamic>{
      'pageProps': instance.pageProps,
    };

DetailsVideoGamePageProps _$DetailsVideoGamePagePropsFromJson(
        Map<String, dynamic> json) =>
    DetailsVideoGamePageProps(
      DetailsVideoGamePageGame.fromJson(json['game'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsVideoGamePagePropsToJson(
        DetailsVideoGamePageProps instance) =>
    <String, dynamic>{
      'game': instance.pageGame,
    };

DetailsVideoGamePageGame _$DetailsVideoGamePageGameFromJson(
        Map<String, dynamic> json) =>
    DetailsVideoGamePageGame(
      VideoGameWithIndivModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsVideoGamePageGameToJson(
        DetailsVideoGamePageGame instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
