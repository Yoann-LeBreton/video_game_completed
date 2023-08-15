import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';
import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';
import 'package:video_game_completed/core/error/exceptions.dart';
import 'package:video_game_completed/features/favorites/usecases/delete_local_video_game_use_case.dart';
import 'package:video_game_completed/features/favorites/cubits/favorite_video_games_state.dart';
import 'package:video_game_completed/features/favorites/usecases/get_local_video_games_use_case.dart';
import 'package:video_game_completed/features/favorites/usecases/insert_local_video_game_use_case.dart';

@injectable
class FavoriteVideoGameCubit extends Cubit<FavoriteVideoGameState> {
  FavoriteVideoGameCubit(this._getLocalVideoGamesUseCase,
      this._insertLocalVideoGameUseCase, this._deleteLocalVideoGameUseCase)
      : super(const FavoriteVideoGameStateInitial());

  final GetLocalVideoGamesUseCase _getLocalVideoGamesUseCase;
  final InsertLocalVideoGameUseCase _insertLocalVideoGameUseCase;
  final DeleteLocalVideoGameUseCase _deleteLocalVideoGameUseCase;

  Future<void> getAllFavorite() async {
    safeEmit(const FavoriteVideoGameStateLoading());
    final Result<List<VideoGameDb>> result =
        await _getLocalVideoGamesUseCase.execute();
    if (result.isFailure) {
      safeEmit(FavoriteVideoGameStateError(
          exception: result.exceptionOrNull() ??
              const LocalDataSourceException(
                  message: "no results found in local DB")));
    } else {
      safeEmit(FavoriteVideoGameStateSuccess(data: result.getOrDefault([])));
    }
  }

  Future<void> insertFavorite(
    int remoteId,
    String gameName,
    String imageName,
    int releaseYear,
    String? platformSelected,
    VideoGameStatus status,
  ) async {
    safeEmit(const FavoriteVideoGameStateLoading());
    final result = await _insertLocalVideoGameUseCase.execute(
        parameters: InsertLocalVideoGameUseCaseParams(
      remoteId: remoteId,
      gameName: gameName,
      imageName: imageName,
      releaseYear: releaseYear,
      platformSelected: platformSelected,
      status: status,
    ));
    if (result.isFailure) {
      safeEmit(FavoriteVideoGameStateError(
          exception: result.exceptionOrNull() ??
              const LocalDataSourceException(message: "failed to insert value")));
    } else {
      getAllFavorite();
    }
  }

  Future<void> deleteFavorite(int remoteId) async {
    safeEmit(const FavoriteVideoGameStateLoading());
    final result = await _deleteLocalVideoGameUseCase.execute(
        parameters: DeleteLocalVideoGameUseCaseParams(remoteId: remoteId));
    if (result.isFailure) {
      safeEmit(FavoriteVideoGameStateError(
          exception: result.exceptionOrNull() ??
              const LocalDataSourceException(message: "failed to delete value")));
    } else {
      getAllFavorite();
    }
  }

  void safeEmit(FavoriteVideoGameState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
