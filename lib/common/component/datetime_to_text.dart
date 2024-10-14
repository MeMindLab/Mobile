import 'package:easy_localization/easy_localization.dart';

String datetimeType1({String? date}) {
  if (date != null) {
    DateTime dateTime = DateFormat("yyyy-MM-dd").parse(date);
    return DateFormat('M월 d일(EE)').format(dateTime);
  }
  return DateFormat('M월 d일(EE)').format(DateTime.now());
}

String datetimeType2() {
  return DateFormat.jm().format(DateTime.now());
}

String datetimeType3() {
  return DateFormat('yyyy-MM-dd').format(DateTime.now());
}

String chatAddDateTimeType(String? time) {
  DateTime dateTime = time == null ? DateTime.now() : DateTime.parse(time);

  String msgTime = DateFormat('hh:mm a').format(dateTime.toLocal());
  return msgTime;
}
