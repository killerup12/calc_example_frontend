import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/validators.dart';

class InputDouble extends StatelessWidget {
  const InputDouble({this.label, this.controller, this.required = false, super.key});

  final String? label;
  final TextEditingController? controller;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
      decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      validator: required ? Validators.emptyValidator : null,
    );
  }
}
