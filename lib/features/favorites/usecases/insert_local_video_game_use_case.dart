import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/domain/usecases/base_use_case.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';
import 'package:video_game_completed/features/common/domain/repositories/video_games_repository.dart';

@lazySingleton
class InsertLocalVideoGameUseCase
    implements BaseUsecase<Result<void>, InsertLocalVideoGameUseCaseParams> {
  InsertLocalVideoGameUseCase(this._videoGamesRepository);

  final VideoGamesRepository _videoGamesRepository;

  @override
  Future<Result<void>> execute(
      {required InsertLocalVideoGameUseCaseParams parameters}) {
    return _videoGamesRepository.insertLocalVideoGame(
      parameters._remoteId,
      parameters._gameName,
      parameters._imageName,
      parameters._releaseYear,
      parameters._platformSelected,
      parameters._status
    );
  }
}

class InsertLocalVideoGameUseCaseParams {
  InsertLocalVideoGameUseCaseParams({
    required int remoteId,
    required String gameName,
    required String imageName,
    required int releaseYear,
    String? platformSelected,
    required VideoGameStatus status,
  })  : _remoteId = remoteId,
        _gameName = gameName,
        _imageName = imageName,
        _releaseYear = releaseYear,
        _platformSelected = platformSelected,
        _status = status;
  final int _remoteId;
  final String _gameName;
  final String _imageName;
  final int _releaseYear;
  final String? _platformSelected;
  final VideoGameStatus _status;
}
