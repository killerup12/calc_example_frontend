import 'package:flutter/material.dart';

class InputStandard extends StatelessWidget {
  const InputStandard({this.label, this.controller, super.key});

  final String? label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }
}
