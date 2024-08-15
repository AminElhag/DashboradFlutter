import 'package:dashborad/common/bar_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SummaryBarChart extends StatelessWidget {
  const SummaryBarChart({super.key, required this.weeklySummary});

  final List weeklySummary;

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      sun: weeklySummary[0],
      mon: weeklySummary[1],
      tue: weeklySummary[2],
      wed: weeklySummary[3],
      thur: weeklySummary[4],
      fri: weeklySummary[5],
      sat: weeklySummary[6],
    );
    barData.init();
    return BarChart(
      BarChartData(
          maxY: 100,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getTitles,
                  reservedSize: 38,
                ),
              )),
          barGroups: barData.barData
              .map(
                (e) => BarChartGroupData(
                  x: e.x,
                  barRods: [
                    BarChartRodData(
                        toY: e.y,
                        color: Theme.of(context).colorScheme.primary,
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 100,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )),
                  ],
                ),
              )
              .toList()),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    var dateTime = DateTime.now();
    String formattedDate = DateFormat.MMMd()
        .format(dateTime.subtract(Duration(days: value.toInt())));
    Widget text = Text(formattedDate);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
