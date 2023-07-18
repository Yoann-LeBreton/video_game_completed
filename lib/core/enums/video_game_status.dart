import 'package:video_game_completed/core/constants/text_constants.dart';

enum VideoGameStatus{
  started,
  finished,
  wishlisted,
  abandoned;

  String get title {
    switch(this){
      case started:
        return TextConstants.statusStartedTitle;
      case finished:
        return TextConstants.statusFinishedTitle;
      case wishlisted:
        return TextConstants.statusWishlistedTitle;
      case abandoned:
        return TextConstants.statusAbandonedTitle;
    }
  }
}