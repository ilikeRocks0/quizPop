import 'package:flutter/material.dart';

class BodyController {
  final ValueNotifier<Widget> _contentNotifier;

  BodyController(Widget initialContent)
      : _contentNotifier = ValueNotifier(initialContent);

  void changeBody(Widget newContent) {
    _contentNotifier.value = newContent;
  }

  ValueNotifier<Widget> get contentNotifier => _contentNotifier;
}
