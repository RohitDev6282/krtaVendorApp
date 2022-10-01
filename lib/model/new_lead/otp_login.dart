// To parse this JSON data, do
//
//     final otpLogin = otpLoginFromJson(jsonString);

import 'dart:convert';

OtpLogin otpLoginFromJson(String str) => OtpLogin.fromJson(json.decode(str));

String otpLoginToJson(OtpLogin data) => json.encode(data.toJson());

class OtpLogin {
  OtpLogin({
    required this.success,
    required this.token,
    required this.otp,
  });

  int success;
  String token;
  String otp;

  factory OtpLogin.fromJson(Map<String, dynamic> json) => OtpLogin(
        success: json["success"],
        token: json["token"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
        "otp": otp,
      };
}
