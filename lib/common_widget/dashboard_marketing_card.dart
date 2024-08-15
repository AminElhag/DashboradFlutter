import 'package:dashborad/common_widget/marking_pie_chart.dart';
import 'package:flutter/material.dart';

class DashboardMarketingCard extends StatelessWidget {
  const DashboardMarketingCard({
    super.key,
    required this.items,
    this.title = "Marketing",
    this.firstTitle = "Acquisition",
    this.firstValue = 0,
    this.firstColor = Colors.blueAccent,
    this.secondTitle = "Purchase",
    this.secondValue = 0,
    this.secondColor = Colors.indigo,
    this.thirdTitle = "Retention",
    this.thirdValue = 0,
    this.thirdColor = Colors.amber,
  });

  final List<String> items;
  final String title;
  final String firstTitle;
  final double firstValue;
  final Color firstColor;
  final String secondTitle;
  final double secondValue;
  final Color secondColor;
  final String thirdTitle;
  final double thirdValue;
  final Color thirdColor;

  @override
  Widget build(BuildContext context) {
    var selectedItem = items.first;
    return Flexible(
      flex: 1,
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
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration:
                        const BoxDecoration(borderRadius: BorderRadius.zero),
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        focusColor: Colors.transparent,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        value: selectedItem,
                        items: items.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 12),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: firstColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(firstTitle),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: secondColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(secondTitle),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: thirdColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(thirdTitle),
                    ],
                  ),
                  const SizedBox(
                    width: 6,
                  )
                ],
              ),
              Flexible(flex: 2, child: MarketingPieChart(
                firstRate: firstValue,
                firstColor: firstColor,
                secondRate: secondValue,
                secondColor: secondColor,
                thirdRate: thirdValue,
                thirdColor: thirdColor,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
