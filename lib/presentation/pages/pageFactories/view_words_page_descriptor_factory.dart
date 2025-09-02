import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/pages.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';
import 'package:flutter_application_2/presentation/screens/view_words_screens.dart';

class ViewWordsPageDescriptorFactory
{
  final ViewWordsScreen viewWordScreen;

  ViewWordsPageDescriptorFactory({required this.viewWordScreen});

  PageDescriptor getPage()
  {
    return PageDescriptor(
        label: 'View Words',
        icon: Icons.list,
        screen: viewWordScreen, 
        id: Pages.viewWords
      );
  }
}