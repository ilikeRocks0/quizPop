// TODO Implement this library.// lib/widgets/word_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/presentation/word_form_controller.dart';
import 'package:flutter_application_2/presentation/widgets/word_input_field.dart';
import 'package:flutter_application_2/presentation/widgets/description_input_field.dart';
import 'package:flutter_application_2/presentation/widgets/save_button.dart';



class WordForm extends StatefulWidget {
  final WordManager wordManager;
  final ModalManager modalManager;
  
  const WordForm({
    super.key,
    required this.wordManager,
    required this.modalManager,
  });

  @override
  State<WordForm> createState() => _WordFormState();
}

class _WordFormState extends State<WordForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = WordFormController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
      if (!_formKey.currentState!.validate()) return;

      final confirm = await widget.modalManager.showConfirmation(context: context);
      
      //if not confirm
      if (!confirm) return;

      //ask logic layer if its fine
        await widget.wordManager.processAndSave(
        _controller.wordController.text,
        _controller.descriptionController.text,
      );

      //print success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Word saved!')),
      );

      // Refresh UI
      _controller.clearFields();
      setState(() {}); 
    
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
