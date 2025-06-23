import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/presentation/main_shell.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/presentation/page_descriptor.dart';

//starts up app
class MyApp extends StatelessWidget {
  final WordManager wordManager;
  final ModalManager modalManager;
  final WordListManager wordListManager;
  final WordEditorManager wordEditorManager;
  final List<PageDescriptor> pages;
  
  const MyApp({super.key, required this.wordManager, required this.modalManager, required this.wordListManager, required this.wordEditorManager, required this.pages});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainShell(pages: pages),
    );
  }
}
