import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:video_game_completed/core/common/database/database_provider.dart';
import 'package:video_game_completed/core/data/models/db/video_game_db.dart';

@injectable
class VideoGameLocalDataSource {
  VideoGameLocalDataSource({required this.databaseProvider});

  final DatabaseProvider databaseProvider;

  Future<List<VideoGameDb>> getAllVideoGames() async {
    return await databaseProvider.getVideoGameDB().where().findAll();
  }

  Future<void> insertVideoGame(int remoteId, String gameName) async {
    final newVideoGame = VideoGameDb()..remoteId=remoteId..name=gameName;
    final isar = databaseProvider.getIsar();
    await isar.writeTxn(() async {
      await isar.videoGameDbs.put(newVideoGame);
    });
  }
}