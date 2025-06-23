// lib/logic/word_editor_manager.dart

import '../objects/word.dart';
import '../persistence/word_repository.dart';

class WordEditorManager 
{
  final WordRepository _repository;

  WordEditorManager(this._repository);

  /// Delete a word from the list
  Future<void> deleteWord(Word word) async 
  {
    await _repository.delete(word);
  }

  /// Replace an old word with a new one
  Future<void> updateWord({
    required Word oldWord,
    required Word newWord,
  }) async {
    await _repository.update(oldWord, newWord);
  }
}
