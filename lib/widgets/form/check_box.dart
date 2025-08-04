import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({required this.title, this.value, this.onChange, super.key});

  final String title;
  final bool? value;
  final void Function(bool? value)? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChange),
        Text(title),
      ],
    );
  }
}
