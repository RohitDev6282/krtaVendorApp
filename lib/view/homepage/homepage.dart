// ignore_for_file: unnecessary_const
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:krta_vendor_app/constant/constant.dart';
import 'package:krta_vendor_app/model/new_lead/new_lead.dart';
import 'package:krta_vendor_app/service/newlead.dart';
import 'package:krta_vendor_app/view/homepage/complete.dart';
import 'package:krta_vendor_app/view/homepage/notification.dart';
import 'package:krta_vendor_app/view/homepage/pending_process.dart';
import 'package:krta_vendor_app/view/homepage/profile_page/profile_page.dart';
import 'package:krta_vendor_app/view/homepage/settled.dart';
import 'package:krta_vendor_app/view/homepage/wallet_money/wallet.dart';
import 'package:krta_vendor_app/view/leaddetail/lead_detail.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    // Provider.of<NotificationApi>(context, listen: false).initialize();
    super.initState();
    // _requestPermissions();

    // // foreground work
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              channel.id,
              channel.name,
            )));
      }

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("A new messageOpen event was publishes");
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NotificationPage()));
        }
      });
    });

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
    TabController _tabController = TabController(length: 4, vsync: this);
    int _selectedIndex = 0;

    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text(
            'Tap back again to leave',
            style: TextStyle(fontFamily: "BwNista"),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: kPrimaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()));
                        },
                        child: const CircleAvatar(
                          backgroundColor: kWhiteColor,
                          radius: 22,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: kPrimaryColor,
                            child: Icon(
                              Icons.person,
                              color: kWhiteColor,
                              size: 30,
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 50,
                        child:
                            Image.asset("assets/images/karta-white-logo.png")),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationPage()));
                            },
                            icon: const Icon(
                              Icons.notifications_active_sharp,
                              size: 30,
                              color: kWhiteColor,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WalletPage()));
                            },
                            icon: const Icon(
                              Icons.account_balance_wallet,
                              size: 30,
                              color: kWhiteColor,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  color: kLightGreyColor,
                  height: 35,
                  child: TabBar(
                      // mouseCursor: SystemMouseCursors.noDrop,
                      physics: const ScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      // unselectedLabelStyle: const TextStyle(),
                      labelPadding: const EdgeInsets.all(5),
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          6.0,
                        ),
                        color: kPrimaryColor,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(
                          height: 40,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "New Leads",
                              style: TextStyle(
                                fontFamily: "BwNista",
                              ),
                            ),
                          ),
                        ),
                        const Tab(
                          height: 40,
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Working"),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text("Complete"),
                        ),
                        const Tab(
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Settled"),
                          ),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.83,
                child: TabBarView(controller: _tabController, children: const [
                  NewLead(),
                  PendingProcess(),
                  Complete(),
                  Settled()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewLead extends StatefulWidget {
  const NewLead({Key? key}) : super(key: key);

  @override
  _NewLeadState createState() => _NewLeadState();
}

class _NewLeadState extends State<NewLead> {
  ColorTween color = ColorTween(begin: kWhiteColor, end: Colors.orangeAccent);
  List<NewLeadModel>? _fetchNewLead;
  bool _isloaded = false;

  late TabController tabController;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      getNewLead();
    });
  }

  Future getNewLead() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var getVendorId = preferences.getString("userId");
    _fetchNewLead = await NewLeadService().fetchNewLead(getVendorId!);
    setState(() {
      _isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: _isloaded,
        child: ListView.builder(
          itemCount: _fetchNewLead?.length,
          itemBuilder: (context, index) {
            return Card(
              // color: kPrimaryColor,
              color: index % 2 == 0 ? kPrimaryColor : kLightOrangeColor,
              shadowColor: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 10, 15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        (MaterialPageRoute(
                            builder: (context) => ViewDetail(
                                  customerDetail: _fetchNewLead![index],
                                ))));
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Text(_fetchNewLead![index].name.toUpperCase(),
                            style: TextStyle(
                              color: index % 2 == 0
                                  ? kPrimaryColor
                                  : kLightOrangeColor,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Text(_fetchNewLead![index].phone,
                            style: kWhiteLrgTextStyle),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Text("Looking For " ".", style: kWhiteMdmTextStyle),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kWhiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: const Text('Are you sure to buy lead'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {},
                            //  => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Text("Buy", style: kMediumTextStyle),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
