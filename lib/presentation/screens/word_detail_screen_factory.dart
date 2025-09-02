//to keep reconstructing the screen
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'package:flutter_application_2/presentation/screens/word_detail_screen.dart';
import 'package:flutter_application_2/presentation/widgets/word_display/word_display.dart';
import 'package:flutter_application_2/presentation/widgets/word_display/word_display_controller.dart';

class WordDetailScreenFactory 
{
  final WordDisplayController controller;

  WordDetailScreenFactory(this.controller);

  Widget createScreen(Word word) 
  {
    final wordDisplay = WordDisplay(word: word, controller: controller,);
    return WordDetailScreen(wordDisplay: wordDisplay);
  }
}