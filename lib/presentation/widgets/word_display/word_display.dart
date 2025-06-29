import 'package:flutter/material.dart';
import 'package:flutter_application_2/objects/word.dart';
import 'word_display_controller.dart';
import '../word_form/word_input_field.dart';
import '../word_form/description_input_field.dart';
import '../word_form/save_button.dart';

class WordDisplay extends StatefulWidget {
  final WordDisplayController controller;
  final Word word; //word the widget starts with
  const WordDisplay({super.key, required this.controller, required this.word});

  @override
  State<WordDisplay> createState() => _WordDisplayState();
}

class _WordDisplayState extends State<WordDisplay> {
  late Word currWord = widget.word; //this gets changed

  void editMode()
  {
    widget.controller.toggleEdit();
    setState(() {});
  }

  void editSubmit() async
  {
    Word? saved = await widget.controller.handleEdit(context, widget.controller.wordController.text, widget.controller.descriptionController.text);
    if (saved != null)
    {
      currWord = saved;
      setState(() {});
    }
    

  }
  
  
  @override
  Widget build(BuildContext context) {

    final bool isEditing = widget.controller.isEditing;

    //initialize the word
    widget.controller.init(currWord);

    
    StatelessWidget title = Text(currWord.word, style: Theme.of(context).textTheme.headlineLarge,);
    StatelessWidget description = Text(currWord.description, style: Theme.of(context).textTheme.headlineLarge,);
    Widget saveButton = ElevatedButton(onPressed: editMode, child: const Text('Edit'),);

    if (isEditing)
    {
      widget.controller.wordController.text = currWord.word;
      title = WordInputField(controller: widget.controller.wordController, validator: widget.controller.validateWord,);

      widget.controller.descriptionController.text = currWord.description;
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
