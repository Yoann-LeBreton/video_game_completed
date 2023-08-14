import 'package:json_annotation/json_annotation.dart';
import 'package:video_game_completed/features/search/data/models/video_game_short_model.dart';

part 'search_videogame_response.g.dart';

@JsonSerializable()
class SearchVideogameResponse {
  SearchVideogameResponse(this.category, int? count, this.pageCurrent,
      this.pageTotal, List<VideoGameShortModel>? games)
      : count = count ?? 0,
        games = games ?? <VideoGameShortModel>[];
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "pageCurrent")
  final int? pageCurrent;
  @JsonKey(name: "pageTotal")
  final int? pageTotal;
  @JsonKey(name: "data")
  List<VideoGameShortModel> games;

  factory SearchVideogameResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchVideogameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchVideogameResponseToJson(this);
}
