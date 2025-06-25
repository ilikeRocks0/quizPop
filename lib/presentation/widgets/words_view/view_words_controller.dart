// lib/controllers/view_words_controller.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_list_manager.dart';
import 'package:flutter_application_2/objects/word.dart';

class ViewWordsController extends ChangeNotifier {
  final WordListManager wordListManager;

  ViewWordsController({required this.wordListManager});

  List<Word> _words = [];
  String? _error;
  bool _loading = true;

  List<Word> get words => _words;
  String? get error => _error;
  bool get isLoading => _loading;

  Future<void> loadWords() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final fetched = await wordListManager.fetchAllWords();
      _words = fetched;
    } catch (e) {
      _error = e.toString();
    }

    _loading = false;
    notifyListeners();
  }
}
