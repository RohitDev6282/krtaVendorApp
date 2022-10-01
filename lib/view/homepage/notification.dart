import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:krta_vendor_app/constant/constant.dart';
import 'package:krta_vendor_app/model/notification_model/notification_model.dart';
import 'package:krta_vendor_app/service/api_cofig.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:krta_vendor_app/service/notification_api.dart';
import 'package:provider/provider.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "High_Importance_channel", "High Importance",
    importance: Importance.high, playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A message by the just showed::${message.messageId}');
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> fetchDataData = [];
  bool waiting = true;

  @override
  void initState() {
    // Provider.of<NotificationApi>(context, listen: false).initialize();
    super.initState();
    // _requestPermissions();
    _fetchNotification().then((getnotification) => setState(() {
          waiting = false;
          fetchDataData = getnotification;
        }));

    // // foreground work
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //             android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //         )));
    //     // Navigator.push(
    //     //     context,
    //     //     MaterialPageRoute(
    //     //         builder: (context) => const NotificationPage()));
    //   }

    //   // });
    //   // //when app is in background but opened and user taps
    //   // // when
    //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //     print("A new messageOpen event was publishes");
    //     RemoteNotification? notification = message.notification;
    //     AndroidNotification? android = message.notification?.android;
    //     if (notification != null && android != null) {
    //       Navigator.push(context, MaterialPageRoute(builder: (context)=>))
    //       // showDialog(
    //       //     context: context,
    //       //     builder: (_) {
    //       //       return AlertDialog(
    //       //         title: Text(notification.title.toString()),
    //       //         content: SingleChildScrollView(
    //       //           child: Column(
    //       //             crossAxisAlignment: CrossAxisAlignment.start,
    //       //             children: [Text(notification.body.toString())],
    //       //           ),
    //       //         ),
    //       //       );
    //       //     });
    //     }
    //   });
    // });

    // void _requestPermissions() {
    //   flutterLocalNotificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           IOSFlutterLocalNotificationsPlugin>()
    //       ?.requestPermissions(
    //         alert: true,
    //         badge: true,
    //         sound: true,
    //       );
    // }
    void showNotification() {
      setState(() {});
      flutterLocalNotificationsPlugin.show(
          0,
          "testing",
          "How are You",
          NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  importance: Importance.high)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kWhiteColor, //change your color here
        ),
        backgroundColor: kPrimaryColor,
        title: Text(
          "NotificationPage",
          style: kWhiteLrgTextStyle,
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: fetchDataData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kLightGreyColor),
                        child: ListTile(
                            isThreeLine: true,
                            leading: Text(
                              fetchDataData[index].id,
                            ),
                            title: Text(
                              fetchDataData[index].title,
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              fetchDataData[index].detail,
                              style: TextStyle(fontSize: 14),
                            ),
                            onTap: () {
                              // setState(() {
                              //   _data
                              //       .removeWhere((Item currentItem) => item == currentItem);
                            })));
              }),
          // Consumer<NotificationApi>(
          //     builder: (context, model, _) => TextButton(
          //         onPressed: () => model.imageNotification(),
          //         child: const Text(
          //           "Show Notification",
          //         ))),
        ],
      ),
    );
  }

  Future _fetchNotification() async {
    final response = await http.get(Uri.parse(Config.notificationUrl));
    if (response.statusCode == 200) {
      final getnotification = notificationModelFromJson(response.body);
      return getnotification;
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
