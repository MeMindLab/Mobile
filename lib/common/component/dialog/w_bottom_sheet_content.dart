import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class BottomSheetContent {
  List<Widget> termsAlert(
      {required String title, required String body, required Widget action}) {
    return [
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
    ];
  }

  List<Widget> permissionAlert({
    required String imgAddr,
    required String body,
    required List<Widget> actions,
  }) {
    return [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 11, 0, 10),
        child: Column(children: [
          SizedBox(
            width: 37,
            height: 37,
            child: Image.asset(
              imgAddr,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: 17,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: FontSizes.getContentStyle()
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ),
        ]),
      ),
      Column(
        children: actions,
      ),
    ];
  }
}
