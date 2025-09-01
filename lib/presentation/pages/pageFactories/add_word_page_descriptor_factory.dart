import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';
import 'package:flutter_application_2/presentation/screens/add_word_screen.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form_controller.dart';

class AddWordPageDescriptorFactory
{
  final WordFormController wordFormController;

  AddWordPageDescriptorFactory({required this.wordFormController});

  PageDescriptor getPage()
  {
    return PageDescriptor(
        label: 'Add Word',
        icon: Icons.add,
        screen: AddWordScreen(
          wordFormController: wordFormController,
        ),
      );
  }
}