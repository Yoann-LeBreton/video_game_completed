import 'package:flutter/material.dart';
import 'package:video_game_completed/core/enums/video_game_status.dart';

class SelectFavoriteStatusDialog extends StatefulWidget {
  const SelectFavoriteStatusDialog(
      {super.key,
      required this.platforms,
      required this.onValid,
      required this.onCancel});

  final List<String> platforms;
  final Function(String platform, VideoGameStatus status) onValid;
  final VoidCallback onCancel;

  @override
  State<StatefulWidget> createState() => _SelectFavoriteStatusDialog();
}

class _SelectFavoriteStatusDialog extends State<SelectFavoriteStatusDialog> {
  int? _platformSelect;
  int? _statusSelect;

  @override
  Widget build(BuildContext context) {
    final RoundedRectangleBorder c12 =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
    return Dialog(
      shape: ShapeBorder.lerp(c12, c12, 1),
      child: Builder(builder: (context) {
        return LayoutBuilder(builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.minWidth, maxHeight: 550),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Select a platform :'),
                  platformsChoices(),
                  Text('Select a status :'),
                  ...statusChoices(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: Text('Cancel'),
                          onPressed: () => widget.onCancel(),
                        ),
                        ElevatedButton(
                          child: Text('OK'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                          ),
                          onPressed:
                              (_platformSelect == null || _statusSelect == null)
                                  ? null
                                  : () {
                                      widget.onValid(
                                        widget.platforms[_platformSelect!],
                                        VideoGameStatus.values[_statusSelect!],
                                      );
                                    },
                        ),
                      ]),
                ],
              ),
            ),
          );
        });
      }),
    );
  }

  Widget platformsChoices() {
    if (widget.platforms.isNotEmpty) {
      return Wrap(
          children: List<Widget>.generate(
        widget.platforms.length,
        (index) => ChoiceChip(
          label: Text(widget.platforms[index]),
          selected: index == _platformSelect,
          onSelected: (bool isSelected) {
            setState(() {
              _platformSelect = isSelected ? index : null;
            });
          },
        ),
      ));
    } else {
      return Container();
    }
  }

  List<Widget> statusChoices() {
    return List<Widget>.generate(
      VideoGameStatus.values.length,
      (int index) => ChoiceChip(
        label: Row(
          children: [
            Icon(VideoGameStatus.values[index].icon),
            const SizedBox(width: 4),
            Text(VideoGameStatus.values[index].title),
          ],
        ),
        selected: index == _statusSelect,
        onSelected: (bool isSelected) {
          setState(() {
            _statusSelect = isSelected ? index : null;
          });
        },
      ),
    );
  }
}
