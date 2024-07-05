import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/diary/component/community_picture.dart';
import 'package:me_mind/diary/component/tag_button.dart';

class DiaryCommunityFragment extends StatefulWidget {
  const DiaryCommunityFragment({super.key});

  @override
  State<DiaryCommunityFragment> createState() => _DiaryCommunityFragmentState();
}

class _DiaryCommunityFragmentState extends State<DiaryCommunityFragment> {
  Map<String, bool> tagList = {
    "감정 전체": true,
    "행복": false,
    "편안": false,
    "재미": false,
    "슬픔": false,
    "화남": false
  };
  String communityFilter = "인기순";

  void onfilterUpdate(String value) {
    setState(() {
      communityFilter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 17.0, bottom: 10),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: tagList.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TagButton(isSelect: entry.value, text: entry.key),
              );
            }).toList()),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Spacer(),
              popUpMenu(communityFilter, onfilterUpdate)
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          diaryCommunityGridView(),
        ],
      ),
    );
  }

  GridView diaryCommunityGridView() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 30,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, idx) {
        return CommunityPicture(isShare: false);
      },
      itemCount: 10,
    );
  }
}

Widget popUpMenu(String title, Function onPressed) {
  List<String> menuList = ["인기순", "최신순"];

  return Transform.translate(
    offset: const Offset(0, 0),
    child: PopupMenuButton(
        child: Row(children: [
          Text(
            title,
            style: FontSizes.getContentStyle()
                .copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            width: 2,
          ),
          SvgPicture.asset('assets/svg/chat/arrow_down.svg'),
        ]),
        constraints: const BoxConstraints(maxHeight: 150, maxWidth: 132),
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onSelected: (value) {
          onPressed(value);
        },
        itemBuilder: (context) {
          return [
            for (var item in menuList)
              PopupMenuItem(
                  height: 43,
                  value: item,
                  child: Center(
                    child: Text(
                      item,
                      style: FontSizes.getContentStyle()
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  )),
          ];
        }),
  );
}
