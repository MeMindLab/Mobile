import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:me_mind/report/model/report_weekly/report_weekly_model.dart';

class WeeklyFlChartData {
  List<String> getDates({required List<String> dates}) {
    List<String> newDates = [...dates];
    DateFormat dateFormat = DateFormat('MM/dd');

    if (newDates.isEmpty) {
      newDates.add(dateFormat.format(DateTime.now()));
    }

    String lastDateString = newDates.last;
    DateTime lastDate = dateFormat.parse(lastDateString);

    int i = 1;
    while (newDates.length < 7) {
      DateTime newDate = lastDate.add(Duration(days: i));
      newDates.add(dateFormat.format(newDate));
      i++;
    }

    return newDates;
  }

  List<FlSpot> getScore({required ReportWeeklyModel weeklymodel}) {
    List<TodayScore> newData =
        weeklymodel.results!.length == 0 ? [] : weeklymodel.results!;

    int totalLength = newData.length > 7 ? 7 : newData.length;
    List<TodayScore> newBox = newData.take(7).toList();

    // List<String> dates = newBox.map((item) => item.date).toList();
    List<FlSpot> flSpots = [];
    for (int i = 0; i < newBox.length; i++) {
      flSpots.add(FlSpot(
          (i * 2).toDouble(), newBox[i].score < 0 ? 0 : newBox[i].score / 20));
    }

    return flSpots;
  }
}
