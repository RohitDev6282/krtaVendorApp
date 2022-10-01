import 'package:flutter/material.dart';
import 'package:krta_vendor_app/view/homepage/homepage.dart';

// Future<void> share(dynamic link, String title) async {
//   await Share.share(
//       // 'https://play.google.com/store/apps/details?id=com.AanaxagorasR.AanaxagorasR');
// }

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('xxxxxxx'),
          accountEmail: Text('xxxxs645@gmail.com'),
          currentAccountPicture: GestureDetector(
            onTap: () {},
            // => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => ProfileScreen())),
            child: CircleAvatar(
                backgroundImage:
                    AssetImage('android/Assests/Images/Employee.png')),
          ),
          // decoration: new BoxDecoration(color: Colors.blue),
        ),
        // height: 180,
        // width: MediaQuery.of(context).size.width,
        // //    color: Colors.blue[900],
        // child: Image.asset("android/Assests/Images/Officeimage.jpg")),
        ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            leading: Icon(
              Icons.home,
              color: Colors.deepOrange[300],
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.blue[900],
              ),
            )),
        // Divider(
        //   color: Colors.blue,
        //   thickness: 1,
        // ),
        ListTile(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
            leading: const Icon(
              Icons.person,
              color: Colors.black,
              //color: Colors.,
            ),
            title: Text(
              "About Us",
              style: TextStyle(
                color: Colors.blue[900],
              ),
            )),
        // Divider(
        //   color: Colors.blue,
        //   thickness: 1,
        // ),
        ListTile(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ContactUs()));
            },
            leading: const Icon(
              Icons.contact_phone,
              color: Colors.blue,
            ),
            title: Text(
              "Contact Us",
              style: TextStyle(
                color: Colors.blue[900],
              ),
            )),
        // Divider(
        //   color: Colors.blue,
        //   thickness: 1,
        // ),
        ListTile(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => PrivacyPolicy()));
            },
            leading: const Icon(
              Icons.privacy_tip,
              color: Colors.green,
            ),
            title: Text(
              "Privacy Policy",
              style: TextStyle(
                color: Colors.blue[900],
              ),
            )),
        // Divider(
        //   color: Colors.blue,
        //   thickness: 1,
        // ),
        ListTile(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => TermAndCondition()));
            },
            leading: const Icon(
              Icons.security,
              color: Colors.black,
            ),
            title: Text(
              "Term & Condition",
              style: TextStyle(
                color: Colors.blue[900],
              ),
            )),
        // Divider(
        //   color: Colors.blue,
        //   thickness: 1,
        // ),
        ListTile(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => UserGuide()));
            },
            leading: const Icon(
              Icons.perm_device_information,
              color: Colors.red,
            ),
            title: Text(
              "User Guidance",
              style: TextStyle(
                color: Colors.blue[900],
              ),
            )),
        // Divider(
        //   color: Colors.blue,
        //   thickness: 1,
        // ),
        ListTile(
          onTap: () {
            // Share.share(
            //     'https://play.google.com/store/apps/details?id=com.AanaxagorasR.AanaxagorasR');
          },
          leading: const Icon(
            Icons.share,
            color: Colors.blue,
          ),
          title: Text(
            'Share',
            style: TextStyle(color: Colors.blue[900]),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        // Divider(
        //   color: Colors.blue,
        //   thickness: 1,
        // ),
        ListTile(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Login()));
            },
            leading: const Icon(
              Icons.logout,
              color: Colors.green,
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                color: Colors.blue[900],
              ),
            )),
      ]),
      // decoration:const BoxDecoration(
      //   color: Colors.white,
      //   image: DecorationImage(
      //       fit: BoxFit.cover,
      //       image: AssetImage('android/Assests/Images/bckg5.jpg')),
      // ),
    );
  }
}
