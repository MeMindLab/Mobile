import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 14,
  );

  switch (value.toInt()) {
    case 0:
      return const Text('11/30', style: style);
    case 2:
      return const Text('11/31', style: style);
    case 4:
      return const Text('12/1', style: style);
    case 6:
      return const Text('12/2', style: style);
    case 8:
      return const Text('12/3', style: style);
    case 10:
      return const Text('12/4', style: style);
    case 12:
      return const Text('12/5', style: style);
    default:
      return const SizedBox.shrink();
  }
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xFF191919),
    fontSize: 14,
  );

  String text;
  switch (value.toInt()) {
    case 3:
      text = '50';
      break;
    case 6:
      text = '100';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.center);
}

List<Color> gradientBarColors = [
  Colors.blue,
  Colors.lightBlue,
];

List<Color> customGradientColors = [
  const Color(0xFF94BFFF),
  const Color(0xFF0085FF),
  const Color(0xFFCDDEFF),
];

class ReportChart extends StatelessWidget {
  const ReportChart({
    super.key,
  });

  LineChartData mainData({required Color borderColor}) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: borderColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(strokeWidth: 1, color: borderColor);
        },
      ),
      titlesData: const FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: borderColor),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 2.5),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(12, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientBarColors,
          ),
          barWidth: 6,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: customGradientColors
                  .map((color) => color.withOpacity(0.48))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color borderColor = Color(0xFFC4C8D6);
    return LineChart(
      mainData(borderColor: borderColor),
    );
  }
}
