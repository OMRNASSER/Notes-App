import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{

  static final FlutterLocalNotificationsPlugin _notificationplugin = FlutterLocalNotificationsPlugin();


  static Future<void> initialize() async{
    const  AndroidInitializationSettings androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(android: androidInit);


    await _notificationplugin.initialize(initSettings);

  }

  static Future<void> showNotification({
    int id=0,
    String title = "Check your Notes",
    String body = "Don\'t forget to check your notes today",

}) async{

    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      "channel_id",
        "channel_name",
      channelDescription: "note reminder",
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);

    await _notificationplugin.show(id, title, body, notificationDetails);

}


}