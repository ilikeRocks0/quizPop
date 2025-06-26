// lib/screens/page_factory.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/navigation/view_words_controller_factory.dart';
import '../../logic/word_manager.dart';
import '../../logic/word_list_manager.dart';
import '../modal_manager.dart';
import '../add_word_screen.dart';
import '../view_words_screens.dart';
import 'page_descriptor.dart';

class PageFactory 
{
  final WordManager wordManager;
  final WordListManager wordListManager;
  final ModalManager modalManager;
  

  PageFactory({required this.wordManager, required this.wordListManager, required this.modalManager,});

  List<PageDescriptor> buildPages() {
    //we will move these later, each page will get its own factory
    
    final viewWordsController = ViewWordsControllerFactory(wordListManager).buildController();

    return [
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
          controller: viewWordsController,
        ),
      ),
    ];
  }
}
