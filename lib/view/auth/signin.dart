import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krta_vendor_app/constant/constant.dart';
import 'package:krta_vendor_app/model/new_lead/otp_login.dart';
import 'package:krta_vendor_app/service/api_cofig.dart';
import 'package:krta_vendor_app/view/auth/otp_screen.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isValid = false;

  late ScaffoldMessengerState scaffoldMessenger;
  bool _isLoading = true;
  final TextEditingController _mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                )),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Proceed with your login",
                  style: TextStyle(color: kWhiteColor, fontSize: 28),
                )),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                keyboardType: TextInputType.number,
                // onSaved: (input) => requestModel.mobile,

                controller: _mobileController,
                onChanged: (text) {
                  // value = text;
                },
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Mobile no.is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your mobile No.',

                  hintStyle: kWhiteLrgTextStyle,

                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(color: kWhiteColor, width: 3)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 3),
                  ),
                  // prefixIcon: Icon(
                  //   Icons.mobile_friendly_rounded,
                  //   color: Colors.grey[400],
                  //   size: 25,
                  // ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kWhiteColor,
                  side: const BorderSide(width: 2.5, color: Colors.white),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  if (_mobileController.text.isEmpty) {
                    scaffoldMessenger.showSnackBar(const SnackBar(
                        content: Text("Please Fill all fileds")));
                    return;
                  }
                  _login(
                    _mobileController.text,
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Text("SEND",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ]),
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpeg')),
          ),
        ),
      ),
    );
  }

  Future<OtpLogin?> _login(
    String mobile,
  ) async {
    Map data = {
      'mobile': mobile,
    };
    var response = await http.post(Uri.parse(Config.otpLogin), body: data);
    var otpResponse = json.decode(response.body);
    print(otpResponse);
    if (otpResponse["success"] == 200) {
      setState(() {
        _isLoading = false;
      });
      Map<String, dynamic> localUser = otpResponse;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(
                  mobileNumber: _mobileController.text,
                  token: localUser["token"],
                  otp: localUser["otp"])));
      // return otpLoginFromJson(otpResponse);
    } else if (otpResponse["success"] == 401) {
      setState(() {
        _isLoading = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(otpResponse["message"].toString()),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
