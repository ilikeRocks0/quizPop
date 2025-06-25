// lib/screens/view_words_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/widgets/words_view/view_words_controller.dart';

class ViewWordsScreen extends StatefulWidget {
  final ViewWordsController controller;

  const ViewWordsScreen({super.key, required this.controller});

  @override
  State<ViewWordsScreen> createState() => _ViewWordsScreenState();
}

class _ViewWordsScreenState extends State<ViewWordsScreen> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerUpdate);
    widget.controller.loadWords();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerUpdate);
    super.dispose();
  }

  void _onControllerUpdate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Scaffold(
      appBar: AppBar(title: const Text('Saved Words')),
      body: _buildBody(controller),
    );
  }

  Widget _buildBody(ViewWordsController controller) {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (controller.error != null) {
      return Center(child: Text('Error: ${controller.error}'));
    }

    if (controller.words.isEmpty) {
      return const Center(child: Text('No words saved.'));
    }

    return ListView(
      children: controller.words.map((word) {
        return ListTile(
          title: Text(word.word),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped: ${word.word}')),
            );
          },
        );
      }).toList(),
    );
  }
}
