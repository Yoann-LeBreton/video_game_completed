import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:video_game_completed/core/domain/entities/future_callback.dart';
import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';

@singleton
class DatabaseProvider {
  DatabaseProvider({required Isar isar}) : _isar = isar;

  final Isar _isar;

  IsarCollection<VideoGameDb> getVideoGameDB() {
    return _isar.videoGameDbs;
  }

  Isar getIsar(){
    return _isar;
  }

  Future edit(FutureCallback action) async {
    await _isar.writeTxn(() async {
      await action.call();
    });
  }
}
