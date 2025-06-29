// lib/logic/word_editor_manager.dart

import 'package:flutter_application_2/objects/word.dart';

import '../persistence/word_repository.dart';

class WordEditorManager 
{
  final WordRepository _repository;

  WordEditorManager(this._repository);

  /// Delete a word from the list
  Future<void> deleteWord(int index) async 
  {
    await _repository.delete(index);
  }

  /// Replace an old word with a new one
  Future<Word?> updateWord({required int index, required String newWord, required String newDescription}) async 
  {
    return await _repository.update(index, newWord, newDescription);
  }
}
