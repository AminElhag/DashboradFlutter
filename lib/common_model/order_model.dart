import 'package:dashborad/common_model/user_model.dart';
import 'package:flutter/material.dart';

enum OrderStatus {
  newOrder(id: 0),
  pendingOrder(id: 1),
  completedOrder(id: 2),
  canceledOrder(id: 3);

  const OrderStatus({required this.id});

  final int id;

  int getId() => id;

  static List<String> getAllStatus() => ["New","Pending","Completed","Canceled"];

  static String getOrderStatus(int id) {
    if (OrderStatus.newOrder.id == id) {
      return "New";
    } else if (OrderStatus.pendingOrder.id == id) {
      return "Pending";
    } else if (OrderStatus.completedOrder.id == id) {
      return "Completed";
    } else if (OrderStatus.canceledOrder.id == id) {
      return "Canceled";
    } else {
      return "";
    }
  }

  static Color getOrderStatusColor(int id) {
    if (OrderStatus.newOrder.id == id) {
      return Colors.lightBlueAccent;
    } else if (OrderStatus.pendingOrder.id == id) {
      return Colors.orange;
    } else if (OrderStatus.completedOrder.id == id) {
      return Colors.green;
    } else if (OrderStatus.canceledOrder.id == id) {
      return Colors.red;
    } else {
      return Colors.transparent;
    }
  }
}

enum OrderType {
  homeDelivery(id: 0),
  pickUp(id: 1);

  final int id;

  const OrderType({required this.id});

  static String getOrderType(int id) {
    if (OrderType.homeDelivery.id == id) {
      return "Home Delivery";
    } else if (OrderType.pickUp.id == id) {
      return "Pick Up";
    } else {
      return "";
    }
  }
}

class OrderModel {
  final String id;
  final String date;
  final UserModel user;
  final double price;
  final int status;
  final int type;

  OrderModel(
      {required this.id,
      required this.date,
      required this.user,
      required this.price,
      required this.status,
      required this.type});

  factory OrderModel.formJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'],
      date: json['date'],
      user: json['user'],
      price: json['price'],
      status: json['status'],
      type: json['type']);
}
