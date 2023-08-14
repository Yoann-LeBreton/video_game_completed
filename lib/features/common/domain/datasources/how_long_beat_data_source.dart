import 'package:flutter/foundation.dart';
import 'package:video_game_completed/features/search/data/models/search_videogame_response.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/core/enums/search_filter_enums.dart';

@immutable
abstract interface class HowLongBeatDataSource {
  Future<SearchVideogameResponse> searchVideoGame(
      int pageResult,
      String searchText,
      SearchFilterSortBy sortBy,
      SearchFilterPlatform platform);

  Future<VideoGameWithIndivModel> getVideoGameDetails(int remoteId);
}