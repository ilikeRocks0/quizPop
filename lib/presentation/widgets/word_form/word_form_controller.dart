// lib/presentation/widgets/word_form/word_form_controller.dart

import 'package:flutter/material.dart';
import '../../../logic/word_manager.dart';
import '../../modal_manager.dart';

class WordFormController {
  final formKey = GlobalKey<FormState>();
  final wordController = TextEditingController();
  final descriptionController = TextEditingController();

  final WordManager wordManager;
  final ModalManager modalManager;

  WordFormController({
    required this.wordManager,
    required this.modalManager,
  });

  String? validateWord(String? value) => wordManager.validateWord(value);
  String? validateDescription(String? value) => wordManager.validateDescription(value);

  Future<bool> handleSave(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return false;

    final confirmed = await modalManager.showConfirmation(context: context);
    if (!confirmed) return false;

    await wordManager.processAndSave(
      wordController.text,
      descriptionController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Word saved!')),
    );

    clearFields();
    return true;
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
