// lib/screens/main_shell.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/navigation/navigation_manager.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';

//sets up the bottom nav bar
class BottomNavBarFactory
{
  NavigationManager navigationManager;
  List<PageDescriptor> pages;
  int currIndex = 0;

  BottomNavBarFactory({required this.pages, required this.navigationManager});
  

  List<BottomNavigationBarItem> _buildNavItems() {
    return pages.map((page) {
      return BottomNavigationBarItem(
        icon: Icon(page.icon),
        label: page.label,
      );
    }).toList();
  }

  BottomNavigationBar getNavBar()
  {
    return BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (index) => navigationManager.setPage(pages[index].id),
        items: _buildNavItems(),
      );
  }


}
