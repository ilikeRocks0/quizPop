// lib/controllers/add_word_controller.dart

import 'package:flutter/material.dart';
import '../objects/word.dart';

class AddWordController {
  final wordController = TextEditingController();
  final descriptionController = TextEditingController();

  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }

  Word createWord() {
    return Word(
      word: wordController.text.trim(),
      description: descriptionController.text.trim(),
    );
  }

  void clearFields() {
    wordController.clear();
    descriptionController.clear();
  }

  void dispose() {
    wordController.dispose();
    descriptionController.dispose();
  }
}
