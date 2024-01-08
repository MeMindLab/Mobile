import 'package:flutter/material.dart';

import 'package:me_mind/common/component/date_picker.dart';

class ReportDateSearchBar extends StatelessWidget {
  const ReportDateSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const DatePicker(
      selectedDate: null,
    );
  }
}
