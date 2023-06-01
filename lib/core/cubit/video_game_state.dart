import 'package:video_game_completed/core/data/models/search_videogame_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_game_state.freezed.dart';

@freezed
class VideoGameState with _$VideoGameState{
  const factory VideoGameState.initial() = VideoGameStateInitial;
  const factory VideoGameState.loading() = VideoGameStateLoading;
  const factory VideoGameState.success(SearchVideogameResponse data) = VideoGameStateSuccess;
  const factory VideoGameState.error(Exception exception) = VideoGameStateError;
}