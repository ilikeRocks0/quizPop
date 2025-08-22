import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/body_controller.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';

class NavigationManager {
  final BodyController bodyController;
  Widget? mainBody;
  Widget? subBody;

  NavigationManager({required this.bodyController});

  void setPage(PageDescriptor page) 
  {
    mainBody = page.screen;
    subBody = null;
    bodyController.changeBody(page.screen);

  }
  
  void setSubPage(PageDescriptor page)
  {
    subBody = page.screen;
    bodyController.changeBody(page.screen);
  }

  void popSubPage()
  {
    if(subBody != null)
    {
      bodyController.changeBody(mainBody!);
      subBody = null;
    }
  }
}
