// lib/controllers/view_words_controller.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/word_list_view_factory.dart';

class ViewWordsController {
  final WordListManager wordListManager;
  final WordListViewFactory wordListViewFactory;

  ViewWordsController({required this.wordListManager, required this.wordListViewFactory});

  Future<Widget> buildWordList(BuildContext context) async 
  {
    try 
    {
      final words = await wordListManager.fetchAllWords();

      if (words.isEmpty) 
      {
        return wordListViewFactory.buildEmpty();
      }

      return wordListViewFactory.buildListView(words: words);
    } catch (e) 
    {
      return wordListViewFactory.buildError(e.toString());
    }
  }
}
