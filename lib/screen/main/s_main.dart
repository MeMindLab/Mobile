import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Text("main screen"),
      ),
    );
  }
}
