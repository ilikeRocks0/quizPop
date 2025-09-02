import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/notification_manager/word_notification_manager.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';
import 'package:flutter_application_2/presentation/screens/settings_screen.dart';

class SettingsScreenPageDescriptorFactory
{
  final WordNotificationManager notificationManager;
  
  SettingsScreenPageDescriptorFactory(this.notificationManager);

  PageDescriptor getPage()
  {
    return PageDescriptor(
        label: 'Settings',
        icon: Icons.settings,
        screen: SettingsScreen(notificationManager: notificationManager,),
      );
  }
}