import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/features/search/data/models/search_videogame_response.dart';
import 'package:video_game_completed/core/domain/usecases/base_use_case.dart';
import 'package:video_game_completed/core/enums/search_filter_enums.dart';
import 'package:video_game_completed/features/common/domain/repositories/video_games_repository.dart';

@lazySingleton
class SearchVideoGameUseCase
    implements
        BaseUsecase<Result<SearchVideogameResponse>, SearchVideoGameUseCaseParams> {
  SearchVideoGameUseCase(this._videoGamesRepository);

  final VideoGamesRepository _videoGamesRepository;

  @override
  Future<Result<SearchVideogameResponse>> execute(
      {required SearchVideoGameUseCaseParams parameters}) {
    return _videoGamesRepository.searchVideoGame(parameters._pageResult,
        parameters._textSearch, parameters._sortBy, parameters._platform);
  }
}

class SearchVideoGameUseCaseParams {
  SearchVideoGameUseCaseParams(
      {required int pageResult,
      required String textSearch,
      required SearchFilterSortBy sortBy,
      required SearchFilterPlatform platform})
      : _pageResult = pageResult,
        _textSearch = textSearch,
        _sortBy = sortBy,
        _platform = platform;
  final int _pageResult;
  final String _textSearch;
  final SearchFilterSortBy _sortBy;
  final SearchFilterPlatform _platform;
}
