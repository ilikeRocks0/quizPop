// lib/screens/add_word_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/presentation/widgets/word_form.dart';

class AddWordScreen extends StatelessWidget {
  final WordManager wordManager;

  const AddWordScreen({super.key, required this.wordManager});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Word')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: WordForm(wordManager: wordManager,),
      ),
    );
  }
}
