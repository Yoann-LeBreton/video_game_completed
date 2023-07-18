
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/domain/usecases/base_use_case.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';
import 'package:video_game_completed/features/common/domain/repositories/video_games_repository.dart';

@lazySingleton
class GetLocalVideoGamesUseCase
  implements BaseUseCaseNoParams<Result<List<VideoGameDb>>>{
  GetLocalVideoGamesUseCase(this._videoGamesRepository);

  final VideoGamesRepository _videoGamesRepository;

  @override
  Future<Result<List<VideoGameDb>>> execute() async {
    return _videoGamesRepository.getLocalVideoGames();
  }

}