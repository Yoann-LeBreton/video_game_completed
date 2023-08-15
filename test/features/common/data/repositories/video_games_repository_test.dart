import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:video_game_completed/core/enums/search_filter_enums.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';
import 'package:video_game_completed/core/error/exceptions.dart';
import 'package:video_game_completed/features/common/data/datasources/video_game_local_data_source.dart';
import 'package:video_game_completed/features/common/data/repositories/video_games_repository_impl.dart';
import 'package:video_game_completed/features/common/domain/datasources/how_long_beat_data_source.dart';
import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';
import 'package:video_game_completed/features/common/domain/repositories/video_games_repository.dart';
import 'package:video_game_completed/features/details/data/models/individuality_model.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model.dart';
import 'package:video_game_completed/features/details/data/models/video_game_model_with_indiv.dart';
import 'package:video_game_completed/features/search/data/models/search_videogame_response.dart';
import 'package:video_game_completed/features/search/data/models/video_game_short_model.dart';

import 'video_games_repository_test.mocks.dart';

@GenerateMocks([HowLongBeatDataSource, VideoGameLocalDataSource])
void main() {
  MockHowLongBeatDataSource howLongBeatDataSource = MockHowLongBeatDataSource();
  MockVideoGameLocalDataSource videoGameLocalDataSource =
      MockVideoGameLocalDataSource();
  late VideoGamesRepository sut;

  setUp(() {
    sut = VideoGamesRepositoryImpl(
        howLongBeatDataSource, videoGameLocalDataSource);
  });

  group('searchVideoGame', () {
    SearchVideogameResponse successResponse =
        SearchVideogameResponse('games', 2, 1, 1, [
      VideoGameShortModel(42833, 'Super Mario Odyssey',
          '42833_Super_Mario_Odyssey.jpg', 2017, 'Nintendo Switch'),
      VideoGameShortModel(42833, 'Super Mario Galaxy',
          '250px-SuperMarioGalaxy.jpg', 2017, 'Nintendo Switch, Wii'),
    ]);

    test('when request succeeded', () async {
      when(howLongBeatDataSource.searchVideoGame(
              1, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all))
          .thenAnswer((_) => Future.value(successResponse));
      final response = await sut.searchVideoGame(
          1, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all);
      expect(response.isSuccess, true);
      expect(response.getOrThrow().games.length, 2);
    });

    test('when request failed - Http Error', () async {
      when(howLongBeatDataSource.searchVideoGame(
              1, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all))
          .thenThrow(ApiException(
              method: 'post', path: '/api/search', statusCode: 400));
      final response = await sut.searchVideoGame(
          1, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all);
      expect(response.exceptionOrNull(),
          ApiException(method: 'post', path: '/api/search', statusCode: 400));
    });

    test('when request failed - No JSON result', () async {
      when(howLongBeatDataSource.searchVideoGame(
              1, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all))
          .thenThrow(const RemoteDataSourceException(
              message: "failed to find video games for"));
      final response = await sut.searchVideoGame(
          1, 'mario', SearchFilterSortBy.name, SearchFilterPlatform.all);
      expect(
          response.exceptionOrNull(),
          const RemoteDataSourceException(
              message: "failed to find video games for"));
    });
  });

  group('getVideoGameDetails', () {
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

    test('when request succeeded', () async {
      when(howLongBeatDataSource.getVideoGameDetails(68151)).thenAnswer((_) => Future.value(successResponse));
      final response = await sut.getVideoGameDetails(68151);
      expect(response.isSuccess, true);
      expect(response.getOrThrow().games.length, 1);
    });

    test('when request failed - Http Error', () async {
      when(howLongBeatDataSource.getVideoGameDetails(68151))
          .thenThrow(ApiException(
              method: 'post', path: '/game?id=68151', statusCode: 400));
      final response = await sut.getVideoGameDetails(68151);
      expect(response.exceptionOrNull(),
          ApiException(method: 'post', path: '/game?id=68151', statusCode: 400));
    });

    test('when request failed - No JSON result', () async {
      when(howLongBeatDataSource.getVideoGameDetails(68151))
          .thenThrow(const RemoteDataSourceException(
              message: "failed to find video games for"));
      final response = await sut.getVideoGameDetails(68151);
      expect(
          response.exceptionOrNull(),
          const RemoteDataSourceException(
              message: "failed to find video games for"));
    });
  });

  group('getLocalVideoGames', () {
    test('when request succeeded', () async {
      when(videoGameLocalDataSource.getAllVideoGames()).thenAnswer((_) => Future.value([
        VideoGameDb(remoteId: 68151, name: 'Elden Ring', imageName:
            '68151_Elden_Ring.jpg', releaseYear: 2022, status: VideoGameStatus.finished),
        VideoGameDb(remoteId: 966, name: 'Bayonetta', imageName:
        'Bayonetta_Box_Art.jpg', releaseYear: 2009, status: VideoGameStatus.started)
      ]));
      final response = await sut.getLocalVideoGames();
      expect(response.isSuccess, true);
      expect(response.getOrThrow().length, 2);
    });


    test('when request failed', () async {
      when(videoGameLocalDataSource.getAllVideoGames()).thenThrow(const LocalDataSourceException(message: "failed to retrieve infos"));
      final response = await sut.getLocalVideoGames();
      expect(response.isFailure, true);
      expect(response.exceptionOrNull(), const LocalDataSourceException(message: "failed to retrieve infos"));
    });
  });

  group('insertLocalVideoGame', () {
    test('when request succeeded', () async {
      when(videoGameLocalDataSource.insertVideoGame(68151, 'Elden Ring', '68151_Elden_Ring.jpg', 2022, 'PC', VideoGameStatus.finished)).thenAnswer((_) => Future.value());
      final response = await sut.insertLocalVideoGame(68151, 'Elden Ring', '68151_Elden_Ring.jpg', 2022, 'PC', VideoGameStatus.finished);
      expect(response.isSuccess, true);
    });


    test('when request failed', () async {
      when(videoGameLocalDataSource.insertVideoGame(68151, 'Elden Ring', '68151_Elden_Ring.jpg', 2022, 'PC', VideoGameStatus.finished)).thenThrow(const LocalDataSourceException(message: "failed to insert value"));
      final response = await sut.insertLocalVideoGame(68151, 'Elden Ring', '68151_Elden_Ring.jpg', 2022, 'PC', VideoGameStatus.finished);
      expect(response.isFailure, true);
      expect(response.exceptionOrNull(), const LocalDataSourceException(message: "failed to insert value"));
    });
  });

  group('deleteLocalVideoGames', () {
    test('when request succeeded', () async {
      when(videoGameLocalDataSource.deleteVideoGame(68151)).thenAnswer((_) => Future.value());
      final response = await sut.deleteLocalVideoGames(68151);
      expect(response.isSuccess, true);
    });


    test('when request failed', () async {
      when(videoGameLocalDataSource.deleteVideoGame(68151)).thenThrow(const LocalDataSourceException(message: "failed to delete value"));
      final response = await sut.deleteLocalVideoGames(68151);
      expect(response.isFailure, true);
      expect(response.exceptionOrNull(), const LocalDataSourceException(message: "failed to delete value"));
    });
  });
}
