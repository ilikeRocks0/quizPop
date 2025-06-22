// lib/widgets/word_input_field.dart
import 'package:flutter/material.dart';

class WordInputField extends StatelessWidget {
  final TextEditingController controller;

  const WordInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Word',
        border: OutlineInputBorder(),
      ),
      validator: (value) =>
          value == null || value.trim().isEmpty ? 'Enter a word' : null,
    );
  }
}
