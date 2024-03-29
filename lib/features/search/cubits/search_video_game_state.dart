import 'package:video_game_completed/features/search/data/models/search_videogame_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_video_game_state.freezed.dart';

@freezed
class SearchVideoGameState with _$SearchVideoGameState {
  const factory SearchVideoGameState.initial() = SearchVideoGameStateInitial;

  const factory SearchVideoGameState.loading() = SearchVideoGameStateLoading;

  const factory SearchVideoGameState.loadingNext() =
      SearchVideoGameStateLoadingNext;

  const factory SearchVideoGameState.success({required SearchVideogameResponse data}) =
      SearchVideoGameStateSuccess;

  const factory SearchVideoGameState.next({required SearchVideogameResponse nextData}) =
      SearchVideoGameStateNext;

  const factory SearchVideoGameState.error({required Exception exception}) =
      SearchVideoGameStateError;
}
