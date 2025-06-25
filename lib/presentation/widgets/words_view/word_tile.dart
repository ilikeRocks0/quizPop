
// lib/presentation/widgets/words_view/word_tile.dart

import 'package:flutter/material.dart';
import '../../../objects/word.dart';


//stores the word information 
class WordTile extends StatelessWidget {
  final Word word;
  final VoidCallback? onTap;

  const WordTile({super.key,required this.word, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(word.word),
      subtitle: Text(word.description),
      onTap: onTap,
    );
  }
}
