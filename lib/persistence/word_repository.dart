// lib/data/word_repository.dart
import '../objects/word.dart';

abstract class WordRepository {
  Future<void> save(String word, String description);

  Future<List<Word>> fetchAllWords();
  
  Future<void> delete(int index);

  //returns null if invalid index
  Future<Word?> update(int index, String word, String description);
}
