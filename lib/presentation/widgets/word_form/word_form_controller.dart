// lib/controllers/add_word_controller.dart

import 'package:flutter/material.dart';

class WordFormController {
  final wordController = TextEditingController();
  final descriptionController = TextEditingController();

  void clearFields() {
    wordController.clear();
    descriptionController.clear();
  }

  void dispose() {
    wordController.dispose();
    descriptionController.dispose();
  }
}
