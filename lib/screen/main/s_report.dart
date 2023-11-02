import 'package:flutter/material.dart';
import 'package:me_mind/component/bottomNav.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
          Text('2'),
        ],
      ),
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: const MyBottomNav(),
    );
  }
}
