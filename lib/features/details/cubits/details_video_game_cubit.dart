import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/core/error/exceptions.dart';
import 'package:video_game_completed/features/details/cubits/details_video_game_state.dart';
import 'package:video_game_completed/features/details/usecases/get_video_game_details_use_case.dart';


@injectable
class DetailsVideoGameCubit extends Cubit<DetailsVideoGameState> {
  DetailsVideoGameCubit(this._getVideoGameDetailsUseCase)
      : super(const DetailsVideoGameStateInitial());

  final GetVideoGameDetailsUseCase _getVideoGameDetailsUseCase;

  Future<void> getRemoteDetails(int remoteId) async {
    safeEmit(const DetailsVideoGameStateLoading());
    final Result<VideoGameWithIndivModel> details =
        await _getVideoGameDetailsUseCase.execute(
            parameters: GetVideoGameDetailsUseCaseParams(remoteId: remoteId));
    if (details.isFailure) {
      safeEmit(DetailsVideoGameStateError(
          exception: details.exceptionOrNull() ??
              RemoteDataSourceException(
                  message: "no details found for ID '$remoteId'")));
    } else {
      safeEmit(DetailsVideoGameStateSuccess(
          videoGame: details.getOrDefault(VideoGameWithIndivModel([], []))));
    }
  }

  void safeEmit(DetailsVideoGameState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
