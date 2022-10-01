// To parse this JSON data, do
//
//     final workingLead = workingLeadFromJson(jsonString);

import 'dart:convert';

List<WorkingLead> workingLeadFromJson(String str) => List<WorkingLead>.from(
    json.decode(str).map((x) => WorkingLead.fromJson(x)));

String workingLeadToJson(List<WorkingLead> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkingLead {
  WorkingLead({
    required this.name,
    required this.email,
    required this.phone,
    required this.completeAddress,
  });

  String name;
  String email;
  String phone;
  String completeAddress;

  factory WorkingLead.fromJson(Map<String, dynamic> json) => WorkingLead(
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
