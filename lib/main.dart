import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/modal_manager.dart';
import 'package:flutter_application_2/logic/word_manager.dart';
import 'package:flutter_application_2/myApp.dart';
import 'package:flutter_application_2/persistence/word_repository.dart';

void main() {
    final wordRepository = WordRepository();
    final wordManager = WordManager(wordRepository);
    const modalManager = ModalManager(); 

    runApp(MyApp(wordManager: wordManager, modalManager: modalManager,));
}
