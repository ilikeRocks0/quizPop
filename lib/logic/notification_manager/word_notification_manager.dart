abstract class WordNotificationManager {

  Future<void> showNotification({int id = 0,String? title, String? body,}) async {}
  Future<void> scheduleNotification({required String title, required String body, required int hour, required int minute,}) async {}
  Future<void> initNotification() async {}
}
