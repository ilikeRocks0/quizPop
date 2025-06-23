// lib/screens/main_shell.dart

import 'package:flutter/material.dart';
import 'page_descriptor.dart';

class MainShell extends StatefulWidget {
  final List<PageDescriptor> pages;

  const MainShell({super.key, required this.pages});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[_selectedIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: widget.pages
            .map(
              (page) => BottomNavigationBarItem(
                icon: Icon(page.icon),
                label: page.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
