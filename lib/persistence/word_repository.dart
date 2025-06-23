// lib/data/word_repository.dart

import '../objects/word.dart';

abstract class WordRepository {
  Future<void> save(Word word);

  Future<List<Word>> fetchAllWords();
}
