import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/domain/usecases/base_use_case.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/features/common/domain/repositories/video_games_repository.dart';

@lazySingleton
class GetVideoGameDetailsUseCase
    implements BaseUsecase<Result<VideoGameWithIndivModel>, GetVideoGameDetailsUseCaseParams> {
  GetVideoGameDetailsUseCase(this._videoGamesRepository);

  final VideoGamesRepository _videoGamesRepository;

  @override
  Future<Result<VideoGameWithIndivModel>> execute(
      {required GetVideoGameDetailsUseCaseParams parameters}) async {
    return _videoGamesRepository.getVideoGameDetails(parameters._remoteId);
  }
}

class GetVideoGameDetailsUseCaseParams {
  const GetVideoGameDetailsUseCaseParams({required int remoteId})
      : _remoteId = remoteId;
  final int _remoteId;
}
