// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i4;

import 'core/common/database/database_provider.dart' as _i3;
import 'core/data/client/http_api_client.dart' as _i5;
import 'core/data/datasources/how_long_beat_data_source.dart' as _i8;
import 'core/data/datasources/video_game_local_datasource.dart' as _i7;
import 'core/data/repositories/video_games_repository.dart' as _i9;
import 'presentation/details/cubits/details_video_game_cubit.dart' as _i14;
import 'presentation/details/usecases/get_video_game_details_use_case.dart'
    as _i11;
import 'presentation/favorites/cubits/favorite_video_games_cubit.dart' as _i15;
import 'presentation/favorites/usecases/get_local_video_games_use_case.dart'
    as _i10;
import 'presentation/favorites/usecases/insert_local_video_game_use_case.dart'
    as _i12;
import 'presentation/search/cubits/search_video_game_cubit.dart' as _i16;
import 'presentation/search/usecases/search_video_game_use_case.dart' as _i13;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.DatabaseProvider>(
      _i3.DatabaseProvider(isar: gh<_i4.Isar>()));
  gh.singleton<_i5.HttpApiClient>(_i5.HttpApiClient(dioClient: gh<_i6.Dio>()));
  gh.factory<_i7.VideoGameLocalDataSource>(() => _i7.VideoGameLocalDataSource(
      databaseProvider: gh<_i3.DatabaseProvider>()));
  gh.factory<_i8.HowLongBeatDataSourceImpl>(() =>
      _i8.HowLongBeatDataSourceImpl(httpApiClient: gh<_i5.HttpApiClient>()));
  gh.lazySingleton<_i9.VideoGamesRepository>(() => _i9.VideoGamesRepository(
        gh<_i8.HowLongBeatDataSourceImpl>(),
        gh<_i7.VideoGameLocalDataSource>(),
      ));
  gh.factory<_i10.GetLocalVideoGamesUseCase>(
      () => _i10.GetLocalVideoGamesUseCase(gh<_i9.VideoGamesRepository>()));
  gh.factory<_i11.GetVideoGameDetailsUseCase>(
      () => _i11.GetVideoGameDetailsUseCase(gh<_i9.VideoGamesRepository>()));
  gh.factory<_i12.InsertLocalVideoGameUseCase>(
      () => _i12.InsertLocalVideoGameUseCase(gh<_i9.VideoGamesRepository>()));
  gh.factory<_i13.SearchVideoGameUseCase>(
      () => _i13.SearchVideoGameUseCase(gh<_i9.VideoGamesRepository>()));
  gh.factory<_i14.DetailsVideoGameCubit>(
      () => _i14.DetailsVideoGameCubit(gh<_i11.GetVideoGameDetailsUseCase>()));
  gh.factory<_i15.FavoriteVideoGameCubit>(() => _i15.FavoriteVideoGameCubit(
        gh<_i10.GetLocalVideoGamesUseCase>(),
        gh<_i12.InsertLocalVideoGameUseCase>(),
      ));
  gh.factory<_i16.SearchVideoGameCubit>(
      () => _i16.SearchVideoGameCubit(gh<_i13.SearchVideoGameUseCase>()));
  return getIt;
}
