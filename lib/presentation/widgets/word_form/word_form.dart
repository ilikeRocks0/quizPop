// lib/presentation/widgets/word_form/word_form.dart

import 'package:flutter/material.dart';
import 'word_form_controller.dart';
import 'word_input_field.dart';
import 'description_input_field.dart';
import 'save_button.dart';

class WordForm extends StatefulWidget {
  final WordFormController controller;

  const WordForm({super.key, required this.controller});

  @override
  State<WordForm> createState() => _WordFormState();
}

class _WordFormState extends State<WordForm> {
  Future<void> _onSave() async {
    final saved = await widget.controller.handleSave(context);
    if (saved) setState(() {}); // refresh form after saving
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.formKey,
      child: Column(
        children: [
          WordInputField(
            controller: widget.controller.wordController,
            validator: widget.controller.validateWord,
          ),
          const SizedBox(height: 16),
          DescriptionInputField(
            controller: widget.controller.descriptionController,
            validator: widget.controller.validateDescription,
          ),
          const SizedBox(height: 24),
          SaveButton(onPressed: _onSave),
        ],
      ),
    );
  }
}
