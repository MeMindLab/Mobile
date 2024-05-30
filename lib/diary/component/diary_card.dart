import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

class DiaryCard extends StatelessWidget {
  final String diaryTitle;
  final String diaryImage;
  final String heartCount;
  final String diaryDate;

  const DiaryCard(
      {super.key,
      required this.diaryTitle,
      required this.diaryImage,
      required this.heartCount,
      required this.diaryDate});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(
                diaryImage,
                fit: BoxFit.cover,
                width: 124,
                height: 124,
              )),
          const SizedBox(
            width: 11,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      diaryTitle,
                      style: FontSizes.getHeadline2Style()
                          .copyWith(fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    popUpMenu(),
                  ],
                ),
                Transform.translate(
                  offset: const Offset(0, -7),
                  child: Row(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/svg/icon/hearton.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.blueMain, BlendMode.srcIn),
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        heartCount,
                        style: FontSizes.getContentStyle()
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      diaryDate,
                      style: FontSizes.getContentStyle().copyWith(
                          fontWeight: FontWeight.w400, color: AppColors.gray7),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget popUpMenu() {
  List<String> menuList = ["공유 해제", "제목 수정", "AI 리포트 보기"];

  return Transform.translate(
    offset: const Offset(10, 0),
    child: PopupMenuButton(
        constraints: const BoxConstraints(maxHeight: 150, maxWidth: 132),
        offset: const Offset(0, 40),
        elevation: 0,
        padding: EdgeInsets.zero,
        color: lightTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onSelected: (value) {},
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
