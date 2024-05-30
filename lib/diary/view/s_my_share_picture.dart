import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/diary/view/f_all_share_picture.dart';

class MySharePictureScreen extends StatefulWidget {
  const MySharePictureScreen({super.key});

  @override
  State<MySharePictureScreen> createState() => _MySharePictureScreenState();
}

class _MySharePictureScreenState extends State<MySharePictureScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        title: "나의 공유 그림",
        appBarLeading: BackArrowLeading(),
        child: AllSharePictureFragment());
  }
}
