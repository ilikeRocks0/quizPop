import 'package:flutter/material.dart';
import 'package:flutter_application_2/body.dart';
import 'package:flutter_application_2/body_controller.dart';
import 'package:flutter_application_2/bottom_nav_bar_factory.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/persistence/word_repository_wordPref.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/myApp.dart';
import 'package:flutter_application_2/presentation/navigation_manager.dart';
import 'package:flutter_application_2/presentation/pages/pageFactories/add_word_page_descriptor_factory.dart';
import 'package:flutter_application_2/presentation/pages/page_factory.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form_controller.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form_controller_factory.dart';

void main() {
    final wordRepository = SharedPrefsWordRepository();
    final wordManager = WordManager(wordRepository);
    final wordListManager = WordListManager(wordRepository);
    final wordEditorManager = WordEditorManager(wordRepository);
    const modalManager = ModalManager(); 



    //setting up body
    WordFormController wordFormController = WordFormControllerFactory(modalManager, wordManager).buildController();
    BodyController bodyController = BodyController(AddWordPageDescriptorFactory(wordFormController: wordFormController).getPage().screen);
    Body body = Body(contentNotifier: bodyController.contentNotifier);

    NavigationManager navigationManager = NavigationManager(bodyController: bodyController);

    final pageFactory = PageFactory(wordManager: wordManager, wordEditorManager: wordEditorManager, wordListManager: wordListManager, modalManager: modalManager, navigationManager: navigationManager);
    final pages = pageFactory.buildPages();

    BottomNavBarFactory bottomNavBarFactory = BottomNavBarFactory(pages: pages, navigationManager: navigationManager);
  

    runApp(MyApp(body: body, bottomNavBarFactory: bottomNavBarFactory,));
}
