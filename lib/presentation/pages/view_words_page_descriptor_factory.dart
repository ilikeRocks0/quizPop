import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';
import 'package:flutter_application_2/presentation/screens/view_words_screens.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/view_words_controller.dart';

class ViewWordsPageDescriptorFactory
{
  final ViewWordsController viewWordsController;

  ViewWordsPageDescriptorFactory({required this.viewWordsController});

  PageDescriptor getPage()
  {
    return PageDescriptor(
        label: 'View Words',
        icon: Icons.list,
        screen: ViewWordsScreen(
          controller: viewWordsController,
        ),
      );
  }
}