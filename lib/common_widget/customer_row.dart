import 'package:dashborad/common/date_extension.dart';
import 'package:dashborad/common/extension.dart';
import 'package:dashborad/common_model/customer_model.dart';
import 'package:dashborad/common_widget/customer_status_chip.dart';
import 'package:flutter/material.dart';

class CustomerRow extends StatefulWidget {
  const CustomerRow(
      {super.key, required this.isChecked, required this.customer});

  final bool isChecked;
  final CustomerModel customer;

  @override
  State<CustomerRow> createState() => _CustomerRowState();
}

class _CustomerRowState extends State<CustomerRow> {
  bool isChecked = false;
  var textStyle = const TextStyle(fontWeight: FontWeight.w300);

  @override
  Widget build(BuildContext context) {
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
                      widget.customer.fullName,
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
                child: Row(
                  children: [
                    Text(
                      widget.customer.email,
                      style: textStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: context.width / 7,
              child: SizedBox(
                width: 200,
                child: Row(
                  children: [
                    Text(
                      widget.customer.phone,
                      style: textStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: context.width / 7,
              child: Text(
                widget.customer.numberOfOrders.toString(),
                style: textStyle,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: context.width / 7,
              child: Text(
                "${widget.customer.totalSpend}\$",
                style: textStyle,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: context.width / 7,
              child: Text(
                DateExtension.getFullDateFromString(widget.customer.createdAt),
                style: textStyle,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: CustomerStatusChip(
              status: widget.customer.status,
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
