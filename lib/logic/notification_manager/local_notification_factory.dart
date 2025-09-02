import 'package:flutter_application_2/logic/notification_manager/local_notification.dart';
import 'package:flutter_application_2/logic/notification_manager/word_notification_manager.dart';

class LocalNotificationFactory 
{
  Future<WordNotificationManager> getNotificationManager() async
  {
    WordNotificationManager notimanager = LocalNotification();
    await notimanager.initNotification();
    return notimanager;
  }  
}