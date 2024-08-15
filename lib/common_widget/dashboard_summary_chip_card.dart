import 'package:dashborad/common_widget/value_cell_widget.dart';
import 'package:flutter/material.dart';

class DashboardSummaryChipCard extends StatefulWidget {
  const DashboardSummaryChipCard(
      {super.key,
      required this.items,
      required this.flex,
      required this.iconData,
      required this.firstFrameTitle,
      required this.firstFrameValue,
      this.hasFirstValueHasPercentage = false,
      this.firstValuePercentage,
      required this.secondFrameTitle,
      required this.secondFrameValue,
      this.hasSecondValueHasPercentage = false,
      this.secondValuePercentage,
      this.hasThirdFrame = false,
      this.thirdFrameTitle,
      this.thirdFrameValue,
      this.hasThirdValueHasPercentage = false,
      this.thirdValuePercentage,
      required this.onOrderTypeChange,
      this.hasOrderChange = true});

  final List<String> items;
  final int flex;
  final IconData iconData;
  final String firstFrameTitle;
  final double firstFrameValue;
  final bool hasFirstValueHasPercentage;
  final double? firstValuePercentage;
  final String secondFrameTitle;
  final double secondFrameValue;
  final bool hasSecondValueHasPercentage;
  final double? secondValuePercentage;
  final bool hasThirdFrame;
  final String? thirdFrameTitle;
  final double? thirdFrameValue;
  final bool hasThirdValueHasPercentage;
  final double? thirdValuePercentage;
  final void Function(String?) onOrderTypeChange;
  final bool hasOrderChange;

  @override
  State<DashboardSummaryChipCard> createState() => _DashboardSummaryChipCardState();
}

class _DashboardSummaryChipCardState extends State<DashboardSummaryChipCard> {
  @override
  Widget build(BuildContext context) {
    String? selectedItem = widget.items.first;
    return Flexible(
      flex: widget.flex,
      child: Card(
        color: Theme.of(context).colorScheme.onPrimary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        widget.iconData,
                        color: Theme.of(context).primaryColor,
                      )),
                  (widget.hasOrderChange)
                      ? Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.zero),
                          width: 120,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              focusColor: Colors.transparent,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              value: selectedItem,
                              items: widget.items.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                              onChanged: widget.onOrderTypeChange,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueCellWidget(
                        frameTitle: widget.firstFrameTitle,
                        frameValue: widget.firstFrameValue,
                        hasValuePercentage: widget.hasFirstValueHasPercentage),
                    ValueCellWidget(
                        frameTitle: widget.secondFrameTitle,
                        frameValue: widget.secondFrameValue,
                        hasValuePercentage: widget.hasSecondValueHasPercentage),
                    (widget.hasThirdFrame)
                        ? ValueCellWidget(
                            frameTitle: widget.thirdFrameTitle ?? "",
                            frameValue: widget.thirdFrameValue ?? 0,
                            hasValuePercentage:
                                widget.hasThirdValueHasPercentage)
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
