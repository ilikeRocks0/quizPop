// lib/widgets/description_input_field.dart
import 'package:flutter/material.dart';

class DescriptionInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;

  const DescriptionInputField({super.key, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 4,
      decoration: const InputDecoration(
        labelText: 'Your Description / Context',
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
