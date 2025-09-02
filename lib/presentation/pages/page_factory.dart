//makes the main pages for the bottom navigation bar


import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/notification_manager/word_notification_manager.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/objects/pages.dart';
import 'package:flutter_application_2/presentation/navigation_displayWord.dart';
import 'package:flutter_application_2/presentation/navigation_manager.dart';
import 'package:flutter_application_2/presentation/pages/pageFactories/add_word_page_descriptor_factory.dart';
import 'package:flutter_application_2/presentation/pages/pageFactories/settings_screen_page_descriptor_factory.dart';
import 'package:flutter_application_2/presentation/pages/pageFactories/view_words_page_descriptor_factory.dart';
import 'package:flutter_application_2/presentation/screens/add_word_screen.dart';
import 'package:flutter_application_2/presentation/screens/settings_screen.dart';
import 'package:flutter_application_2/presentation/screens/view_words_screens.dart';
import 'package:flutter_application_2/presentation/screens/word_detail_screen_factory.dart';
import 'package:flutter_application_2/presentation/widgets/word_display/word_display_controller.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form_controller.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/view_words_controller.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/word_list_view_factory.dart';
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
  final NavigationDisplayword navigationDisplayword;
  bool initialized = false;

  List<PageDescriptor> botPages = []; //for bottom navigation bar
  HashMap<Pages, Widget> registery = HashMap(); //for navigation system, for static pages
  late WordDetailScreenFactory wordDetailScreenFactory;

  PageFactory({
    required this.wordManager, 
    required this.navigationManager, 
    required this.wordEditorManager, 
    required this.wordListManager, 
    required this.modalManager, 
    required this.notificationManager,
    required this.navigationDisplayword
    });

  void buildPages() {

    //add word form doesnt need to be ordered
    final WordFormController wordFormController = WordFormController(modalManager: modalManager, wordManager: wordManager);
    final addWordScreen = AddWordScreen(wordFormController: wordFormController);

    //this has to be created first before word list
    final WordDisplayController wordDisplayController = WordDisplayController(wordEditorManager: wordEditorManager, wordManager: wordManager, modalManager: modalManager, afterDelete: () => navigationManager.setPage(Pages.viewWords));
    wordDetailScreenFactory = WordDetailScreenFactory(wordDisplayController); //lets us keep making this screen
    

    //to view the list of words
    final wordListViewFactory = WordListViewFactory(onTapNavigateTo: (context, word) => navigationDisplayword.setPage(word)); //to create the widgets
    final ViewWordsController viewWordsController = ViewWordsController(wordListManager: wordListManager, wordListViewFactory: wordListViewFactory);
    final viewWordScreen = ViewWordsScreen(controller: viewWordsController);

    //settings screen
    final SettingsScreen settingsScreen = SettingsScreen(notificationManager: notificationManager);

    //page construction
    final PageDescriptor settingsPageDescriptor = SettingsScreenPageDescriptorFactory(settingsScreen).getPage();
    final PageDescriptor addWordPageDescriptor = AddWordPageDescriptorFactory(addWordScreen: addWordScreen).getPage();
    final PageDescriptor viewWordsPageDescriptor = ViewWordsPageDescriptorFactory(viewWordScreen: viewWordScreen).getPage();
    


    botPages.add(addWordPageDescriptor);
    botPages.add(viewWordsPageDescriptor);
    botPages.add(settingsPageDescriptor);

    registery[Pages.addWord] = addWordPageDescriptor.screen;
    registery[Pages.viewWords] = viewWordsPageDescriptor.screen;
    registery[Pages.settings] = settingsPageDescriptor.screen;

    initialized = true;
  }

  List<PageDescriptor> getBottomPages()
  {
    if(initialized)
    {
      return botPages;
    }
    else
    {
      print("ERROR: trying to retrieve bottom pages before building pages");
    } 
    return [];
  }

  HashMap<Pages, Widget> getRegistry()
  {
    if(initialized)
    {
      return registery;
    }
    else
    {
      print("ERROR: trying to retrieve registery pages before building pages");
    } 
    return HashMap();
  }

  //for navigation display word
  WordDetailScreenFactory? getDisplayWordFactory()
  {
    if(initialized)
    {
      return wordDetailScreenFactory;
    }
    else
    {
      print("ERROR: trying to retrieve registery pages before building pages");
    } 
    return null; //should crash if it gets here
  }
}
