// lib/presentation/widgets/word_form/word_form_controller.dart


import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/objects/word.dart';
import '../../../logic/word_manager.dart';
import '../../modal_manager.dart';

class WordDisplayController {
  final formKey = GlobalKey<FormState>();
  final wordController = TextEditingController();
  final descriptionController = TextEditingController();

  final WordEditorManager wordEditorManager;
  final ModalManager modalManager;
  final WordManager wordManager;
  Word? word;
  bool isEditing = false;

  WordDisplayController({
    required this.wordEditorManager,
    required this.wordManager,
    required this.modalManager,
  });


  //sets everything up
  void init(Word word)
  {
    this.word = word;
    isEditing = false;
  }

  String? validateWord(String? value) => wordManager.validateWord(value);
  String? validateDescription(String? value) => wordManager.validateDescription(value);

  Future<bool> handleSave(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return false;

    final confirmed = await modalManager.showConfirmation(context: context);
    if (!confirmed) return false;

    Word newWord = Word(word: wordController.text, description: descriptionController.text);
    await wordEditorManager.updateWord(
      oldWord: word!,
      newWord: newWord,
    );


    word = newWord;


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

  void toggleEdit() 
  {
    isEditing = true;
  }
}
