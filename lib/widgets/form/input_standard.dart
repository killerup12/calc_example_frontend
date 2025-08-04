import 'package:calc_example_frontend/core/validators.dart';
import 'package:flutter/material.dart';

class InputStandard extends StatelessWidget {
  const InputStandard({this.label, this.controller, this.required = false, super.key});

  final String? label;
  final TextEditingController? controller;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: required ? Validators.emptyValidator : null,
    );
  }
}
