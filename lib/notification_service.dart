
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('child'),
    );

   await _notificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> displayNotification(String message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

       const notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription:'This channel is used for important notifications',
          importance: Importance.max,
          priority: Priority.high,
          icon:'child',
          playSound: true,
          fullScreenIntent: true
        ),
      );

      await _notificationsPlugin.show(
        id,
        message,
        "finally i did it",
        notificationDetails,
      );
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}