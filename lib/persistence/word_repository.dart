// lib/data/word_repository.dart

import '../objects/word.dart';

abstract class WordRepository {
  Future<void> save(Word word);

  Future<List<Word>> fetchAllWords();
  
  Future<void> delete(Word word);

  Future<void> update(Word word, Word newWord);
}
