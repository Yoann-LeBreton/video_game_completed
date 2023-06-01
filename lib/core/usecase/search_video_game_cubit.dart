import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/data/models/search_videogame_response.dart';
import 'package:video_game_completed/core/data/repositories/video_games_repository.dart';
import 'package:video_game_completed/core/usecase/base_use_case.dart';

@injectable
class SearchVideoGameUseCase implements BaseUsecase<SearchVideogameResponse, SearchVideoGameUseCaseParams> {
  SearchVideoGameUseCase(this._videoGamesRepository);
  final VideoGamesRepository _videoGamesRepository;

  @override
  Future<SearchVideogameResponse> execute({required SearchVideoGameUseCaseParams parameters}) {
    return _videoGamesRepository.searchVideoGame(parameters._textSearch);
  }
}

class SearchVideoGameUseCaseParams{
  SearchVideoGameUseCaseParams({required String textSearch}) : _textSearch = textSearch;
  final String _textSearch;
}