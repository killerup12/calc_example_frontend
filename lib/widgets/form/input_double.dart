import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputDouble extends StatelessWidget {
  const InputDouble({this.label, this.controller, super.key});

  final String? label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
      decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
    );
  }
}
