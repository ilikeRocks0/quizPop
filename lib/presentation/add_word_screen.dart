// lib/screens/add_word_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/add_word_controller.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  State<AddWordScreen> createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  final _formKey = GlobalKey<FormState>();
  final AddWordController _controller = AddWordController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_controller.validateForm(_formKey)) {
      final word = _controller.createWord();

      // TODO: Save the word to local storage
      print('Saved: ${word.word} - ${word.description}');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Word saved!')),
      );

      _controller.clearFields();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Word')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controller.wordController,
                decoration: const InputDecoration(
                  labelText: 'Word',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.trim().isEmpty ? 'Enter a word' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _controller.descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Your Description / Context',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Enter a description'
                    : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _handleSave,
                icon: const Icon(Icons.save),
                label: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
