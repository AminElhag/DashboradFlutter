import 'package:dashborad/common_model/customer_model.dart';
import 'package:flutter/material.dart';


class CustomerStatusChip extends StatelessWidget {
  const CustomerStatusChip({super.key, required this.status});

  final int status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
          color: CustomerStatus.getStatusColor(status).withOpacity(0.2),
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            CustomerStatus.getStatus(status),
            style: TextStyle(
              color: CustomerStatus.getStatusColor(
                status,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
