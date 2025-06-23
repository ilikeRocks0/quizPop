// lib/widgets/word_input_field.dart
import 'package:flutter/material.dart';

class WordInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;

  const WordInputField({super.key, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Word',
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
