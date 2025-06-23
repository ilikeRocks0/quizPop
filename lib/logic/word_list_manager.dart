// lib/logic/word_list_manager.dart

import '../objects/word.dart';
import '../persistence/word_repository.dart';

class WordListManager {
  final WordRepository _repository;

  WordListManager(this._repository);

  Future<List<Word>> fetchAllWords() {
    return _repository.fetchAllWords();
  }
}
