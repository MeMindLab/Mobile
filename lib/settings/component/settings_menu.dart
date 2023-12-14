import 'package:flutter/material.dart';

class SettingMenu extends StatelessWidget {
  final num height;
  final Widget content;
  final bool subscribe;
  const SettingMenu({
    Key? key,
    required this.height,
    required this.content,
    required this.subscribe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.toDouble(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: subscribe == false ? Colors.white : null,
          gradient: subscribe == true
              ? const LinearGradient(
                  colors: [
                    Color.fromRGBO(119, 181, 255, 1),
                    Color.fromRGBO(185, 216, 249, 1),
                    Color.fromRGBO(255, 254, 242, 1)
                  ],
                  begin: Alignment(-0.3, -0.8),
                  end: Alignment(1, 0.9),
                )
              : null),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: content,
      ),
    );
  }
}
