import 'package:flutter/material.dart';

import '../../core/validators.dart';

class InputMultiline extends StatelessWidget {
  const InputMultiline({this.label, this.controller, this.required = false, super.key});

  final String? label;
  final TextEditingController? controller;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: 5,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      validator: required ? Validators.emptyValidator : null,
    );
  }
}
