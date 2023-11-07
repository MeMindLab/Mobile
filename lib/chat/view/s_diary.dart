import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/view/root_tab.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  @override
  void initState() {
    super.initState();
    setBottomIdx(2);
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      child: Column(
        children: [
          Text('3'),
        ],
      ),
      bottomNavigationBar: RootTab(),
    );
  }
}
