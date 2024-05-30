import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/diary/component/community_picture.dart';

class DiaryCommunityFragment extends StatefulWidget {
  const DiaryCommunityFragment({super.key});

  @override
  State<DiaryCommunityFragment> createState() => _DiaryCommunityFragmentState();
}

class _DiaryCommunityFragmentState extends State<DiaryCommunityFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "커뮤니티",
                style: FontSizes.getHeadline1Style()
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Expanded(child: CustomScrollView(slivers: [diaryCommunityGridView()])),
      ],
    );
  }

  SliverPadding diaryCommunityGridView() {
    return SliverPadding(
      padding: EdgeInsets.only(left: 20, right: 20),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CommunityPicture(isShare: false);
            },
            childCount: 10,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 30,
            childAspectRatio: 0.9,
          )),
    );
  }
}
