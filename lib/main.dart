import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:krta_vendor_app/service/notification_api.dart';
import 'package:krta_vendor_app/view/auth/signin.dart';
import 'package:krta_vendor_app/view/homepage/homepage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "High_Importance_channel", "High Importance",
    importance: Importance.high, playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A message by the just showed::${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  FirebaseMessaging.instance.getToken().then((value) {
    String? token = value;
    print(token);
  });

  runApp(MultiProvider(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
      providers: [ChangeNotifierProvider(create: (_) => NotificationApi())]));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _finalId = "";
  Future getuserValidation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? status = preferences.getString("userId");
    setState(() {
      _finalId = status!;
    });
  }

  @override
  void initState() {
    getuserValidation().whenComplete(
      () async {
        Timer(
            const Duration(seconds: 2),
            () => _finalId != ""
                ? Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()))
                : Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIn())));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/logo.jpeg'), fit: BoxFit.cover),
        ),
      ),
    ));
  }
}
