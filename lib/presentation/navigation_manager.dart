import 'package:flutter_application_2/body_controller.dart';
import 'package:flutter_application_2/presentation/pages/page_descriptor.dart';

class NavigationManager {
  final BodyController bodyController;

  NavigationManager({required this.bodyController});

  void setPage(PageDescriptor page) {
    bodyController.changeBody(page.screen);
  }
}
