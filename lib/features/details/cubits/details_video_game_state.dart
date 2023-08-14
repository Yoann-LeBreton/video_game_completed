import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model_with_indiv.dart';

part 'details_video_game_state.freezed.dart';

@freezed
class DetailsVideoGameState with _$DetailsVideoGameState {
  const factory DetailsVideoGameState.initial() = DetailsVideoGameStateInitial;

  const factory DetailsVideoGameState.loading() = DetailsVideoGameStateLoading;

  const factory DetailsVideoGameState.success({
      required VideoGameWithIndivModel videoGame}) = DetailsVideoGameStateSuccess;

  const factory DetailsVideoGameState.error({required Exception exception}) = DetailsVideoGameStateError;
}
