import 'package:json_annotation/json_annotation.dart';
import 'package:video_game_completed/features/details/data/models/individuality_model.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model.dart';

part 'video_game_model_with_indiv.g.dart';

@JsonSerializable()
class VideoGameWithIndivModel {
  VideoGameWithIndivModel(this.games, this.individualities);

  @JsonKey(name: "game")
  List<VideoGameModel> games;
  @JsonKey(name: "individuality")
  final List<IndividualityModel> individualities;

  factory VideoGameWithIndivModel.fromJson(Map<String, dynamic> json) =>
      _$VideoGameWithIndivModelFromJson(json);
}