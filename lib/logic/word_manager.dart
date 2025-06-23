// lib/logic/word_manager.dart

import '../objects/word.dart';
import '../persistence/word_repository.dart';

class WordManager {
  final WordRepository _repository;

  WordManager(this._repository);

  String? validateWord(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Enter a word';
    }
    return null;
  }

  String? validateDescription(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Enter a description';
    }
    return null;
  }

  Future<void> processAndSave(String wordText, String descriptionText) async {
    final word = Word(
      word: wordText.trim(),
      description: descriptionText.trim(),
    );
    await _repository.save(word);
  }
}
