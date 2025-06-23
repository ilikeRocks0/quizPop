// lib/data/word_repository.dart

import '../objects/word.dart';

class WordRepository {
  Future<void> save(Word word) async 
  {
    // Simulate saving to a database
    await Future.delayed(const Duration(milliseconds: 500));
    print('📝 Word saved to DB: ${word.word} - ${word.description}');
  }

  Future<List<Word>> fetchAllWords() async 
  {
    await Future.delayed(const Duration(milliseconds: 500));
    Word wordTemp = Word(word: "annmol word", description: "test description");


    return [wordTemp];
  }
}
