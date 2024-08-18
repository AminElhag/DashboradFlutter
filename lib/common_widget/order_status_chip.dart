import 'package:flutter/material.dart';

import '../common_model/order_model.dart';

class OrderStatusChip extends StatelessWidget {
  const OrderStatusChip({super.key, required this.status});

  final int status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
          color: OrderStatus.getOrderStatusColor(status).withOpacity(0.2),
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            OrderStatus.getOrderStatus(status),
            style: TextStyle(
              color: OrderStatus.getOrderStatusColor(
                status,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
