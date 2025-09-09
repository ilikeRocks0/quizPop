import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/page_descriptor_config.dart';
import 'package:flutter_application_2/logic/navigation/screen_body/body.dart';
import 'package:flutter_application_2/logic/navigation/screen_body/body_controller.dart';
import 'package:flutter_application_2/logic/navigation/bottom_nav_bar_factory.dart';
import 'package:flutter_application_2/logic/notification_manager/local_notification_factory.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/objects/pages.dart';
import 'package:flutter_application_2/persistence/word_repository_wordPref.dart';
import 'package:flutter_application_2/logic/navigation/modal_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/logic/word_editor_manager.dart';
import 'package:flutter_application_2/myApp.dart';
import 'package:flutter_application_2/logic/navigation/navigation_displayWord.dart';
import 'package:flutter_application_2/logic/navigation/navigation_manager.dart';
import 'package:flutter_application_2/presentation/pages/page_factory.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestNotificationPermission() async {
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
}
void main() async {

    //asks for permission to send notifications
    WidgetsFlutterBinding.ensureInitialized(); //needed to do notification request
    await requestNotificationPermission();

    //set up config settings
    final pageDescConfig = PageDescriptorConfig();

    //set up logic layer
    final wordRepository = SharedPrefsWordRepository();
    final wordManager = WordManager(wordRepository);
    final notificationManager = await LocalNotificationFactory().getNotificationManager();
    final wordListManager = WordListManager(wordRepository);
    final wordEditorManager = WordEditorManager(wordRepository);
    const modalManager = ModalManager(); 


    //setting up body
    BodyController bodyController = BodyController(const Scaffold()); //start empty
    Body body = Body(contentNotifier: bodyController.contentNotifier);

    final NavigationDisplayword navigationDisplayword = NavigationDisplayword(bodyController: bodyController);
    final NavigationManager navigationManager = NavigationManager(bodyController: bodyController);
  
    final pageFactory = PageFactory(wordManager: wordManager, wordEditorManager: wordEditorManager, wordListManager: wordListManager, modalManager: modalManager, navigationManager: navigationManager, notificationManager: notificationManager, navigationDisplayword: navigationDisplayword);
    //handling circular dependencies
    pageFactory.buildPages();
    final pages = pageFactory.getBottomPages();
    navigationManager.initPages(pageFactory.getRegistry());
    navigationDisplayword.initPageFactory(pageFactory.getDisplayWordFactory()!);
    
    BottomNavBarFactory bottomNavBarFactory = BottomNavBarFactory(pages: pages,pagesConfig: pageDescConfig.getConfig(), navigationManager: navigationManager);
    navigationManager.setPage(Pages.viewWords); //set default screen

    runApp(MyApp(body: body, bottomNavBarFactory: bottomNavBarFactory,));
}
