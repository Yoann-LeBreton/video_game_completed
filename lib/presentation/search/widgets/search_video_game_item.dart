import 'package:flutter/material.dart';
import 'package:video_game_completed/core/data/models/video_game_short_model.dart';
import 'package:video_game_completed/core/utils/constants/url_constants.dart';

class SearchVideoGameItem extends StatelessWidget {
  const SearchVideoGameItem(
      {super.key, required this.item, required this.onTap});

  final VideoGameShortModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Text(item.name),
            subtitle: Text('${item.releaseYear} - ${item.platforms}'),
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
