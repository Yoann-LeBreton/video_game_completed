import 'package:json_annotation/json_annotation.dart';
part 'video_game_short_model.g.dart';

@JsonSerializable()
class VideoGameShortModel {
  VideoGameShortModel(this.remoteid, this.name);

  @JsonKey(name: "game_id")
  final int remoteid;
  @JsonKey(name: "game_name")
  final String name;

  factory VideoGameShortModel.fromJson(Map<String, dynamic> json) => _$VideoGameShortModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoGameShortModelToJson(this);
}