//contains the different page descriptors for each page

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/page_descriptor.dart';
import 'package:flutter_application_2/objects/pages.dart';

//used to display icons for different pages
//e.g. bottom navigation bar
class PageDescriptorConfig 
{
  
  HashMap<Pages, PageDescriptor> getConfig()
  {
    HashMap<Pages, PageDescriptor> pages = HashMap();

    pages[Pages.addWord] = const PageDescriptor(label: 'Add Word', icon: Icons.add, id: Pages.addWord);
    pages[Pages.viewWords] = const PageDescriptor(label: 'View Words', icon: Icons.list, id: Pages.viewWords);
    pages[Pages.settings] = const PageDescriptor(label: 'Settings', icon: Icons.settings, id: Pages.settings);
    return pages;
  }
}