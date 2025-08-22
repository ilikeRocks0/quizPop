import 'dart:convert';

import 'package:flutter_application_2/objects/word.dart';
import 'package:flutter_application_2/persistence/word_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsWordRepository implements WordRepository {
  static const _key = 'words';

  /// Convert Word -> Map<String, dynamic>
  Map<String, dynamic> _toJson(Word word) => {
        'index': word.index,
        'word': word.word,
        'description': word.description,
      };

  /// Convert Map<String, dynamic> -> Word
  Word _fromJson(Map<String, dynamic> json) => Word(
        index: json['index'] as int,
        word: json['word'] as String,
        description: json['description'] as String,
      );

  Future<List<Word>> _loadWords() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];

    final List decoded = jsonDecode(jsonString) as List;
    return decoded
        .map((e) => _fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> _saveWords(List<Word> words) async {
    final prefs = await SharedPreferences.getInstance();

    // Re-assign indexes so they stay consistent with list position
    final indexedWords = words.asMap().entries.map((entry) {
      return Word(
        index: entry.key,
        word: entry.value.word,
        description: entry.value.description,
      );
    }).toList();

    final jsonString =
        jsonEncode(indexedWords.map((w) => _toJson(w)).toList());
    await prefs.setString(_key, jsonString);
  }

  @override
  Future<void> save(String word, String description) async {
    final words = await _loadWords();
    words.add(Word(
      index: words.length,
      word: word,
      description: description,
    ));
    await _saveWords(words);
  }

  @override
  Future<List<Word>> fetchAllWords() async {
    return await _loadWords();
  }

  @override
  Future<void> delete(int index) async {
    final words = await _loadWords();
    if (index >= 0 && index < words.length) {
      words.removeAt(index);
      await _saveWords(words);
    }
  }

  @override
  Future<Word?> update(int index, String word, String description) async {
    final words = await _loadWords();
    if (index < 0 || index >= words.length) return null;

    words[index] = Word(
      index: index,
      word: word,
      description: description,
    );
    await _saveWords(words);
    return words[index];
  }
}
