// lib/data/word_repository.dart

import 'dart:ffi';

import 'package:flutter_application_2/persistence/word_repository.dart';

import '../objects/word.dart';

class WordRepositoryStub implements WordRepository {
  @override
  Future<void> save(Word word) async 
  {
    // Simulate saving to a database
    await Future.delayed(const Duration(milliseconds: 500));
    print('📝 Word saved to DB: ${word.word} - ${word.description}');
  }

  @override
  Future<List<Word>> fetchAllWords() async 
  {
    await Future.delayed(const Duration(milliseconds: 500));
    Word wordTemp = Word(word: "annmol word", description: "test description");


    return [wordTemp];
  }
  
  @override
  Future<void> delete(Word word) async 
  {
    // doing some crazy calculations
    print('📝 Trying to delete Word: ${word.word} - ${word.description}');
  }
  
  @override
  Future<void> update(Word word, Word newWord) async
  {
    // doing some crazy calculations
    print('📝 updates to word: ${word.word} - ${word.description} -> ${newWord.word} - ${newWord.description}');
  }
}
