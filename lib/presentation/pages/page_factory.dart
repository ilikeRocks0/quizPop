//makes the main pages for the bottom navigation bar


import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/notification_manager/word_notification_manager.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/presentation/navigation_manager.dart';
import 'package:flutter_application_2/presentation/pages/pageFactories/add_word_page_descriptor_factory.dart';
import 'package:flutter_application_2/presentation/pages/pageFactories/settings_screen_page_descriptor_factory.dart';
import 'package:flutter_application_2/presentation/pages/pageFactories/view_words_page_descriptor_factory.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form_controller.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/view_words_controller.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/view_words_controller_factory.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form_controller_factory.dart';
import '../../logic/word_manager.dart';
import '../../logic/word_list_manager.dart';
import '../modal_manager.dart';
import 'page_descriptor.dart';

class PageFactory 
{
  final WordManager wordManager;
  final WordListManager wordListManager;
  final ModalManager modalManager;
  final WordEditorManager wordEditorManager;
  final NavigationManager navigationManager;
  final WordNotificationManager notificationManager;

  PageFactory({required this.wordManager, required this.navigationManager, required this.wordEditorManager, required this.wordListManager, required this.modalManager, required this.notificationManager});

  List<PageDescriptor> buildPages() {

    List<PageDescriptor> pages = [];



    //we will move these later, each page will get its own factory
    final WordFormController wordFormController = WordFormControllerFactory(modalManager, wordManager).buildController();
    final ViewWordsController viewWordsController = ViewWordsControllerFactory(wordListManager, navigationManager, wordEditorManager, wordManager, modalManager ).buildController();



    //page construction
    final PageDescriptor settingsPageDescriptor = SettingsScreenPageDescriptorFactory(notificationManager).getPage();
    final PageDescriptor addWordPageDescriptor = AddWordPageDescriptorFactory(wordFormController: wordFormController).getPage();
    final PageDescriptor viewWordsPageDescriptor = ViewWordsPageDescriptorFactory(viewWordsController: viewWordsController).getPage();
    


    pages.add(addWordPageDescriptor);
    pages.add(viewWordsPageDescriptor);
    pages.add(settingsPageDescriptor);



    return pages;
  }
}
