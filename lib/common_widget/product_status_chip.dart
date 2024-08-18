import 'package:dashborad/common_model/product_model.dart';
import 'package:flutter/material.dart';

class ProductStatusChip extends StatelessWidget {
  const ProductStatusChip({super.key, required this.status});

  final int status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
          color: ProductStatus.getStatusColor(status).withOpacity(0.2),
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            ProductStatus.getStatus(status),
            style: TextStyle(
              color: ProductStatus.getStatusColor(
                status,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
