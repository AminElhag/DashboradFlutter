import 'package:dashborad/common_widget/summary_bar_chart.dart';
import 'package:flutter/material.dart';

class DashboardSummarySliceCard extends StatelessWidget {
  const DashboardSummarySliceCard({
    super.key,
    required this.timeSlicesItems,
    required this.flutterSlicesItems,
    this.title = "Summary",
    required this.values,
  });

  final List<String> timeSlicesItems;
  final List<String> flutterSlicesItems;
  final String title;
  final List<double> values;

  @override
  Widget build(BuildContext context) {
    var selectedTime = timeSlicesItems.first;
    var selectedType = flutterSlicesItems.first;
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
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2)),
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
                            value: selectedType,
                            items: flutterSlicesItems.map((item) {
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
                      ),
                    ],
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
                        value: selectedTime,
                        items: timeSlicesItems.map((item) {
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
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Flexible(
                  flex: 2,
                  child: SummaryBarChart(
                    weeklySummary: values,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
