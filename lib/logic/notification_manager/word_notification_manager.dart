abstract class WordNotificationManager {

  Future<void> showNotification({int id = 0,String? title, String? body,}) async {}
  Future<void> scheduleNotification({int id = 0, String? title, String? body, String? payLoad, required DateTime scheduledNotificationDateTime,}) async {}
  Future<void> initNotification() async {}
}
