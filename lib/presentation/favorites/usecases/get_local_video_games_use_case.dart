
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/common/base_use_case.dart';
import 'package:video_game_completed/core/common/result.dart';
import 'package:video_game_completed/core/data/models/db/video_game_db.dart';
import 'package:video_game_completed/core/data/repositories/video_games_repository.dart';

@injectable
class GetLocalVideoGamesUseCase
  implements BaseUseCaseNoParams<Result<List<VideoGameDb>>>{
  GetLocalVideoGamesUseCase(this._videoGamesRepository);

  final VideoGamesRepository _videoGamesRepository;

  @override
  Future<Result<List<VideoGameDb>>> execute() async {
    return _videoGamesRepository.getLocalVideoGames();
  }

}