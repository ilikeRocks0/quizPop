
import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'package:flutter_application_2/presentation/navigation_manager.dart';
import 'package:flutter_application_2/presentation/pages/word_display_descriptor_factory.dart';
import 'package:flutter_application_2/presentation/widgets/word_display/word_display_controller.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/view_words_controller.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/word_list_view_factory.dart';



class ViewWordsControllerFactory
{
  final WordListManager wordListManager;
  final WordEditorManager wordEditorManager;
  final WordManager wordManager;
  final ModalManager modalManager;
  final NavigationManager navigationManager;

  ViewWordsControllerFactory(this.wordListManager, this.navigationManager, this.wordEditorManager, this.wordManager, this.modalManager);


  ViewWordsController buildController()
  {

    WordDisplayController wordDisplayController = WordDisplayController(wordEditorManager: wordEditorManager, wordManager: wordManager, modalManager: modalManager);

    //when you click the widget go to the word detail screen
    descriptionPage(BuildContext context, Word word) => 
    {
      navigationManager.setPage(WordDisplayDescriptorFactory(wordDisplayController: wordDisplayController, word: word).getPage())
    };


    final wordListViewFactory = WordListViewFactory(onTapNavigateTo: descriptionPage);
    return ViewWordsController(wordListManager: wordListManager, wordListViewFactory: wordListViewFactory);
  }
}
