import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final ValueNotifier<Widget> contentNotifier;

  const Body({super.key, required this.contentNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Widget>(
      valueListenable: contentNotifier,
      builder: (context, content, _) {
        return content;
      },
    );
  }
}
