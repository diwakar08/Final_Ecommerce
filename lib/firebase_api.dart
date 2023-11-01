import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

Future<void> handlebackgroundMessage(RemoteMessage message) async {
  print('Titile : ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Payload : ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.defaultImportance,
    playSound: true, // Enable sound for notifications
    enableVibration: true, // Enable vibration for notifications
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
  }

  Future initLocalNotifications() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(
      android: android,
      iOS: DarwinInitializationSettings(),
    );

    await _localNotifications.initialize(settings);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage((handlebackgroundMessage));
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> pushTokenToSns(fCMToken) async {
    Map<String, dynamic> json = {
      "tokens": ["$fCMToken"],
    };
    // final response = await http.post(
      // Uri.parse(
      //     'https://api.pehchankidukan.com/seller/createEndpointsAndSubscribe'),
      // body: json,
    // );
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token: $fCMToken");
    pushTokenToSns(fCMToken);
    initPushNotifications();
    initLocalNotifications();
  }
}
