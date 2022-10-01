import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // initilize
  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("ic_launcher");
    IOSInitializationSettings iosInitializationSettings =
        const IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    return const NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name',
          channelDescription: 'your channel description',
          importance: Importance.max),
      iOS: IOSNotificationDetails(),
    );
  }

  // Instant Notification
  Future instantNotification() async {
    var android = const AndroidNotificationDetails("id", "channel");

    var ios = const IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.show(
        0, "Need Electrician", "Tap to see the Notification", platform,
        payload: "Welcome To krta app");
  }

  //
  Future imageNotification() async {
    var bigPicture = const BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      contentTitle: "Need ",
      summaryText: "This is the Some text",
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );
    var android = AndroidNotificationDetails("id", "channel",
        channelDescription: 'your channel description',
        styleInformation: bigPicture);

    var platform = NotificationDetails(
      android: android,
    );

    await _flutterLocalNotificationsPlugin.show(
        0, "Need Electrician", "Tap to see the Notification", platform,
        payload: "Welcome To krta app");
  }

  // stylish Notification
  Future stylishNotification() async {
    var android = const AndroidNotificationDetails("id", "channel",
        channelDescription: 'your channel description',
        color: Colors.deepOrange,
        enableLights: true,
        enableVibration: true,
        largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
        styleInformation: MediaStyleInformation(
            htmlFormatContent: true, htmlFormatTitle: true));
    var platform = NotificationDetails(
      android: android,
    );
    await _flutterLocalNotificationsPlugin.show(
      0,
      "Need Electrician",
      "Tap to see the Notification",
      platform,
    );
  }

  // schedule notification
  Future scheduleNotification() async {
    var interval = RepeatInterval.everyMinute;
    var bigPicture = const BigPictureStyleInformation(
      DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      contentTitle: "Need ",
      summaryText: "This is the Some text",
      htmlFormatContent: true,
      htmlFormatContentTitle: true,
    );
    var android = AndroidNotificationDetails("id", "channel",
        channelDescription: 'your channel description',
        styleInformation: bigPicture);

    var platform = NotificationDetails(
      android: android,
    );

    await _flutterLocalNotificationsPlugin.periodicallyShow(0,
        "Need Electrician", "Tap to see the Notification", interval, platform,
        payload: "Welcome To krta app");
  }

  // cancel Notification
  Future cancelNotificatoin() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
