import 'package:flutter/material.dart';

class InputMultiline extends StatelessWidget {
  const InputMultiline({this.label, this.controller, super.key});

  final String? label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 5,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
    );
  }
}
