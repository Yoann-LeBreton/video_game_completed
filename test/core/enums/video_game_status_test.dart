import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_game_completed/core/constants/text_constants.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';

void main(){
  group('VideoGameStatus get title', () {
    test('test VideoGameStatus methods when type is VideoGameStatus.started', () async {
      const VideoGameStatus status = VideoGameStatus.started;
      final title = status.title;
      expect(title, TextConstants.statusStartedTitle);
    });

    test('test VideoGameStatus methods when type is VideoGameStatus.finished', () async {
      const VideoGameStatus status = VideoGameStatus.finished;
      final title = status.title;
      expect(title, TextConstants.statusFinishedTitle);
    });

    test('test VideoGameStatus methods when type is VideoGameStatus.wishlisted', () async {
      const VideoGameStatus status = VideoGameStatus.wishlisted;
      final title = status.title;
      expect(title, TextConstants.statusWishlistedTitle);
    });

    test('test VideoGameStatus methods when type is VideoGameStatus.abandoned', () async {
      const VideoGameStatus status = VideoGameStatus.abandoned;
      final title = status.title;
      expect(title, TextConstants.statusAbandonedTitle);
    });
  });

  group('VideoGameStatus get icon', () {
    test('test VideoGameStatus methods when type is VideoGameStatus.started', () async {
      const VideoGameStatus status = VideoGameStatus.started;
      final title = status.icon;
      expect(title, Icons.play_circle_outline);
    });

    test('test VideoGameStatus methods when type is VideoGameStatus.finished', () async {
      const VideoGameStatus status = VideoGameStatus.finished;
      final title = status.icon;
      expect(title, Icons.check_circle);
    });

    test('test VideoGameStatus methods when type is VideoGameStatus.wishlisted', () async {
      const VideoGameStatus status = VideoGameStatus.wishlisted;
      final title = status.icon;
      expect(title, Icons.remove_red_eye_rounded);
    });

    test('test VideoGameStatus methods when type is VideoGameStatus.abandoned', () async {
      const VideoGameStatus status = VideoGameStatus.abandoned;
      final title = status.icon;
      expect(title, Icons.block);
    });
  });
}