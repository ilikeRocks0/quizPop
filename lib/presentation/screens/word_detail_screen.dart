// lib/screens/word_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/widgets/word_display/word_display.dart';

class WordDetailScreen extends StatelessWidget {
  final WordDisplay wordDisplay;
  const WordDetailScreen({super.key, required this.wordDisplay});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(child: wordDisplay, width: double.infinity,) ,
          ),
        ),
      ),
    );
  }
}
