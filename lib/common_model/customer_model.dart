import 'package:flutter/material.dart';

enum CustomerStatus {
  newUser(id: 0),
  active(id: 1),
  inActive(id: 2),
  block(id: 3),
  deleted(id: 4);

  final int id;

  const CustomerStatus({required this.id});

  int getId() => id;

  static List<String> getAllStatus() =>
      ["New", "Active", "In-Active", "Blocked", "Deleted"];

  static String getStatus(int id) {
    if (CustomerStatus.newUser.id == id) {
      return "New";
    } else if (CustomerStatus.active.id == id) {
      return "Active";
    } else if (CustomerStatus.inActive.id == id) {
      return "In-Active";
    } else if (CustomerStatus.block.id == id) {
      return "Blocked";
    } else if (CustomerStatus.deleted.id == id) {
      return "Deleted";
    } else {
      return "";
    }
  }

  static Color getStatusColor(int id) {
    if (CustomerStatus.newUser.id == id) {
      return Colors.lightBlue;
    } else if (CustomerStatus.active.id == id) {
      return Colors.blue;
    } else if (CustomerStatus.inActive.id == id) {
      return Colors.orange;
    } else if (CustomerStatus.block.id == id) {
      return Colors.deepOrange;
    } else if (CustomerStatus.deleted.id == id) {
      return Colors.red;
    } else {
      return Colors.transparent;
    }
  }
}

class CustomerModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String createdAt;
  final double numberOfOrders;
  final double totalSpend;
  final int status;

  CustomerModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.numberOfOrders,
    required this.totalSpend,
    required this.status,
  });

  factory CustomerModel.formJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        createdAt: json['create_at'],
        numberOfOrders: json['number_of_orders'],
        totalSpend: json['total_spend'],
        status: json['status'],
      );
}
