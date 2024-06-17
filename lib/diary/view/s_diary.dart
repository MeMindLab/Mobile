import 'package:flutter/material.dart';
import 'package:me_mind/common/component/notification_message.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/component/root_tab.dart';
import 'package:me_mind/diary/view/f_diary_community.dart';
import 'package:me_mind/diary/view/f_my_share_picture.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  bool close = false;

  void onMessageClose() {
    setState(() {
      close = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "그림일기",
      appBarLeading: const BackArrowLeading(),
      bottomNavigationBar: const RootTab(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: close == false
                ? NotificationMessage(closeCallback: onMessageClose)
                : null,
          ),
          const SliverToBoxAdapter(
            child: MySharePictureFragment(),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 10,
              color: AppColors.blue3,
            ),
          ),
          const SliverToBoxAdapter(
            child: DiaryCommunityFragment(),
          )
        ],
      ),
    );
  }
}
