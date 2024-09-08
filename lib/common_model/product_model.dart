import 'package:flutter/material.dart';

enum ProductStatus {
  published(id: 0),
  unpublished(id: 1);

  const ProductStatus({required this.id});

  final int id;

  int getId() => id;

  static List<String> getAllStatus() => ["Published", "Unpublished"];

  static String getStatus(int id) {
    if (ProductStatus.published.id == id) {
      return "Published";
    } else if (ProductStatus.unpublished.id == id) {
      return "Unpublished";
    } else {
      return "";
    }
  }

  static Color getStatusColor(int id) {
    if (ProductStatus.published.id == id) {
      return Colors.blue;
    } else if (ProductStatus.unpublished.id == id) {
      return Colors.amber;
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

class ProductModel {
  final String id;
  final String name;
  final List<String> images;
  final String category;
  final double sellingPrice;
  final double costPrice;
  final double inStock;
  final double discount;
  final int status;

  ProductModel({
    required this.id,
    required this.name,
    required this.images,
    required this.category,
    required this.sellingPrice,
    required this.costPrice,
    required this.inStock,
    required this.discount,
    required this.status,
  });

  factory ProductModel.formJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        images: json['images'],
        category: json['category'],
        sellingPrice: json['selling_price'],
        costPrice: json['cost_price'],
        inStock: json['in_stock'],
        discount: json['discount'],
        status: json['status'],
      );
}
