import 'package:flutter_application_2/logic/notification_manager/word_notification_manager.dart';
import 'package:flutter_application_2/persistence/word_repository.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationRunner {
  final WordRepository _repository;
  final WordNotificationManager _localNotification;

  NotificationRunner(this._repository, this._localNotification);

  Future<void> setUpNotifications() async {
    // 1. Fetch all words
    //wait for notifications to work
    await _localNotification.initNotification();

    final allWords = await _repository.fetchAllWords();
    if (allWords.isEmpty) return;

    //clear notifications
    _localNotification.cancelAllNotifications();
    
    // 2. Shuffle and take 30 (or as many as possible)
    final shuffled = List.of(allWords)..shuffle();
    final selected = shuffled.take(30).toList();

    // 3. Schedule each word for the next 30 days at 9:00 AM
    final now = tz.TZDateTime.now(tz.local);

    for (int i = 0; i < selected.length; i++) {
      final word = selected[i];

      final scheduleDate = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        9,
        0,
      ).add(Duration(days: i));
      if (!scheduleDate.isBefore(now)) {
        await _localNotification.scheduleNotification(
            id: 1000 + i, //each day has to be unique or it gets overridden
            title: "What is this word?",
            body: word.word,
            year: scheduleDate.year,
            month: scheduleDate.month,
            day: scheduleDate.day,
            hour: 9,
            minute:  0,
        );
      }
    }

    print("30 notifications scheduled.");
  }
}
