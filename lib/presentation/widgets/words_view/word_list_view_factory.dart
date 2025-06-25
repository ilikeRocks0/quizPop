// lib/factories/word_list_view_factory.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/word_tile.dart';

class WordListViewFactory {
  
  Widget buildListView({required List<Word> words, void Function(Word)? onTap}) 
  {
    return ListView(
      children: words.map((word) {
        return WordTile(
          word: word,
          onTap: onTap != null ? () => onTap(word) : null,
        );
      }).toList(),
    );
  }

  Widget buildError(String message) {
    return Center(child: Text('Error: $message'));
  }

  Widget buildEmpty() {
    return const Center(child: Text('No words saved.'));
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }
}
