import 'package:flutter/material.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/component/root_tab.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    super.initState();
    setBottomIdx(3);
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
          Text('4'),
        ],
      ),
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: const RootTab(),
    );
  }
}
