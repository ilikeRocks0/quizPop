import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/persistence/word_repository_hash.dart';
import 'package:flutter_application_2/presentation/add_word_screen.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/myApp.dart';
import 'package:flutter_application_2/presentation/page_descriptor.dart';
import 'package:flutter_application_2/presentation/view_words_screens.dart';

void main() {
    final wordRepository = WordRepositoryHash();
    final wordManager = WordManager(wordRepository);
    final wordListManager = WordListManager(wordRepository);
    final wordEditorManager = WordEditorManager(wordRepository);
    const modalManager = ModalManager(); 

    final pages = [
    PageDescriptor(
      label: 'Add Word',
      icon: Icons.add,
      screen: AddWordScreen(
        wordManager: wordManager,
        modalManager: modalManager,
      ),
    ),
    PageDescriptor(
      label: 'View Words',
      icon: Icons.list,
      screen: ViewWordsScreen(
        wordListManager: wordListManager,
      ),
    ),
  ];
  

    runApp(MyApp(wordManager: wordManager,wordListManager: wordListManager, modalManager: modalManager, wordEditorManager: wordEditorManager, pages: pages));
}
