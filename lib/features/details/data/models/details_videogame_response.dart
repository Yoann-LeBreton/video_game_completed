import 'package:json_annotation/json_annotation.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model_with_indiv.dart';

part 'details_videogame_response.g.dart';

@JsonSerializable()
class DetailsVideoGameResponse{
  DetailsVideoGameResponse(this.props);

  @JsonKey(name: "props")
  final DetailsVideoGameProps props;

  factory DetailsVideoGameResponse.fromJson(Map<String, dynamic> json) => _$DetailsVideoGameResponseFromJson(json);
}

@JsonSerializable()
class DetailsVideoGameProps{
  DetailsVideoGameProps(this.pageProps);

  @JsonKey(name: "pageProps")
  final DetailsVideoGamePageProps pageProps;

  factory DetailsVideoGameProps.fromJson(Map<String, dynamic> json) => _$DetailsVideoGamePropsFromJson(json);
}

@JsonSerializable()
class DetailsVideoGamePageProps{
  DetailsVideoGamePageProps(this.pageGame);

  @JsonKey(name: "game")
  final DetailsVideoGamePageGame pageGame;

  factory DetailsVideoGamePageProps.fromJson(Map<String, dynamic> json) => _$DetailsVideoGamePagePropsFromJson(json);
}

@JsonSerializable()
class DetailsVideoGamePageGame{
  DetailsVideoGamePageGame(this.data);

  @JsonKey(name: "data")
  final VideoGameWithIndivModel data;

  factory DetailsVideoGamePageGame.fromJson(Map<String, dynamic> json) => _$DetailsVideoGamePageGameFromJson(json);
}