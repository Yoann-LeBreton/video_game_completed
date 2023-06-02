import 'package:json_annotation/json_annotation.dart';
part 'video_game_short_model.g.dart';

@JsonSerializable()
class VideoGameShortModel {
  VideoGameShortModel(this.remoteid, this.name, this.imageName, this.releaseYear, this.platforms);

  @JsonKey(name: "game_id")
  final int remoteid;
  @JsonKey(name: "game_name")
  final String name;
  @JsonKey(name: "game_image")
  final String imageName;
  @JsonKey(name: "release_world")
  final int releaseYear;
  @JsonKey(name: "profile_platform")
  final String platforms;

  factory VideoGameShortModel.fromJson(Map<String, dynamic> json) => _$VideoGameShortModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoGameShortModelToJson(this);
}