import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';
import 'package:flutter_application_2/presentation/screens/word_detail_screen.dart';
import 'package:flutter_application_2/presentation/widgets/word_display/word_display.dart';
import 'package:flutter_application_2/presentation/widgets/word_display/word_display_controller.dart';

class WordDisplayDescriptorFactory
{
  final WordDisplayController wordDisplayController;
  final Word word;

  WordDisplayDescriptorFactory({required this.wordDisplayController, required this.word});

  PageDescriptor getPage()
  {
    return PageDescriptor(
        label: 'Display Words',
        icon: Icons.display_settings,
        screen: WordDetailScreen(
          word: word,
          wordDisplay: WordDisplay(controller: wordDisplayController, word: word),
        ),
      );
  }
}