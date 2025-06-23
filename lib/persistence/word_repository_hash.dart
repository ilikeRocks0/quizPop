// lib/data/word_repository.dart

import 'package:flutter_application_2/persistence/word_repository.dart';

import '../objects/word.dart';

class WordRepositoryHash implements WordRepository {
  final List<Word> words = [];

  @override
  Future<void> save(Word word) async 
  {
    // Simulate saving to a database
    words.add(word);
  }

  //should technically return immutable lists
  @override
  Future<List<Word>> fetchAllWords() async 
  {
    return words;
  }
}
