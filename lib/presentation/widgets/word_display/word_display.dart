import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'word_display_controller.dart';
import '../word_form/word_input_field.dart';
import '../word_form/description_input_field.dart';
import '../word_form/save_button.dart';

class WordDisplay extends StatefulWidget {
  final WordDisplayController controller;
  final Word word;
  const WordDisplay({super.key, required this.controller, required this.word});

  @override
  State<WordDisplay> createState() => _WordDisplayState();
}

class _WordDisplayState extends State<WordDisplay> {
  
  void editMode()
  {
    widget.controller.toggleEdit();
    setState(() {});
  }

  void editSubmit() async
  {
    final saved = await widget.controller.handleSave(context);
    if (saved) setState(() {});
  }
  
  
  @override
  Widget build(BuildContext context) {
    final bool isEditing = widget.controller.isEditing;

    //initialize the word
    widget.controller.init(widget.word);

    
    StatelessWidget title = Text(widget.word.word, style: Theme.of(context).textTheme.headlineLarge,);
    StatelessWidget description = Text(widget.word.description, style: Theme.of(context).textTheme.headlineLarge,);
    Widget saveButton = ElevatedButton(onPressed: editMode, child: const Text('Edit'),);

    if (isEditing)
    {
      widget.controller.wordController.text = widget.word.word;
      title = WordInputField(controller: widget.controller.wordController, validator: widget.controller.validateWord,);

      widget.controller.descriptionController.text = widget.word.description;
      description = DescriptionInputField(controller: widget.controller.descriptionController,validator: widget.controller.validateDescription,);

      saveButton = SaveButton(onPressed: editSubmit);
    }
    
    return Form(
      key: widget.controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          const SizedBox(height: 16),
          description,
          const SizedBox(height: 24),
          saveButton,
        ],
      ),
    );
  }
}
