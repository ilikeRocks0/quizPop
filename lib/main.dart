import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/persistence/word_repository_hash.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/myApp.dart';
import 'package:flutter_application_2/presentation/pages/page_factory.dart';

void main() {
    final wordRepository = WordRepositoryHash();
    final wordManager = WordManager(wordRepository);
    final wordListManager = WordListManager(wordRepository);
    final wordEditorManager = WordEditorManager(wordRepository);
    const modalManager = ModalManager(); 

    final pageFactory = PageFactory(wordManager: wordManager, wordEditorManager: wordEditorManager, wordListManager: wordListManager, modalManager: modalManager);

    final pages = pageFactory.buildPages();
  

    runApp(MyApp(pages: pages));
}
