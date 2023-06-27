import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/common/result.dart';
import 'package:video_game_completed/core/data/models/db/video_game_db.dart';
import 'package:video_game_completed/core/error/exceptions.dart';
import 'package:video_game_completed/presentation/favorites/cubits/favorite_video_games_state.dart';
import 'package:video_game_completed/presentation/favorites/usecases/get_local_video_games_use_case.dart';
import 'package:video_game_completed/presentation/favorites/usecases/insert_local_video_game_use_case.dart';

@injectable
class FavoriteVideoGameCubit extends Cubit<FavoriteVideoGameState>{
  FavoriteVideoGameCubit(this._getLocalVideoGamesUseCase, this._insertLocalVideoGameUseCase) : super(const FavoriteVideoGameStateInitial());

  final GetLocalVideoGamesUseCase _getLocalVideoGamesUseCase;
  final InsertLocalVideoGameUseCase _insertLocalVideoGameUseCase;

  Future<void> getAllFavorite() async {
    safeEmit(const FavoriteVideoGameStateLoading());
    final Result<List<VideoGameDb>> result =  await _getLocalVideoGamesUseCase.execute();
    if(result.isFailure){
      safeEmit(FavoriteVideoGameStateError(exception: result.exceptionOrNull() ?? LocalDataSourceException(message: "no results found in local DB")));
    }else{
      safeEmit(FavoriteVideoGameStateSuccess(data: result.getOrDefault([])));
    }
  }

  Future<void> insertFavorite(int remoteId, String gameName) async {
    final result = await _insertLocalVideoGameUseCase.execute(parameters: InsertLocalVideoGameUseCaseParams(remoteId: remoteId, gameName: gameName));
    if(result.isFailure){
      safeEmit(FavoriteVideoGameStateError(exception: result.exceptionOrNull() ?? LocalDataSourceException(message: "failed to insert value")));
    }
  }

  void safeEmit(FavoriteVideoGameState state){
    if(!isClosed){
      emit(state);
    }
  }
}