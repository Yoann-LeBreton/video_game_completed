import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:video_game_completed/core/data/database_provider.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';
import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';

@injectable
class VideoGameLocalDataSource {
  VideoGameLocalDataSource({required this.databaseProvider});

  final DatabaseProvider databaseProvider;

  Future<List<VideoGameDb>> getAllVideoGames() async {
    return await databaseProvider
        .getVideoGameDB()
        .where()
        .sortByName()
        .findAll();
  }

  Future<void> insertVideoGame(
    int remoteId,
    String gameName,
    String imageName,
    int releaseYear,
    String? platformSelected,
    VideoGameStatus status,
  ) async {
    await databaseProvider.edit(() async {
      databaseProvider.getVideoGameDB().put(VideoGameDb(
            remoteId: remoteId,
            name: gameName,
            imageName: imageName,
            releaseYear: releaseYear,
            platformSelected: platformSelected,
            status: status,
          ));
    });
  }

  Future<void> deleteVideoGame(int remoteId) async {
    await databaseProvider.edit(() async {
      databaseProvider.getVideoGameDB().delete(remoteId);
    });
  }

  Future<void> changeVideoGameStatus(
    int remoteId,
    VideoGameStatus status,
  ) async {
    VideoGameDb? videoGame =
        await databaseProvider.getVideoGameDB().get(remoteId);
    if (videoGame != null) {
      await databaseProvider.edit(() async {
        databaseProvider.getVideoGameDB().put(videoGame);
      });
    }
  }
}
