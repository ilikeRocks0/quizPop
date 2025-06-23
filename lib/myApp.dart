import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/presentation/main_shell.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/presentation/add_word_screen.dart';

//starts up app
class MyApp extends StatelessWidget {
  final WordManager wordManager;
  final ModalManager modalManager;
  final WordListManager wordListManager;

  const MyApp({super.key, required this.wordManager, required this.modalManager, required this.wordListManager});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainShell(wordManager: wordManager, wordListManager: wordListManager, modalManager: modalManager,),
    );
  }
}
