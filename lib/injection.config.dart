// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/cubit/video_game_cubit.dart' as _i8;
import 'core/data/client/http_api_client.dart' as _i3;
import 'core/data/datasources/how_long_beat_data_source.dart' as _i5;
import 'core/data/repositories/video_games_repository.dart' as _i6;
import 'core/usecase/search_video_game_cubit.dart' as _i7;

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
  gh.singleton<_i3.HttpApiClient>(_i3.HttpApiClient(dioClient: gh<_i4.Dio>()));
  gh.factory<_i5.HowLongBeatDataSourceImpl>(() =>
      _i5.HowLongBeatDataSourceImpl(httpApiClient: gh<_i3.HttpApiClient>()));
  gh.lazySingleton<_i6.VideoGamesRepository>(
      () => _i6.VideoGamesRepository(gh<_i5.HowLongBeatDataSourceImpl>()));
  gh.factory<_i7.SearchVideoGameUseCase>(
      () => _i7.SearchVideoGameUseCase(gh<_i6.VideoGamesRepository>()));
  gh.factory<_i8.VideoGameCubit>(
      () => _i8.VideoGameCubit(gh<_i7.SearchVideoGameUseCase>()));
  return getIt;
}
