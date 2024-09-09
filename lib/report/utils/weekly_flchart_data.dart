import 'package:easy_localization/easy_localization.dart';

class WeeklyFlChartData {
  List<String> getDates({required List<String> dates}) {
    DateFormat dateFormat = DateFormat('MM/dd');
    if (dates.isEmpty) {
      dates.add(dateFormat.format(DateTime.now()));
    }
    String lastDateString = dates.last;
    DateTime lastDate = dateFormat.parse(lastDateString);

    for (int i = 1; i < 7 - dates.length + 1; i++) {
      DateTime newDate = lastDate.add(Duration(days: i));
      dates.add(dateFormat.format(newDate));
    }
    print(dates);

    return dates;
  }
}
