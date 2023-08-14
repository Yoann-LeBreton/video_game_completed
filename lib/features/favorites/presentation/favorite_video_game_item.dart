import 'package:flutter/material.dart';
import 'package:video_game_completed/core/constants/url_constants.dart';
import 'package:video_game_completed/features/common/domain/entities/video_game_db.dart';
import 'package:video_game_completed/features/search/data/models/video_game_short_model.dart';

class FavoriteVideoGameItem extends StatelessWidget {
  const FavoriteVideoGameItem(
      {super.key, required this.item, required this.onTap});

  final VideoGameDb item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Row(children: [
              Icon(item.status.icon),
              const SizedBox(
                width: 4,
              ),
              Text(item.name!)
            ]),
            subtitle: Text('${item.releaseYear} - ${item.platformSelected}'),
            onTap: onTap,
            trailing: SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                '${UrlConstants.howLongBeatBaseUrl}${UrlConstants.howLongBeatGameDetailPath}/${item.imageName}?width=100',
                fit: BoxFit.fitHeight,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            )));
  }
}
