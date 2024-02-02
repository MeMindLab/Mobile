import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitleWidgets(
    double value, TitleMeta meta, List<Map<String, String>> weekly) {
  const style = TextStyle(
    fontSize: 14,
  );

  int index = value.toInt();
  int weeklyIndex = (index ~/ 2) % weekly.length;

  if (index % 2 == 0 && index >= 0 && index <= 12) {
    String date = weekly[weeklyIndex]['date']!;

    // 날짜 형식을 원하는 형태로 변경
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = '${dateTime.month}/${dateTime.day}';

    return Text(formattedDate, style: style);
  } else {
    return const SizedBox.shrink();
  }
}

Widget leftTitleWidgets(
    double value, TitleMeta meta, List<Map<String, String>> weekly) {
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
  final List<Map<String, String>> weekly;

  const ReportChart({
    super.key,
    required this.weekly,
  });

  LineChartData mainData({required Color borderColor}) {
    List<FlSpot> spots = [];
    for (int i = 0; i < weekly.length; i++) {
      double x = i * 2.0;
      double score = double.parse(weekly[i]['score']!);
      double y = (score / 100) * 6;
      y = double.parse(y.toStringAsFixed(2));

      spots.add(FlSpot(x, y));
    }

    print(spots);

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
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) =>
                bottomTitleWidgets(value, meta, weekly),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) =>
                leftTitleWidgets(value, meta, weekly),
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
          spots: spots,
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
