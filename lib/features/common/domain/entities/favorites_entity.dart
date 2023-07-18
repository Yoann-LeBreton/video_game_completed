import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';

typedef FavoritesEntity = List<VideoGameDb>;

extension FavoritesEntityX on FavoritesEntity {
  bool isFavorite(VideoGameDb videoGame) => contains(videoGame);
}