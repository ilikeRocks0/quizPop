// TODO Implement this library.// lib/widgets/word_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/add_word_controller.dart';
import 'package:flutter_application_2/presentation/widgets/word_input_field.dart';
import 'package:flutter_application_2/presentation/widgets/description_input_field.dart';
import 'package:flutter_application_2/presentation/widgets/save_button.dart';

class WordForm extends StatefulWidget {
  const WordForm({super.key});

  @override
  State<WordForm> createState() => _WordFormState();
}

class _WordFormState extends State<WordForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = AddWordController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_controller.validateForm(_formKey)) {
      final word = _controller.createWord();

      print('Saved: ${word.word} - ${word.description}');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Word saved!')),
      );

      _controller.clearFields();
      setState(() {}); // Refresh UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          WordInputField(controller: _controller.wordController),
          const SizedBox(height: 16),
          DescriptionInputField(controller: _controller.descriptionController),
          const SizedBox(height: 24),
          SaveButton(onPressed: _handleSave),
        ],
      ),
    );
  }
}
