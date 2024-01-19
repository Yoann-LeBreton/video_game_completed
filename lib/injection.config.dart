// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i4;

import 'core/data/database_provider.dart' as _i3;
import 'core/data/datasources/http_api_client.dart' as _i5;
import 'features/common/data/datasources/how_long_beat_data_source_impl.dart'
    as _i9;
import 'features/common/data/datasources/video_game_local_data_source.dart'
    as _i7;
import 'features/common/data/repositories/video_games_repository_impl.dart'
    as _i11;
import 'features/common/domain/datasources/how_long_beat_data_source.dart'
    as _i8;
import 'features/common/domain/repositories/video_games_repository.dart'
    as _i10;
import 'features/details/cubits/details_video_game_cubit.dart' as _i17;
import 'features/details/usecases/get_video_game_details_use_case.dart' as _i14;
import 'features/favorites/cubits/favorite_video_games_cubit.dart' as _i18;
import 'features/favorites/usecases/delete_local_video_game_use_case.dart'
    as _i12;
import 'features/favorites/usecases/get_local_video_games_use_case.dart'
    as _i13;
import 'features/favorites/usecases/insert_local_video_game_use_case.dart'
    as _i15;
import 'features/search/cubits/search_video_game_cubit.dart' as _i19;
import 'features/search/usecases/search_video_game_use_case.dart' as _i16;

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
  gh.lazySingleton<_i8.HowLongBeatDataSource>(() =>
      _i9.HowLongBeatDataSourceImpl(httpApiClient: gh<_i5.HttpApiClient>()));
  gh.lazySingleton<_i10.VideoGamesRepository>(
      () => _i11.VideoGamesRepositoryImpl(
            gh<_i8.HowLongBeatDataSource>(),
            gh<_i7.VideoGameLocalDataSource>(),
          ));
  gh.lazySingleton<_i12.DeleteLocalVideoGameUseCase>(
      () => _i12.DeleteLocalVideoGameUseCase(gh<_i10.VideoGamesRepository>()));
  gh.lazySingleton<_i13.GetLocalVideoGamesUseCase>(
      () => _i13.GetLocalVideoGamesUseCase(gh<_i10.VideoGamesRepository>()));
  gh.lazySingleton<_i14.GetVideoGameDetailsUseCase>(
      () => _i14.GetVideoGameDetailsUseCase(gh<_i10.VideoGamesRepository>()));
  gh.lazySingleton<_i15.InsertLocalVideoGameUseCase>(
      () => _i15.InsertLocalVideoGameUseCase(gh<_i10.VideoGamesRepository>()));
  gh.lazySingleton<_i16.SearchVideoGameUseCase>(
      () => _i16.SearchVideoGameUseCase(gh<_i10.VideoGamesRepository>()));
  gh.factory<_i17.DetailsVideoGameCubit>(
      () => _i17.DetailsVideoGameCubit(gh<_i14.GetVideoGameDetailsUseCase>()));
  gh.factory<_i18.FavoriteVideoGameCubit>(() => _i18.FavoriteVideoGameCubit(
        gh<_i13.GetLocalVideoGamesUseCase>(),
        gh<_i15.InsertLocalVideoGameUseCase>(),
        gh<_i12.DeleteLocalVideoGameUseCase>(),
      ));
  gh.factory<_i19.SearchVideoGameCubit>(
      () => _i19.SearchVideoGameCubit(gh<_i16.SearchVideoGameUseCase>()));
  return getIt;
}
