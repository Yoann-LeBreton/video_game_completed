import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:video_game_completed/core/domain/entities/result.dart';
import 'package:video_game_completed/core/enums/search_filter_enums.dart';
import 'package:video_game_completed/core/error/exceptions.dart';
import 'package:video_game_completed/features/common/domain/repositories/video_games_repository.dart';
import 'package:video_game_completed/features/search/cubits/search_video_game_cubit.dart';
import 'package:video_game_completed/features/search/cubits/search_video_game_state.dart';
import 'package:video_game_completed/features/search/data/models/search_videogame_response.dart';
import 'package:video_game_completed/features/search/data/models/video_game_short_model.dart';
import 'package:video_game_completed/features/search/usecases/search_video_game_use_case.dart';

import 'search_video_game_cubit_test.mocks.dart';

@GenerateMocks([VideoGamesRepository])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SearchVideoGameUseCase searchVideoGameUseCase;
  late VideoGamesRepository videoGamesRepository;
  late SearchVideoGameCubit sut;

  setUp(() {
    videoGamesRepository = MockVideoGamesRepository();
    searchVideoGameUseCase = SearchVideoGameUseCase(videoGamesRepository);
    sut = SearchVideoGameCubit(searchVideoGameUseCase);
  });

  group('basic search', () {
    final searchResponse = SearchVideogameResponse('games', 2, 1, 1, [
      VideoGameShortModel(42833, 'Super Mario Odyssey',
          '42833_Super_Mario_Odyssey.jpg', 2017, 'Nintendo Switch'),
      VideoGameShortModel(42833, 'Super Mario Galaxy',
          '250px-SuperMarioGalaxy.jpg', 2017, 'Nintendo Switch, Wii'),
    ]);

    blocTest<SearchVideoGameCubit, SearchVideoGameState>(
      'should emit SearchVideoGameState.success',
      setUp: () {
        when(videoGamesRepository.searchVideoGame(
                1, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all))
            .thenAnswer(
          (_) => Future.value(Result.success(
            data: searchResponse,
          )),
        );
      },
      build: () => sut,
      act: (cubit) => cubit.searchVideoGame(
          'mario', SearchFilterSortBy.name, SearchFilterPlatform.all),
      expect: () => [
        const SearchVideoGameState.loading(),
        SearchVideoGameState.success(data: searchResponse)
      ],
    );

    blocTest<SearchVideoGameCubit, SearchVideoGameState>(
      'should emit SearchVideoGameState.error - ApiException',
      setUp: () {
        when(videoGamesRepository.searchVideoGame(
                1, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all))
            .thenAnswer(
          (_) => Future.value(Result.failure(
              exception: ApiException(
                  method: 'post', path: '/api/search', statusCode: 400))),
        );
      },
      build: () => sut,
      act: (cubit) => cubit.searchVideoGame(
          'mario', SearchFilterSortBy.name, SearchFilterPlatform.all),
      expect: () => [
        const SearchVideoGameState.loading(),
        SearchVideoGameState.error(
            exception: ApiException(
                method: 'post', path: '/api/search', statusCode: 400))
      ],
    );
  });

  group('search next results', () {
    final searchResponse = SearchVideogameResponse('games', 2, 1, 1, [
      VideoGameShortModel(42833, 'Super Mario Odyssey',
          '42833_Super_Mario_Odyssey.jpg', 2017, 'Nintendo Switch'),
      VideoGameShortModel(42833, 'Super Mario Galaxy',
          '250px-SuperMarioGalaxy.jpg', 2017, 'Nintendo Switch, Wii'),
    ]);

    blocTest<SearchVideoGameCubit, SearchVideoGameState>(
      'should emit SearchVideoGameState.next',
      setUp: () {
        when(videoGamesRepository.searchVideoGame(
                2, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all))
            .thenAnswer(
          (_) => Future.value(Result.success(
            data: searchResponse,
          )),
        );
      },
      build: () => sut,
      act: (cubit) => cubit.getNextResults(
          2, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all),
      expect: () => [
        const SearchVideoGameState.loadingNext(),
        SearchVideoGameState.next(nextData: searchResponse)
      ],
    );

    blocTest<SearchVideoGameCubit, SearchVideoGameState>(
      'should emit SearchVideoGameState.error - ApiException',
      setUp: () {
        when(videoGamesRepository.searchVideoGame(
                2, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all))
            .thenAnswer(
          (_) => Future.value(Result.failure(
              exception: ApiException(
                  method: 'post', path: '/api/search', statusCode: 400))),
        );
      },
      build: () => sut,
      act: (cubit) => cubit.getNextResults(
          2, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all),
      expect: () => [
        const SearchVideoGameState.loadingNext(),
        SearchVideoGameState.error(
            exception: ApiException(
                method: 'post', path: '/api/search', statusCode: 400))
      ],
    );
  });
}
