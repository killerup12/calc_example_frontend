import 'package:flutter/material.dart';

class RadioList extends StatelessWidget {
  const RadioList({required this.title, required this.options, required this.value, this.onChanged, super.key});

  final String title;
  final List<String> options;
  final String value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        for (String option in options)
          ListTile(
            title: Text(option),
            leading: Radio<String>(value: option, groupValue: value, onChanged: onChanged),
          ),
      ],
    );
  }
}
