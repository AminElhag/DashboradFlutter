import 'dart:core';

import 'package:flutter/material.dart';

class ValueCellWidget extends StatelessWidget {
  const ValueCellWidget({
    super.key,
    required this.frameTitle,
    required this.frameValue,
    required this.hasValuePercentage,
    this.valuePercentage,
  });

  final String frameTitle;
  final double frameValue;
  final bool hasValuePercentage;
  final double? valuePercentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          frameTitle,
          style: TextStyle(color: Theme.of(context).colorScheme.outline),
        ),
        Row(
          children: [
            Text("\$ $frameValue"),
            const SizedBox(
              width: 2,
            ),
            (hasValuePercentage)
                ? (valuePercentage != null)
                    ? (!valuePercentage!.isNegative)
                        ? Text(
                            "+$valuePercentage",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.green),
                          )
                        : Text(
                            "-$valuePercentage",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.red),
                          )
                    : const SizedBox()
                : const SizedBox()
          ],
        ),
      ],
    );
  }
}
