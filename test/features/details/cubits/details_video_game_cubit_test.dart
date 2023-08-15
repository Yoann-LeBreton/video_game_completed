import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/core/error/exceptions.dart';
import 'package:video_game_completed/features/common/domain/repositories/video_games_repository.dart';
import 'package:video_game_completed/features/details/cubits/details_video_game_cubit.dart';
import 'package:video_game_completed/features/details/cubits/details_video_game_state.dart';
import 'package:video_game_completed/features/details/data/models/individuality_model.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/features/details/usecases/get_video_game_details_use_case.dart';

import '../../search/cubits/search_video_game_cubit_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GetVideoGameDetailsUseCase getVideoGameDetailsUseCase;
  late VideoGamesRepository videoGamesRepository;
  late DetailsVideoGameCubit sut;

  setUp(() {
    videoGamesRepository = MockVideoGamesRepository();
    getVideoGameDetailsUseCase =
        GetVideoGameDetailsUseCase(videoGamesRepository);
    sut = DetailsVideoGameCubit(getVideoGameDetailsUseCase);
  });

  group('get video game details', () {
    VideoGameWithIndivModel successResponse = VideoGameWithIndivModel([
      VideoGameModel(
          68151,
          'Elden Ring',
          '68151_Elden_Ring.jpg',
          'The Golden Order has been broken. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.',
          93,
          'FromSoftware',
          'Bandai Namco Entertainment',
          'PC, PlayStation 4, PlayStation 5, Xbox One, Xbox Series X/S')
    ], [
      IndividualityModel('PC, PlayStation 5, Xbox One', '5195', '207440')
    ]);

    blocTest<DetailsVideoGameCubit, DetailsVideoGameState>(
      'should emit DetailsVideoGameState.success',
      setUp: () {
        when(videoGamesRepository.getVideoGameDetails(68151)).thenAnswer(
            (_) => Future.value(Result.success(data: successResponse)));
      },
      build: () => sut,
      act: (cubit) => cubit.getRemoteDetails(68151),
      expect: () => [
        const DetailsVideoGameState.loading(),
        DetailsVideoGameState.success(videoGame: successResponse)
      ],
    );

    blocTest<DetailsVideoGameCubit, DetailsVideoGameState>(
      'should emit DetailsVideoGameState.error',
      setUp: () {
        when(videoGamesRepository.getVideoGameDetails(68151)).thenAnswer(
          (_) => Future.value(Result.failure(
              exception: ApiException(
                  method: 'post', path: '/game?id=68151', statusCode: 400))),
        );
      },
      build: () => sut,
      act: (cubit) => cubit.getRemoteDetails(68151),
      expect: () => [
        const DetailsVideoGameState.loading(),
        DetailsVideoGameState.error(
            exception: ApiException(
                method: 'post', path: '/game?id=68151', statusCode: 400))
      ],
    );
  });
}
