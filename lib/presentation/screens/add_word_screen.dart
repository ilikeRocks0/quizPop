// lib/screens/add_word_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form_controller.dart';

class AddWordScreen extends StatelessWidget {
  final WordFormController wordFormController;

  const AddWordScreen({super.key, required this.wordFormController});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Word')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: WordForm(controller: wordFormController,),
      ),
    );
  }
}
