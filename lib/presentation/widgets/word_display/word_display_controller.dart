// lib/presentation/widgets/word_form/word_form_controller.dart


import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/objects/word.dart';
import '../../../logic/word_manager.dart';
import '../../../logic/navigation/modal_manager.dart';

class WordDisplayController {
  final formKey = GlobalKey<FormState>();
  final wordController = TextEditingController();
  final descriptionController = TextEditingController();

  final WordEditorManager wordEditorManager;
  final ModalManager modalManager;
  final WordManager wordManager;
  
  //optional
  
  VoidCallback? afterDelete;
  Word? word;
  bool isEditing = false;

  WordDisplayController({
    required this.wordEditorManager,
    required this.wordManager,
    required this.modalManager,
    this.afterDelete
  });


  //sets everything up
  void init(Word word)
  {
    this.word = word;
    isEditing = false;
  }

  String? validateWord(String? value) => wordManager.validateWord(value);
  String? validateDescription(String? value) => wordManager.validateDescription(value);

  Future<Word?> handleEdit(BuildContext context, String newWord, String newDescription) async {
    if (!(formKey.currentState?.validate() ?? false)) return null;

    final confirmed = await modalManager.showConfirmation(context: context);
    if (!confirmed) return word;
    
    Word? updateWord = await wordEditorManager.updateWord(index: word!.index, newWord: newWord, newDescription: newDescription,);


    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Word saved!')),
    );

    clearFields();
    return updateWord;
  }

  Future<void> handleDelete(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final confirmed = await modalManager.showConfirmation(context: context);
    if (!confirmed) return;
    
    // delete the word
    await wordEditorManager.deleteWord(word!.index);


    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Word deleted!')),
    );

    clearFields();

    //if not null invoke it
    afterDelete!();
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
