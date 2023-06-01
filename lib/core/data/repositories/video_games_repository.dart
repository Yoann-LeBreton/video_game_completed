import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/data/datasources/how_long_beat_data_source.dart';
import 'package:video_game_completed/core/data/models/search_videogame_response.dart';

@lazySingleton
class VideoGamesRepository {
  VideoGamesRepository(HowLongBeatDataSourceImpl _howLongBeatDataSource) : _howLongBeatDataSourceImpl = _howLongBeatDataSource;

  final HowLongBeatDataSourceImpl _howLongBeatDataSourceImpl;

  Future<SearchVideogameResponse> searchVideoGame(String title) async {
    return _howLongBeatDataSourceImpl.searchVideoGame();
  }
}