// lib/factories/word_list_view_factory.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/word_tile.dart';
class WordListViewFactory {
  //the page we will go to when we click it
  final void Function(BuildContext, Word) onTapNavigateTo;

  WordListViewFactory({required this.onTapNavigateTo});


  Widget buildListView({
    required List<Word> words,
    required BuildContext context,
  }) {
    return ListView(
      children: words.map((word) {
        return ListTile(
          title: Text(word.word),
          onTap: () => onTapNavigateTo(context, word),
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
