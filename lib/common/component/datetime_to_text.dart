import 'package:easy_localization/easy_localization.dart';

String datetimeType1() {
  return DateFormat('M월 d일(EE)').format(DateTime.now());
}

String datetimeType2() {
  return DateFormat.jm().format(DateTime.now());
}
