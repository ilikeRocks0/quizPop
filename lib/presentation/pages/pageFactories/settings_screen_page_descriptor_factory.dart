import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/pages.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';
import 'package:flutter_application_2/presentation/screens/settings_screen.dart';

class SettingsScreenPageDescriptorFactory
{
  final SettingsScreen settingsScreen;
  
  SettingsScreenPageDescriptorFactory(this.settingsScreen);

  PageDescriptor getPage()
  {
    return PageDescriptor(
        label: 'Settings',
        icon: Icons.settings,
        screen: settingsScreen, 
        id: Pages.settings,
      );
  }
}