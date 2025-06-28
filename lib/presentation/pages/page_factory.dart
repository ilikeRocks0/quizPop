// lib/screens/page_factory.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/view_words_controller_factory.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form_controller_factory.dart';
import '../../logic/word_manager.dart';
import '../../logic/word_list_manager.dart';
import '../modal_manager.dart';
import '../screens/add_word_screen.dart';
import '../screens/view_words_screens.dart';
import 'page_descriptor.dart';

class PageFactory 
{
  final WordManager wordManager;
  final WordListManager wordListManager;
  final ModalManager modalManager;
  final WordEditorManager wordEditorManager;
  

  PageFactory({required this.wordManager, required this.wordEditorManager, required this.wordListManager, required this.modalManager,});

  List<PageDescriptor> buildPages() {
    //we will move these later, each page will get its own factory
    final wordFormController = WordFormControllerFactory(modalManager, wordManager).buildController();
    final viewWordsController = ViewWordsControllerFactory(wordListManager, wordEditorManager, wordManager, modalManager ).buildController();

    return [
      PageDescriptor(
        label: 'Add Word',
        icon: Icons.add,
        screen: AddWordScreen(
          wordFormController: wordFormController,
        ),
      ),
      PageDescriptor(
        label: 'View Words',
        icon: Icons.list,
        screen: ViewWordsScreen(
          controller: viewWordsController,
        ),
      ),
    ];
  }
}
