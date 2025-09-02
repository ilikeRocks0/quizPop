import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/pages.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';
import 'package:flutter_application_2/presentation/screens/word_detail_screen.dart';

class WordDisplayDescriptorFactory
{
  final WordDetailScreen wordDetailScreen;

  WordDisplayDescriptorFactory({required this.wordDetailScreen});

  PageDescriptor getPage()
  {
    return PageDescriptor(
        label: 'Display Words',
        icon: Icons.display_settings,
        screen: wordDetailScreen, 
        id: Pages.displayWord
      );
  }
}