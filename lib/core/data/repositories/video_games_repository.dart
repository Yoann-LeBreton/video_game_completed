import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/common/result.dart';
import 'package:video_game_completed/core/data/datasources/how_long_beat_data_source.dart';
import 'package:video_game_completed/core/data/models/search_videogame_response.dart';
import 'package:video_game_completed/core/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/core/utils/enums/search_filter_enums.dart';

@lazySingleton
class VideoGamesRepository {
  VideoGamesRepository(HowLongBeatDataSourceImpl _howLongBeatDataSource)
      : _howLongBeatDataSourceImpl = _howLongBeatDataSource;

  final HowLongBeatDataSourceImpl _howLongBeatDataSourceImpl;

  Future<Result<SearchVideogameResponse>> searchVideoGame(
      int pageResult,
      String searchText,
      SearchFilterSortBy sortBy,
      SearchFilterPlatform platform) async {
    return runCatchingAsync(() => _howLongBeatDataSourceImpl.searchVideoGame(
        pageResult, searchText, sortBy, platform));
  }

  Future<Result<VideoGameWithIndivModel>> getVideoGameDetails(
      int remoteId) async {
    return runCatchingAsync(
        () => _howLongBeatDataSourceImpl.getVideoGameDetails(remoteId));
  }
}
