import 'package:isar/isar.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';

part 'video_game_db.g.dart';

@collection
class VideoGameDb {
  VideoGameDb({
    required this.remoteId,
    required this.name,
    required this.imageName,
    required this.releaseYear,
    this.platformSelected,
    required this.status,
  });

  @Name("remote_id")
  Id remoteId;

  @Index(type: IndexType.value)
  String name;

  String imageName;

  int releaseYear;

  String? platformSelected;

  @enumerated
  VideoGameStatus status;
}
