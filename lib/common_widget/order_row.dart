import 'package:dashborad/common/date_extension.dart';
import 'package:dashborad/common/extension.dart';
import 'package:dashborad/common_model/order_model.dart';
import 'package:dashborad/common_widget/order_status_chip.dart';
import 'package:flutter/material.dart';

class OrderRow extends StatefulWidget {
  const OrderRow({super.key, required this.isChecked, required this.order});

  final bool isChecked;
  final OrderModel order;

  @override
  State<OrderRow> createState() => _OrderRowState();
}

class _OrderRowState extends State<OrderRow> {
  bool isChecked = false;
  final List<String> _list = OrderStatus.getAllStatus();
  var textStyle = const TextStyle(fontWeight: FontWeight.w300);

  @override
  Widget build(BuildContext context) {
    String selectedItem = OrderStatus.getOrderStatus(widget.order.status);
    return SizedBox(
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              width: context.width / 7,
              child: Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: context.width / 11,
                    child: Text(
                      widget.order.user.fullName,
                      style: textStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: context.width / 7,
              child: SizedBox(
                width: 200,
                child: Text(
                  DateExtension.getFullDateFromString(widget.order.date),
                  style: textStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: context.width / 7,
              child: Text(
                OrderType.getOrderType(widget.order.type),
                style: textStyle,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: context.width / 7,
              child: Row(
                children: [
                  Text(
                    widget.order.id,
                    style: textStyle,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.file_copy_outlined,
                      size: 16,
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: context.width / 7,
              child: Text(
                "${widget.order.price}\$",
                style: textStyle,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: 100,
              child: DropdownButtonFormField(
                isExpanded: true,
                focusColor: Colors.transparent,
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                value: selectedItem,
                items: _list.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: textStyle,
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedItem = newValue!;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            flex: 1,
            child: OrderStatusChip(
              status: widget.order.status,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
