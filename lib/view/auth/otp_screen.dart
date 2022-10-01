import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:krta_vendor_app/constant/constant.dart';
import 'package:krta_vendor_app/model/new_lead/otp_login.dart';
import 'package:krta_vendor_app/model/otp_verify.dart';
import 'package:krta_vendor_app/view/homepage/homepage.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  final String mobileNumber;
  final String otp;
  final String token;
  const OtpScreen({
    Key? key,
    required this.mobileNumber,
    required this.otp,
    required this.token,
  }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late ScaffoldMessengerState scaffoldMessenger;
  bool _isLoading = false;
  List<OtpLogin> finalotpResponse = [];
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "We have sent a OTP  on your Mobile no.${widget.mobileNumber}",
                textAlign: TextAlign.center,
                style: kWtXtaTstSte,
              ),
              Column(children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  "Enter OTP Here",
                  style: kWhiteMdmTextStyle,
                ),
                Text(
                  "OTP is " + widget.otp,
                  style: kWhiteMdmTextStyle,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 20),
                      child: PinFieldAutoFill(
                          keyboardType: TextInputType.number,
                          decoration: const UnderlineDecoration(
                            lineHeight: 4,
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: kWhiteColor),
                            colorBuilder: FixedColorBuilder(kWhiteColor),
                          ),
                          // currentCode: authService
                          //     .loginMobileOTP, // prefill with a code
                          // onCodeSubmitted: (_) async {
                          //   authService.login(
                          //       context, _scaffoldKey);
                          // },
                          // onCodeChanged: (value) {
                          //   authService.loginMobileOTP =
                          //       value;
                          // },
                          controller: _otpController,
                          codeLength: 4 //code length, default 6
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "Didn't Receive OTP",
                        style: kWhiteLrgTextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kWhiteColor,
                    side: const BorderSide(width: 2.5, color: Colors.white),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  onPressed: () async {
                    // if (_formkey.currentState!.validate()) {
                    _otpVerify(_otpController.text);
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(18, 6, 18, 6),
                    child: Text(
                      'VERIFY',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ]),
            ],
          ),
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

  Future<OtpVerify?> _otpVerify(String otp) async {
    Map data = {'token': widget.token, 'otp': otp};
    print(data);
    var response = await http
        .post(Uri.parse("https://kartaa.in/api/otp-verify.php"), body: data);
    var verifyRes = json.decode(response.body);
    print(verifyRes);
    if (verifyRes["success"] == 200) {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      Map<String, dynamic> localUser = verifyRes;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("userId", localUser["vendor_id"]);
    } else if (verifyRes["success"] == 401) {
      setState(() {
        _isLoading = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(verifyRes["message"].toString()),
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
