
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/common/base_use_case.dart';
import 'package:video_game_completed/core/common/result.dart';
import 'package:video_game_completed/core/data/repositories/video_games_repository.dart';

@injectable
class InsertLocalVideoGameUseCase implements BaseUsecase<Result<void>, InsertLocalVideoGameUseCaseParams>{
  InsertLocalVideoGameUseCase(this._videoGamesRepository);
  final VideoGamesRepository _videoGamesRepository;

  @override
  Future<Result<void>> execute({required InsertLocalVideoGameUseCaseParams parameters}) {
    return _videoGamesRepository.insertLocalVideoGame(parameters._remoteId, parameters._gameName);
  }
}

class InsertLocalVideoGameUseCaseParams {
  InsertLocalVideoGameUseCaseParams(
  {required int remoteId, required gameName}
      ) : _remoteId = remoteId, _gameName = gameName;
  final int _remoteId;
  final String _gameName;
}