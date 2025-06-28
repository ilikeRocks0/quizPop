

import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/presentation/modal_manager.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form_controller.dart';



class WordFormControllerFactory
{
  final ModalManager modalManager;
  final WordManager wordManager;


  WordFormControllerFactory(this.modalManager, this.wordManager);


  WordFormController buildController()
  {
    return WordFormController(modalManager: modalManager, wordManager: wordManager);
  }
}
