import 'package:flutter/material.dart';
import 'package:krta_vendor_app/constant/constant.dart';
import 'package:krta_vendor_app/model/vendor_profile/profile.dart';
import 'package:krta_vendor_app/service/profile_api.dart';
import 'package:krta_vendor_app/view/auth/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<VendorProfile>? _getVendorData;
  String finalId = "";

  bool _isloaded = false;

  String text = "";

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future getdata() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var getVendorId = preferences.getString("userId");
    _getVendorData = await Profile().UserfetchContent(getVendorId!);
    if (_getVendorData != null) {
      setState(() {
        _isloaded = true;
      });
    }
  }

  Future _logOutUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("userId");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Visibility(
        visible: _isloaded,
        child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: _getVendorData?.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: kBlClr,
                                )),
                            const SizedBox(
                              width: 110,
                            ),
                            Text(
                              "Profile Page",
                              style: kBLrgTextStyle,
                            ),
                            // IconButton(
                            //     onPressed: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) =>
                            //                   ProfileEditingPage()));
                            //     },
                            //     icon: const Icon(
                            //       Icons.edit,
                            //       color: kBlClr,
                            //     )),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: size.width / 2.7,
                                  height: size.width / 2.7,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kPrimaryColor, width: 2),
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            _getVendorData![index].profilePic)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        userDetailField(
                          text: _getVendorData![index].vendorName,
                          hinttext: 'Name',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        userDetailField(
                          text: _getVendorData![index].vendorEmail,
                          hinttext: 'Email Address',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        userDetailField(
                          text: _getVendorData![index].vendorMobile,
                          hinttext: 'Contact No.',
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        userDetailField(
                          text: _getVendorData![index].businessName,
                          hinttext: "Business Name",
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        userDetailField(
                          text: _getVendorData![index].businessEmail,
                          hinttext: "Business Email Address",
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        userDetailField(
                          text: _getVendorData![index].businessPhone,
                          hinttext: "Business Contact No.",
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            side: const BorderSide(
                                width: 2.5, color: Colors.white),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                          ),
                          onPressed: () {
                            _logOutUser();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "LogOut",
                              style: kWhiteLrgTextStyle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          height: 10,
                        ),
                        // const SettingPage(),
                      ],
                    ),
                  ],
                ),
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      )),
    );
  }
}

// ignore: camel_case_types
class userDetailField extends StatelessWidget {
  final String hinttext;
  final String text;

  const userDetailField({
    Key,
    required this.hinttext,
    key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: ListTile(
            title: Text(
              hinttext,
              style: kBlackSmlTextStyle,
            ),
            subtitle: Text(
              text,
              style: kBLrgTextStyle,
            )));
  }
}
