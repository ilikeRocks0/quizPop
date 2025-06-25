// lib/screens/view_words_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/view_words_controller.dart';

class ViewWordsScreen extends StatelessWidget {
  final ViewWordsController controller;

  const ViewWordsScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Words')),
      body: FutureBuilder<Widget>(
        future: controller.buildWordList(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return snapshot.data ?? const SizedBox();
        },
      ),
    );
  }
}
