import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/presentation/add_word_screen.dart';

class MyApp extends StatelessWidget {
  final WordManager wordManager;
  final ModalManager modalManager;

  const MyApp({super.key, required this.wordManager, required this.modalManager});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddWordScreen(wordManager: wordManager, modalManager: modalManager,),
    );
  }
}
