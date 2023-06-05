import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/common/base_use_case.dart';
import 'package:video_game_completed/core/common/result.dart';
import 'package:video_game_completed/core/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/core/data/repositories/video_games_repository.dart';

@injectable
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
