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

import 'core/data/client/http_api_client.dart' as _i3;
import 'core/data/datasources/how_long_beat_data_source.dart' as _i5;
import 'core/data/repositories/video_games_repository.dart' as _i6;
import 'presentation/details/cubits/details_video_game_cubit.dart' as _i9;
import 'presentation/details/usecases/get_video_game_details_use_case.dart'
    as _i7;
import 'presentation/search/cubits/search_video_game_cubit.dart' as _i10;
import 'presentation/search/usecases/search_video_game_use_case.dart' as _i8;

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
  gh.factory<_i7.GetVideoGameDetailsUseCase>(
      () => _i7.GetVideoGameDetailsUseCase(gh<_i6.VideoGamesRepository>()));
  gh.factory<_i8.SearchVideoGameUseCase>(
      () => _i8.SearchVideoGameUseCase(gh<_i6.VideoGamesRepository>()));
  gh.factory<_i9.DetailsVideoGameCubit>(
      () => _i9.DetailsVideoGameCubit(gh<_i7.GetVideoGameDetailsUseCase>()));
  gh.factory<_i10.SearchVideoGameCubit>(
      () => _i10.SearchVideoGameCubit(gh<_i8.SearchVideoGameUseCase>()));
  return getIt;
}
