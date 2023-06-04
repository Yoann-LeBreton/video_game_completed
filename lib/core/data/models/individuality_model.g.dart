// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individuality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndividualityModel _$IndividualityModelFromJson(Map<String, dynamic> json) =>
    IndividualityModel(
      json['platform'] as String,
      json['count_comp'] as String,
      json['comp_main'] as String,
    );

Map<String, dynamic> _$IndividualityModelToJson(IndividualityModel instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'count_comp': instance.polled,
      'comp_main': instance.mainCompare,
    };
