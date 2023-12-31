import 'package:flutter/material.dart';
import 'package:me_mind/component/bottomNav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
      body: const Column(
        children: [
          Text('1'),
        ],
      ),
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: const MyBottomNav(),
    );
  }
}
