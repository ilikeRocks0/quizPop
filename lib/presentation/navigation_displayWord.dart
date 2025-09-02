

import 'package:flutter_application_2/body_controller.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'package:flutter_application_2/presentation/screens/word_detail_screen_factory.dart';

class NavigationDisplayword {
  final BodyController bodyController;
  late WordDetailScreenFactory displayWordPageFactory;

  NavigationDisplayword({required this.bodyController});

  void initPageFactory(WordDetailScreenFactory displayWordPageFactory)
  {
    this.displayWordPageFactory = displayWordPageFactory;
  }

  void setPage(Word word) 
  { 
    bodyController.changeBody(displayWordPageFactory.createScreen(word));
  }
}
