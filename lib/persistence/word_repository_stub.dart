// lib/data/word_repository.dart
import 'package:flutter_application_2/persistence/word_repository.dart';

import '../objects/word.dart';

class WordRepositoryStub implements WordRepository {
  @override
  Future<void> save(String word, String description) async 
  {
    // Simulate saving to a database
    await Future.delayed(const Duration(milliseconds: 500));
    print('📝 Word saved to DB: ${word} - ${description}');
  }

  @override
  Future<List<Word>> fetchAllWords() async 
  {
    await Future.delayed(const Duration(milliseconds: 500));
    Word wordTemp = Word(word: "annmol word", description: "test description", index: 0);


    return [wordTemp];
  }
  
  @override
  Future<void> delete(int index) async 
  {
    // doing some crazy calculations
    print('📝 Trying to delete Word at index: ${index}');
  }
  
  @override
  Future<Word?> update(int index, String word, String description) async
  {
    // doing some crazy calculations
    print('📝 updates to word at index: ${index} ${word} - ${description}');
    return Word(word: "annmol word", description: "test description", index: 0);;
  }
}
