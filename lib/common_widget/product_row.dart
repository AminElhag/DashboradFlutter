import 'package:dashborad/common/extension.dart';
import 'package:dashborad/common_model/product_model.dart';
import 'package:flutter/material.dart';

import 'product_status_chip.dart';

class ProductRow extends StatefulWidget {
  const ProductRow({super.key, required this.isChecked, required this.product});

  final bool isChecked;
  final ProductModel product;

  @override
  State<ProductRow> createState() => _ProductRowState();
}

class _ProductRowState extends State<ProductRow> {
  bool isChecked = false;
  final List<String> _list = ProductStatus.getAllStatus();
  var textStyle = const TextStyle(fontWeight: FontWeight.w300);

  @override
  Widget build(BuildContext context) {
    final double totalValue =
        (widget.product.inStock * widget.product.price).roundToDouble();
    String selectedItem = ProductStatus.getStatus(widget.product.status);
    return SizedBox(
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 8,
            child: SizedBox(
              width: context.width / 8,
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
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: NetworkImage(
                        widget.product.images.first,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  SizedBox(
                    child: Text(
                      widget.product.name,
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
            flex: 3,
            child: SizedBox(
              width: context.width / 8,
              child: Text(
                widget.product.category,
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: SizedBox(
              width: context.width / 8,
              child: Text(
                "${widget.product.price}\$",
                style: textStyle,
                maxLines: 1,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: SizedBox(
              width: context.width / 8,
              child: Text(
                "${widget.product.inStock.toInt()}",
                style: textStyle,
                maxLines: 1,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: SizedBox(
              width: context.width / 8,
              child: Text(
                "${widget.product.discount}\$",
                style: textStyle,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: SizedBox(
              width: context.width / 8,
              child: Text(
                "$totalValue\$",
                style: textStyle,
              ),
            ),
          ),
          Flexible(
            flex: 4,
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
          Flexible(
            flex: 8,
            child: ProductStatusChip(
              status: widget.product.status,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
        ],
      ),
    );
  }
}
