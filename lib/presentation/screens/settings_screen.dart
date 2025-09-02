// lib/screens/add_word_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/word_notification_manager.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form.dart';
import 'package:flutter_application_2/presentation/widgets/word_form/word_form_controller.dart';

class SettingsScreen extends StatelessWidget {

  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            WordNotificationManager.instance.showNotification(
            title: "title",
            body: "body",
          );
          },
          child: const Text("Send Notification"),
          ),
        ),
      );
  }
}
