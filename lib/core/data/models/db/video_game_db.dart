import 'package:isar/isar.dart';

part 'video_game_db.g.dart';

@collection
class VideoGameDb{
  @Name("remote_id")
  Id? remoteId;

  @Index(type: IndexType.value)
  String? name;

  @enumerated
  VideoGameStatus status = VideoGameStatus.wishlisted;
}

enum VideoGameStatus{
  started,
  finished,
  wishlisted,
  abandoned
}