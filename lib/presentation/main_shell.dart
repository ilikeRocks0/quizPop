// lib/screens/main_shell.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'add_word_screen.dart';
import 'view_words_screens.dart';
import '../logic/word_manager.dart';
import '../logic/word_list_manager.dart';


//is the bottom bar of the page
class MainShell extends StatefulWidget {
  final WordManager wordManager;
  final WordListManager wordListManager;
  final ModalManager modalManager;

  const MainShell({
    super.key,
    required this.wordManager,
    required this.wordListManager,
    required this.modalManager,
  });

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      AddWordScreen(wordManager: widget.wordManager, modalManager: widget.modalManager,),
      ViewWordsScreen(wordListManager: widget.wordListManager),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Word'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'View Words'),
        ],
      ),
    );
  }
}
