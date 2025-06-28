
import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'package:flutter_application_2/presentation/widgets/word_display/word_display.dart';
import 'package:flutter_application_2/presentation/widgets/word_display/word_display_controller.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/view_words_controller.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/word_list_view_factory.dart';
import 'package:flutter_application_2/presentation/screens/word_detail_screen.dart';



class ViewWordsControllerFactory
{
  final WordListManager wordListManager;
  final WordEditorManager wordEditorManager;
  final WordManager wordManager;
  final ModalManager modalManager;

  ViewWordsControllerFactory(this.wordListManager, this.wordEditorManager, this.wordManager, this.modalManager);


  ViewWordsController buildController()
  {

    WordDisplayController wordDisplayController = WordDisplayController(wordEditorManager: wordEditorManager, wordManager: wordManager, modalManager: modalManager);

    //when you click the widget go to the word detail screen
    descriptionPage(BuildContext context, Word word) => 
    {
      Navigator.of(context).push
      (
        MaterialPageRoute(builder: (_) => WordDetailScreen(word: word, wordDisplay: WordDisplay(controller: wordDisplayController, word: word),),)
      )
    };


    final wordListViewFactory = WordListViewFactory(onTapNavigateTo: descriptionPage);
    return ViewWordsController(wordListManager: wordListManager, wordListViewFactory: wordListViewFactory);
  }
}
