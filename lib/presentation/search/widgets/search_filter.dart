import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter(
      {super.key,
      required this.title,
      required this.selected,
      required this.items,
      required this.onChange,
      required this.enable
      });

  final String title;
  final String selected;
  final List<String> items;
  final Function(String? value) onChange;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.amber.shade200,
            border: Border.all(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(6)),
        child: Row(children: [
          Text(title),
          DropdownButton<String>(
              enableFeedback: enable,
              icon: const Icon(Icons.filter_list),
              value: selected,
              underline: Container(),
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (String? value) => onChange(value)
          )
        ]));
  }
}
