import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';
import 'package:flutter_application_2/presentation/screens/settings_screen.dart';

class SettingsScreenPageDescriptorFactory
{

  SettingsScreenPageDescriptorFactory();

  PageDescriptor getPage()
  {
    return const PageDescriptor(
        label: 'Settings',
        icon: Icons.settings,
        screen: SettingsScreen(),
      );
  }
}