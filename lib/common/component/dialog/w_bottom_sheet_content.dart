import 'package:flutter/material.dart';

import 'package:me_mind/common/constant/font_sizes.dart';

class BottomSheetContent extends StatelessWidget {
  final String title;
  final String body;
  final Widget action;

  const BottomSheetContent({
    super.key,
    required this.title,
    required this.body,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 18, 30, 25),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: FontSizes.getHeadline1Style()
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                body,
                style: FontSizes.getContentStyle()
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ]),
        ),
        action,
      ],
    );
  }
}
