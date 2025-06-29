import '../objects/word.dart';
import 'word_repository.dart';

class WordRepositoryHash implements WordRepository {
  final List<Word> _words = [];

  @override
  Future<void> save(String word, String description) async 
  {
    _words.add(Word(index: _words.length, word: word, description: description));
  }

  @override
  Future<List<Word>> fetchAllWords() async 
  {
    return List.unmodifiable(_words);
  }

  @override
  Future<void> delete(int index) async 
  {
    if (index >= 0 && index < _words.length) 
    {
      _words.removeAt(index);
    }
  }

  @override
  Future<Word?> update(int index, String word, String description) async 
  {
    if (index >= 0 && index < _words.length) 
    {
      _words[index] = Word(index: index, word: word, description: description);
      return _words[index];
    }
    return null;
  }
}
