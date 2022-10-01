// To parse this JSON data, do
//
//     final completeLead = completeLeadFromJson(jsonString);

import 'dart:convert';

List<CompleteLead> completeLeadFromJson(String str) => List<CompleteLead>.from(
    json.decode(str).map((x) => CompleteLead.fromJson(x)));

String completeLeadToJson(List<CompleteLead> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompleteLead {
  CompleteLead({
    required this.name,
    required this.email,
    required this.phone,
    required this.completeAddress,
  });

  String name;
  String email;
  String phone;
  String completeAddress;

  factory CompleteLead.fromJson(Map<String, dynamic> json) => CompleteLead(
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
