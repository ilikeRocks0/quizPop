import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/body_controller.dart';
import 'package:flutter_application_2/objects/pages.dart';

class NavigationManager {
  final BodyController bodyController;
  late HashMap<Pages, Widget> registery;

  NavigationManager({required this.bodyController});

  void initPages(HashMap<Pages, Widget> registery)
  {
    this.registery = registery;
  }

  void setPage(Pages page) 
  {
    if(registery.containsKey(page))
    {
      bodyController.changeBody(registery[page]!);
    }
  }
}
