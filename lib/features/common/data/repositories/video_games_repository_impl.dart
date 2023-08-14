import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';
import 'package:video_game_completed/features/common/data/datasources/how_long_beat_data_source_impl.dart';
import 'package:video_game_completed/features/common/data/datasources/video_game_local_data_source.dart';
import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';
import 'package:video_game_completed/features/search/data/models/search_videogame_response.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/core/enums/search_filter_enums.dart';
import 'package:video_game_completed/features/common/domain/datasources/how_long_beat_data_source.dart';
import 'package:video_game_completed/features/common/domain/repositories/video_games_repository.dart';

@LazySingleton(as: VideoGamesRepository)
class VideoGamesRepositoryImpl implements VideoGamesRepository {
  VideoGamesRepositoryImpl(HowLongBeatDataSource howLongBeatDataSource,
      VideoGameLocalDataSource videoGameLocalDataSource)
      : _howLongBeatDataSource = howLongBeatDataSource,
        _videoGameLocalDataSource = videoGameLocalDataSource;

  final HowLongBeatDataSource _howLongBeatDataSource;
  final VideoGameLocalDataSource _videoGameLocalDataSource;

  @override
  Future<Result<SearchVideogameResponse>> searchVideoGame(
      int pageResult,
      String searchText,
      SearchFilterSortBy sortBy,
      SearchFilterPlatform platform) async {
    return runCatchingAsync(() => _howLongBeatDataSource.searchVideoGame(
        pageResult, searchText, sortBy, platform));
  }

  @override
  Future<Result<VideoGameWithIndivModel>> getVideoGameDetails(
      int remoteId) async {
    return runCatchingAsync(
        () => _howLongBeatDataSource.getVideoGameDetails(remoteId));
  }

  @override
  Future<Result<List<VideoGameDb>>> getLocalVideoGames() async {
    return runCatchingAsync(() => _videoGameLocalDataSource.getAllVideoGames());
  }

  @override
  Future<Result<void>> insertLocalVideoGame(
    int remoteId,
    String gameName,
    String imageName,
    int releaseYear,
    String? platformSelected,
    VideoGameStatus status,
  ) {
    return runCatchingAsync(() => _videoGameLocalDataSource.insertVideoGame(
          remoteId,
          gameName,
          imageName,
          releaseYear,
          platformSelected,
          status,
        ));
  }

  @override
  Future<Result<void>> deleteLocalVideoGames(int remoteId) async {
    return runCatchingAsync(() => _videoGameLocalDataSource.deleteVideoGame(remoteId));
  }
}
