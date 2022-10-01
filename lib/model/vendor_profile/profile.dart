// To parse this JSON data, do
//
//     final vendorProfile = vendorProfileFromJson(jsonString);

import 'dart:convert';

List<VendorProfile> vendorProfileFromJson(String str) =>
    List<VendorProfile>.from(
        json.decode(str).map((x) => VendorProfile.fromJson(x)));

String vendorProfileToJson(List<VendorProfile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VendorProfile {
  VendorProfile({
    required this.vendorName,
    required this.vendorMobile,
    required this.vendorEmail,
    required this.businessName,
    required this.businessEmail,
    required this.businessPhone,
    required this.profilePic,
  });

  String vendorName;
  String vendorMobile;
  String vendorEmail;
  String businessName;
  String businessEmail;
  String businessPhone;
  String profilePic;

  factory VendorProfile.fromJson(Map<String, dynamic> json) => VendorProfile(
        vendorName: json["vendor_name"],
        vendorMobile: json["vendor_mobile "],
        vendorEmail: json["vendor_email"],
        businessName: json["business_name"],
        businessEmail: json["business_email"],
        businessPhone: json["business_phone"],
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "vendor_name": vendorName,
        "vendor_mobile ": vendorMobile,
        "vendor_email": vendorEmail,
        "business_name": businessName,
        "business_email": businessEmail,
        "business_phone": businessPhone,
        "profile_pic": profilePic,
      };
}
