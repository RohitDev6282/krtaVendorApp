// To parse this JSON data, do
//
//     final newLeadModel = newLeadModelFromJson(jsonString);

import 'dart:convert';

List<NewLeadModel> newLeadModelFromJson(String str) => List<NewLeadModel>.from(
    json.decode(str).map((x) => NewLeadModel.fromJson(x)));

String newLeadModelToJson(List<NewLeadModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewLeadModel {
  NewLeadModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.completeAddress,
  });

  String name;
  String email;
  String phone;
  String completeAddress;

  factory NewLeadModel.fromJson(Map<String, dynamic> json) => NewLeadModel(
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
