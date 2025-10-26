// lib/screens/add_word_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/notification_manager/word_notification_manager.dart';

class SettingsScreen extends StatelessWidget {
  final WordNotificationManager notificationManager;

  const SettingsScreen({super.key, required this.notificationManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          ElevatedButton(
          onPressed: () {
            notificationManager.showNotification(
            title: "title",
            body: "body",
          );
          },
          child: const Text("Send Notification"),
          ),
          ElevatedButton(
          onPressed: () {
            notificationManager.scheduleNotification(
            title: "scheduled",
            body: "tests",
            hour: 15,
            minute:  9,
          );
          },
          child: const Text("Schedule Notif"),
          ),
        ],) ,
        ),
      );
  }
}
