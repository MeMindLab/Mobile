import 'package:flutter/material.dart';
import 'package:me_mind/component/bottomNav.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
      body: Column(
        children: [
          Text('3'),
        ],
      ),
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: const MyBottomNav(),
    );
  }
}
