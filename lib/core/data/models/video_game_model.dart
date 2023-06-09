import 'package:json_annotation/json_annotation.dart';

part 'video_game_model.g.dart';

@JsonSerializable()
class VideoGameModel {
  VideoGameModel(
      this.remoteId,
      this.name,
      this.imageName,
      this.summary,
      this.reviewScore,
      this.developer,
      this.publisher,
      this.platforms
      );

  @JsonKey(name: "game_id")
  final int remoteId;
  @JsonKey(name: "game_name")
  final String name;
  @JsonKey(name: "game_image")
  final String imageName;
  @JsonKey(name: "profile_summary")
  final String summary;
  @JsonKey(name: "review_score")
  final int? reviewScore;
  @JsonKey(name: "profile_dev")
  final String? developer;
  @JsonKey(name: "profile_pub")
  final String? publisher;
  @JsonKey(name: "profile_platform")
  final String? platforms;

  factory VideoGameModel.fromJson(Map<String, dynamic> json) =>
      _$VideoGameModelFromJson(json);
}
