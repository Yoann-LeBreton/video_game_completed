import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/cubit/video_game_state.dart';
import 'package:video_game_completed/core/data/models/search_videogame_response.dart';
import 'package:video_game_completed/core/usecase/search_video_game_cubit.dart';

@injectable
class VideoGameCubit extends Cubit<VideoGameState>{
  VideoGameCubit(this._searchVideoGameUseCase): super(VideoGameState.initial());

  final SearchVideoGameUseCase _searchVideoGameUseCase;

  Future<void> searchVideoGame() async {
    emit(VideoGameState.loading());
    final SearchVideogameResponse searchResult = await _searchVideoGameUseCase.execute(parameters: SearchVideoGameUseCaseParams(textSearch: ''));
    emit(VideoGameState.success(searchResult));

  }
}