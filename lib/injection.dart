
import 'package:dio/dio.dart';

import 'injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initGetIt',
  preferRelativeImports: true,
  asExtension: false
)
void configureDependencies() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  initGetIt(getIt);
}