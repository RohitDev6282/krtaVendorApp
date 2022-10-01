// To parse this JSON data, do
//
//     final settledLead = settledLeadFromJson(jsonString);

import 'dart:convert';

List<SettledLead> settledLeadFromJson(String str) => List<SettledLead>.from(
    json.decode(str).map((x) => SettledLead.fromJson(x)));

String settledLeadToJson(List<SettledLead> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SettledLead {
  SettledLead({
    required this.name,
    required this.email,
    required this.phone,
    required this.completeAddress,
  });

  String name;
  String email;
  String phone;
  String completeAddress;

  factory SettledLead.fromJson(Map<String, dynamic> json) => SettledLead(
        name: json["name"],
        email: json["email "],
        phone: json["phone"],
        completeAddress: json["complete_address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email ": email,
        "phone": phone,
        "complete_address": completeAddress,
      };
}
