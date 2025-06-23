// TODO Implement this library.// lib/widgets/word_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/presentation/add_word_controller.dart';
import 'package:flutter_application_2/presentation/widgets/word_input_field.dart';
import 'package:flutter_application_2/presentation/widgets/description_input_field.dart';
import 'package:flutter_application_2/presentation/widgets/save_button.dart';



class WordForm extends StatefulWidget {
  final WordManager wordManager;
  
  const WordForm({super.key, required this.wordManager});

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

  Future<void> _handleSave() async {

      //ask logic layer if its fine
      if (_formKey.currentState!.validate()) {
        await widget.wordManager.processAndSave(
        _controller.wordController.text,
        _controller.descriptionController.text,
      );

      //print success
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
          WordInputField(controller: _controller.wordController, validator: widget.wordManager.validateWord),
          const SizedBox(height: 16),
          DescriptionInputField(controller: _controller.descriptionController, validator: widget.wordManager.validateWord),
          const SizedBox(height: 24),
          SaveButton(onPressed: _handleSave),
        ],
      ),
    );
  }
}
