
import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/view_words_controller.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/word_list_view_factory.dart';
import 'package:flutter_application_2/presentation/word_detail_screen.dart';



class ViewWordsControllerFactory
{
  WordListManager wordListManager;


  ViewWordsControllerFactory(this.wordListManager);


  ViewWordsController buildController()
  {

    //when you click the widget go to the word detail screen
    descriptionPage(BuildContext context, Word word) => 
    {
      Navigator.of(context).push
      (
        MaterialPageRoute(builder: (_) => WordDetailScreen(word: word),)
      )
    };


    final wordListViewFactory = WordListViewFactory(onTapNavigateTo: descriptionPage);
    return ViewWordsController(wordListManager: wordListManager, wordListViewFactory: wordListViewFactory);
  }
}
