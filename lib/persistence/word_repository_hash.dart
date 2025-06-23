import '../objects/word.dart';
import 'word_repository.dart';

class WordRepositoryHash implements WordRepository {
  final List<Word> _words = [];

  @override
  Future<void> save(Word word) async {
    // Simulate saving to a database
    _words.add(word);
  }

  @override
  Future<List<Word>> fetchAllWords() async {
    // Return an immutable copy
    return List.unmodifiable(_words);
  }

  @override
  Future<void> delete(Word word) async {
    _words.remove(word);
  }

  @override
  Future<void> update(Word oldWord, Word newWord) async {
    final index = _words.indexOf(oldWord);
    if (index != -1) {
      _words[index] = newWord;
    }
  }
}
