// lib/screens/view_words_screen.dart

import 'package:flutter/material.dart';
import '../logic/word_list_manager.dart';
import '../objects/word.dart';

class ViewWordsScreen extends StatelessWidget {
  final WordListManager wordListManager;

  const ViewWordsScreen({super.key, required this.wordListManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Words')),
      body: FutureBuilder<List<Word>>(
        future: wordListManager.fetchAllWords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No words saved.'));
          }

          final words = snapshot.data!;

          return ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) {
              final word = words[index];
              return ListTile(
                title: Text(word.word),
                subtitle: Text(word.description),
              );
            },
          );
        },
      ),
    );
  }
}
