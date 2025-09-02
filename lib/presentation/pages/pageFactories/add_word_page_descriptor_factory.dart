import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/pages.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';
import 'package:flutter_application_2/presentation/screens/add_word_screen.dart';

class AddWordPageDescriptorFactory
{
  final AddWordScreen addWordScreen;

  AddWordPageDescriptorFactory({required this.addWordScreen});

  PageDescriptor getPage()
  {
    return PageDescriptor(
        label: 'Add Word',
        icon: Icons.add,
        screen: addWordScreen,
        id: Pages.addWord
      );
  }
}