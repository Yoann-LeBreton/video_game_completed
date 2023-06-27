import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/data/models/db/video_game_db.dart';
part 'favorite_video_games_state.freezed.dart';

@freezed
class FavoriteVideoGameState with _$FavoriteVideoGameState {
  const factory FavoriteVideoGameState.initial() = FavoriteVideoGameStateInitial;

  const factory FavoriteVideoGameState.loading() = FavoriteVideoGameStateLoading;

  const factory FavoriteVideoGameState.success({required List<VideoGameDb> data}) = FavoriteVideoGameStateSuccess;

  const factory FavoriteVideoGameState.error({required Exception exception}) = FavoriteVideoGameStateError;
}