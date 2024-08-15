import 'package:dashborad/common/date_extension.dart';
import 'package:dashborad/common_model/order_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.model});

  final OrderModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(DateExtension.getTheYearFormString(model.date)
                      .toString()),
                  Text(DateExtension.getTheMonthFromString(model.date)),
                  Text(
                      DateExtension.getTheDayFromString(model.date).toString()),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Order"),
                      InkWell(
                        onSecondaryTapUp: (details) {
                          if (kDebugMode) {
                            print(model.id);
                          }
                        },
                        child: Text(
                          "#${model.id}",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                  Text(model.user.fullName),
                  Text(model.user.email),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [const Text("Total"), Text("${model.price}\$")],
              ),
            ),
            Flexible(
                flex: 2,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: OrderStatus.getOrderStatusColor(model.status).withOpacity(0.2),
                    borderRadius: BorderRadiusDirectional.circular(10)
                  ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(OrderStatus.getOrderStatus(model.status),style: TextStyle(color: OrderStatus.getOrderStatusColor(model.status)),),
                      ),
                    ))),
            const SizedBox(
              width: 6,
            )
          ],
        ),
        const Divider()
      ],
    );
  }
}
