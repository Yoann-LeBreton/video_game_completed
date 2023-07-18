import 'package:flutter/foundation.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';
import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';
import 'package:video_game_completed/features/search/data/models/search_videogame_response.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/core/enums/search_filter_enums.dart';

@immutable
abstract interface class VideoGamesRepository {
  Future<Result<SearchVideogameResponse>> searchVideoGame(
      int pageResult,
      String searchText,
      SearchFilterSortBy sortBy,
      SearchFilterPlatform platform);

  Future<Result<VideoGameWithIndivModel>> getVideoGameDetails(int remoteId);

  Future<Result<List<VideoGameDb>>> getLocalVideoGames();

  Future<Result<void>> insertLocalVideoGame(
    int remoteId,
    String gameName,
    String imageName,
    int releaseYear,
    String? platformSelected,
    VideoGameStatus status,
  );
}
