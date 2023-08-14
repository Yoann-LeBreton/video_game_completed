import 'package:video_game_completed/core/enums/video_game_status.dart';
import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';
import 'package:collection/collection.dart';

typedef FavoritesEntity = List<VideoGameDb>;

extension FavoritesEntityX on FavoritesEntity {
  VideoGameStatus? favoriteStatus(int remoteId) =>
      (firstWhereOrNull((element) => element.remoteId == remoteId)?.status);
}
