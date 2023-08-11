import 'package:flutter/material.dart';

class SelectFavoriteStatusDialog extends StatefulWidget {
  const SelectFavoriteStatusDialog({super.key, required this.platforms});

  final List<String> platforms;

  @override
  State<StatefulWidget> createState() => _SelectFavoriteStatusDialog();
}

class _SelectFavoriteStatusDialog extends State<SelectFavoriteStatusDialog> {
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
                minWidth: constraints.minWidth,
                maxWidth: constraints.maxHeight,
              ),
              child: Column(
                children: [
                  Text("test")
                ],
              ),
            ),
          );
        });
      }),
    );
  }
}
