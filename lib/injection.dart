import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'core/data/models/db/video_game_db.dart';
import 'injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'initGetIt',
    preferRelativeImports: true,
    asExtension: false)
Future<void> configureDependencies() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  await _initDatabase();
  initGetIt(getIt);
}

Future<void> _initDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  var isar = await Isar.open(
    <CollectionSchema<dynamic>>[VideoGameDbSchema],
    directory: dir.path,
    name: 'app_db',
  );
  getIt.registerLazySingleton<Isar>(() => isar);
}
