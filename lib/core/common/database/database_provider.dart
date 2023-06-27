import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:video_game_completed/core/data/models/db/video_game_db.dart';

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

  void insert(VoidCallback action) {
    _isar.writeTxn(() async {
      action;
    });
  }
}
