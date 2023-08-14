import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_game_completed/features/common/domain/entities/favorites_entity.dart';

import '../../common/domain/entities/video_game_db.dart';
part 'favorite_video_games_state.freezed.dart';

@freezed
class FavoriteVideoGameState with _$FavoriteVideoGameState {
  const factory FavoriteVideoGameState.initial() = FavoriteVideoGameStateInitial;

  const factory FavoriteVideoGameState.loading() = FavoriteVideoGameStateLoading;

  const factory FavoriteVideoGameState.success({required FavoritesEntity data}) = FavoriteVideoGameStateSuccess;

  const factory FavoriteVideoGameState.error({required Exception exception}) = FavoriteVideoGameStateError;
}