import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  IconData get icon {
    switch(this){
      case started:
        return Icons.play_circle_outline;
      case finished:
        return Icons.check_circle;
      case wishlisted:
        return Icons.remove_red_eye_rounded;
      case abandoned:
        return Icons.block;
    }
  }
}