abstract class WordNotificationManager {

  Future<void> showNotification({int id = 0,String? title, String? body,}) async {}
  Future<void> scheduleNotification({required String title, required String body, required int hour, required int minute,int? year, int? month,int? day}) async {}
  Future<void> initNotification() async {}
}
