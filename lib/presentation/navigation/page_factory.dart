// lib/screens/page_factory.dart

import 'package:flutter/material.dart';
import '../../logic/word_manager.dart';
import '../../logic/word_list_manager.dart';
import '../modal_manager.dart';
import '../add_word_screen.dart';
import '../view_words_screens.dart';
import 'page_descriptor.dart';

List<PageDescriptor> buildAppPages({
  required WordManager wordManager,
  required WordListManager wordListManager,
  required ModalManager modalManager,
}) {
  return [
    PageDescriptor(
      label: 'Add Word',
      icon: Icons.add,
      screen: AddWordScreen(
        wordManager: wordManager,
        modalManager: modalManager,
      ),
    ),
    PageDescriptor(
      label: 'View Words',
      icon: Icons.list,
      screen: ViewWordsScreen(
        wordListManager: wordListManager,
      ),
    ),
  ];
}
