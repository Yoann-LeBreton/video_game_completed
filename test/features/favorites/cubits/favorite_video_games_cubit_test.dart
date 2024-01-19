import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';
import 'package:video_game_completed/core/error/exceptions.dart';
import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';
import 'package:video_game_completed/features/common/domain/repositories/video_games_repository.dart';
import 'package:video_game_completed/features/favorites/cubits/favorite_video_games_cubit.dart';
import 'package:video_game_completed/features/favorites/cubits/favorite_video_games_state.dart';
import 'package:video_game_completed/features/favorites/usecases/delete_local_video_game_use_case.dart';
import 'package:video_game_completed/features/favorites/usecases/get_local_video_games_use_case.dart';
import 'package:video_game_completed/features/favorites/usecases/insert_local_video_game_use_case.dart';

import '../../search/cubits/search_video_game_cubit_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DeleteLocalVideoGameUseCase deleteLocalVideoGameUseCase;
  late GetLocalVideoGamesUseCase getLocalVideoGamesUseCase;
  late InsertLocalVideoGameUseCase insertLocalVideoGameUseCase;
  late VideoGamesRepository videoGamesRepository;
  late FavoriteVideoGameCubit sut;

  setUp(() {
    videoGamesRepository = MockVideoGamesRepository();
    deleteLocalVideoGameUseCase =
        DeleteLocalVideoGameUseCase(videoGamesRepository);
    getLocalVideoGamesUseCase = GetLocalVideoGamesUseCase(videoGamesRepository);
    insertLocalVideoGameUseCase =
        InsertLocalVideoGameUseCase(videoGamesRepository);
    sut = FavoriteVideoGameCubit(getLocalVideoGamesUseCase,
        insertLocalVideoGameUseCase, deleteLocalVideoGameUseCase,);
  });

  final localFavorites = [
    VideoGameDb(
        remoteId: 68151,
        name: 'Elden Ring',
        imageName: '68151_Elden_Ring.jpg',
        releaseYear: 2022,
        status: VideoGameStatus.finished,),
    VideoGameDb(
        remoteId: 966,
        name: 'Bayonetta',
        imageName: 'Bayonetta_Box_Art.jpg',
        releaseYear: 2009,
        status: VideoGameStatus.started,),
  ];

  group('get all local favorites', () {
    blocTest<FavoriteVideoGameCubit, FavoriteVideoGameState>(
      'should emit FavoriteVideoGameState.success',
      setUp: () {
        when(videoGamesRepository.getLocalVideoGames()).thenAnswer(
            (_) => Future.value(Result.success(data: localFavorites)),);
      },
      build: () => sut,
      act: (cubit) => cubit.getAllFavorite(),
      expect: () => [
        const FavoriteVideoGameState.loading(),
        FavoriteVideoGameState.success(data: localFavorites),
      ],
    );

    blocTest<FavoriteVideoGameCubit, FavoriteVideoGameState>(
      'should emit FavoriteVideoGameState.error',
      setUp: () {
        when(videoGamesRepository.getLocalVideoGames()).thenAnswer((_) =>
            Future.value(const Result.failure(
                exception: LocalDataSourceException(
                    message: 'failed to retrieve data',),),),);
      },
      build: () => sut,
      act: (cubit) => cubit.getAllFavorite(),
      expect: () => [
        const FavoriteVideoGameState.loading(),
        const FavoriteVideoGameState.error(
            exception:
                LocalDataSourceException(message: 'failed to retrieve data'),),
      ],
    );
  });

  group('insert favorite', () {
    final newFavorite = VideoGameDb(
        remoteId: 967,
        name: 'Bayonetta 2',
        imageName: '250px-Bayonetta_2.jpg',
        releaseYear: 2014,
        status: VideoGameStatus.wishlisted,);

    blocTest<FavoriteVideoGameCubit, FavoriteVideoGameState>(
      'should emit FavoriteVideoGameState.success',
      setUp: () {
        when(videoGamesRepository.insertLocalVideoGame(
                967,
                'Bayonetta 2',
                '250px-Bayonetta_2.jpg',
                2014,
                'Nintendo Switch',
                VideoGameStatus.wishlisted,),)
            .thenAnswer(
                (_) => Future.value(const Result<void>.success(data: null)),);
        when(videoGamesRepository.getLocalVideoGames()).thenAnswer((_) =>
            Future.value(
                Result.success(data: [...localFavorites, newFavorite]),),);
      },
      build: () => sut,
      act: (cubit) => cubit.insertFavorite(
          967,
          'Bayonetta 2',
          '250px-Bayonetta_2.jpg',
          2014,
          'Nintendo Switch',
          VideoGameStatus.wishlisted,),
      expect: () => [
        const FavoriteVideoGameState.loading(),
        FavoriteVideoGameState.success(data: [...localFavorites, newFavorite]),
      ],
    );

    blocTest<FavoriteVideoGameCubit, FavoriteVideoGameState>(
      'should emit FavoriteVideoGameState.error',
      setUp: () {
        when(videoGamesRepository.insertLocalVideoGame(
                967,
                'Bayonetta 2',
                '250px-Bayonetta_2.jpg',
                2014,
                'Nintendo Switch',
                VideoGameStatus.wishlisted,),)
            .thenAnswer((_) => Future.value(const Result.failure(
                exception: LocalDataSourceException(
                    message: "failed to write new data",),),),);
      },
      build: () => sut,
      act: (cubit) => cubit.insertFavorite(
          967,
          'Bayonetta 2',
          '250px-Bayonetta_2.jpg',
          2014,
          'Nintendo Switch',
          VideoGameStatus.wishlisted,),
      expect: () => [
        const FavoriteVideoGameState.loading(),
        const FavoriteVideoGameState.error(
            exception:
                LocalDataSourceException(message: "failed to write new data"),),
      ],
    );
  });

  group('delete favorite', () {
    blocTest<FavoriteVideoGameCubit, FavoriteVideoGameState>(
      'should emit FavoriteVideoGameState.success',
      setUp: () {
        when(videoGamesRepository.deleteLocalVideoGames(967)).thenAnswer(
            (_) => Future.value(const Result<void>.success(data: null)),);
        when(videoGamesRepository.getLocalVideoGames()).thenAnswer(
            (_) => Future.value(Result.success(data: localFavorites)),);
      },
      build: () => sut,
      act: (cubit) => cubit.deleteFavorite(967),
      expect: () => [
        const FavoriteVideoGameState.loading(),
        FavoriteVideoGameState.success(data: localFavorites),
      ],
    );

    blocTest<FavoriteVideoGameCubit, FavoriteVideoGameState>(
      'should emit FavoriteVideoGameState.error',
      setUp: () {
        when(videoGamesRepository.deleteLocalVideoGames(967)).thenAnswer((_) =>
            Future.value(const Result.failure(
                exception: LocalDataSourceException(
                    message: "failed to delete data",),),),);
      },
      build: () => sut,
      act: (cubit) => cubit.deleteFavorite(967),
      expect: () => [
        const FavoriteVideoGameState.loading(),
        const FavoriteVideoGameState.error(
            exception:
                LocalDataSourceException(message: "failed to delete data"),),
      ],
    );
  });
}
