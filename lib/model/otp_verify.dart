// To parse this JSON data, do
//
//     final otpVerify = otpVerifyFromJson(jsonString);

import 'dart:convert';

OtpVerify otpVerifyFromJson(String str) => OtpVerify.fromJson(json.decode(str));

String otpVerifyToJson(OtpVerify data) => json.encode(data.toJson());

class OtpVerify {
  OtpVerify({
    required this.success,
    required this.status,
    required this.message,
    required this.vendorId,
  });

  int success;
  int status;
  String message;
  String vendorId;

  factory OtpVerify.fromJson(Map<String, dynamic> json) => OtpVerify(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        vendorId: json["vendor_id"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "vendor_id": vendorId,
      };
}
