// lib/screens/main_shell.dart

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/navigation/navigation_manager.dart';
import 'package:flutter_application_2/objects/page_descriptor.dart';

import 'package:flutter_application_2/objects/pages.dart';

//sets up the bottom nav bar
class BottomNavBarFactory
{
  NavigationManager navigationManager;
  HashMap<Pages, PageDescriptor> pagesConfig;
  List<Pages> pages;
  int currIndex = 0;

  BottomNavBarFactory({required this.pages, required this.pagesConfig, required this.navigationManager});
  

  List<BottomNavigationBarItem> _buildNavItems() {
    return pages.map((page) {

      PageDescriptor? pageDetail = pagesConfig[page];

      return BottomNavigationBarItem(
        icon: Icon(pageDetail?.icon),
        label: pageDetail?.label,
      );
    }).toList();
  }

  BottomNavigationBar getNavBar()
  {
    return BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (index) => 
        {
          navigationManager.setPage(pages[index])
        },
        items: _buildNavItems(),
      );
  }


}
