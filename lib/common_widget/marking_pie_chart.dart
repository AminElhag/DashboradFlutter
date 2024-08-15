import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MarketingPieChart extends StatefulWidget {
  const MarketingPieChart({
    super.key,
    required this.firstRate,
    required this.firstColor,
    required this.secondRate,
    required this.secondColor,
    required this.thirdRate,
    required this.thirdColor,
  });

  final double firstRate;
  final Color firstColor;
  final double secondRate;
  final Color secondColor;
  final double thirdRate;
  final Color thirdColor;

  @override
  State<StatefulWidget> createState() => MarkingPieChart();
}

class MarkingPieChart extends State<MarketingPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: true,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      final sum = widget.firstRate + widget.secondRate + widget.thirdRate;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: (sum != 0) ? widget.firstColor : Colors.grey,
            value: (sum != 0) ? widget.firstRate : 33.33,
            title: "${widget.firstRate}%",
            showTitle: isTouched,
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: widget.secondColor,
            value: widget.secondRate,
            title: "${widget.secondRate}%",
            showTitle: isTouched,
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: widget.thirdColor,
            showTitle: isTouched,
            value: widget.thirdRate,
            title: "${widget.thirdRate}%",
            radius: radius,
          );
        default:
          throw Error();
      }
    });
  }
}
