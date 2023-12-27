import 'package:flutter/material.dart';

class CustomCheck extends StatelessWidget {
  final String leading;
  final String trailing;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  const CustomCheck(
      {super.key,
      this.leading = "",
      required this.trailing,
      required this.padding,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(leading),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue);
              },
            ),
            Text(trailing),
          ],
        ),
      ),
    );
  }
}
