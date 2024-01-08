import "package:easy_localization/easy_localization.dart";
import "package:flutter/cupertino.dart";

class BirthDatePicker extends StatelessWidget {
  final void Function(DateTime) onDateTimeChanged;
  final String initDateStr;

  const BirthDatePicker(
      {super.key, required this.onDateTimeChanged, required this.initDateStr});

  @override
  Widget build(BuildContext context) {
    final initDate = DateFormat('yyyy-MM-dd').parse(initDateStr);

    return SizedBox(
      height: 300,
      child: CupertinoDatePicker(
        minimumYear: 1900,
        maximumYear: DateTime.now().year,
        initialDateTime: initDate,
        maximumDate: DateTime.now(),
        onDateTimeChanged: onDateTimeChanged,
        mode: CupertinoDatePickerMode.date,
      ),
    );
  }
}
