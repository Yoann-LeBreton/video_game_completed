
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/domain/usecases/base_use_case.dart';

import '../../../core/domain/entities/result.dart';
import '../../common/domain/repositories/video_games_repository.dart';

@lazySingleton
class DeleteLocalVideoGameUseCase implements BaseUsecase<Result<void>, DeleteLocalVideoGameUseCaseParams>{

  DeleteLocalVideoGameUseCase(this._videoGamesRepository);
  final VideoGamesRepository _videoGamesRepository;

  @override
  Future<Result<void>> execute({required DeleteLocalVideoGameUseCaseParams parameters}) {
    return _videoGamesRepository.deleteLocalVideoGames(parameters._remoteId);
  }
}

class DeleteLocalVideoGameUseCaseParams {
  DeleteLocalVideoGameUseCaseParams({required int remoteId}): _remoteId = remoteId;
  final int _remoteId;
}