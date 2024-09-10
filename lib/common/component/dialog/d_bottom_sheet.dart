import 'package:flutter/material.dart';

class BottomSheets {
  final BuildContext context;
  final TextAlign textAlign;
  final Widget bodies;
  final double? height;
  final bool? isBarrier;

  BottomSheets(
      {required this.context,
      this.textAlign = TextAlign.center,
      required this.bodies,
      this.isBarrier = false,
      this.height});

  show() async {
    await showModalBottomSheet(
        context: context,
        barrierColor: isBarrier == true ? Colors.black : Colors.transparent,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        useSafeArea: true,
        builder: (BuildContext context) {
          var deviceWidth = MediaQuery.of(context).size.width;
          return Container(
              width: deviceWidth,
              height: height ?? 280,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 1,
                      blurRadius: 3.0,
                      offset: Offset(0, -2), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: bodies));
        });
  }
}
