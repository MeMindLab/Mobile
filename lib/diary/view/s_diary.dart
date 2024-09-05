import 'package:flutter/material.dart';
import 'package:me_mind/common/component/notification_message.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/diary/view/f_diary_community.dart';
import 'package:me_mind/diary/view/f_my_share_picture.dart';
import 'package:me_mind/diary/view/f_wait.dart';
import 'package:me_mind/diary/view/w_diary_floating_button.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  bool close = false;
  final ScrollController scrollController = ScrollController();
  void onMessageClose() {
    setState(() {
      close = true;
    });
  }

  void _scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      title: "그림일기",
      appBarLeading: BackArrowLeading(),
      // floatingActionButton: DiaryFloatingButton(scrollToTop: _scrollToTop),
      child: DiaryFragment(),
      // child: CustomScrollView(
      //   controller: scrollController,
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: close == false
      //           ? NotificationMessage(closeCallback: onMessageClose)
      //           : null,
      //     ),
      //     const SliverToBoxAdapter(
      //       child: MySharePictureFragment(),
      //     ),
      //     SliverToBoxAdapter(
      //       child: Container(
      //         height: 10,
      //         color: AppColors.blue1,
      //       ),
      //     ),
      //     const SliverToBoxAdapter(
      //       child: DiaryCommunityFragment(),
      //     )
      //   ],
      // ),
    );
  }
}
