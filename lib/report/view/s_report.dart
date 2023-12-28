import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/component/root_tab.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/component/report_card.dart';
import 'package:me_mind/report/component/report_chart.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _Report();
}

class _Report extends State<Report> {
  @override
  void initState() {
    super.initState();

    setBottomIdx(1);
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return DefaultLayout(
      title: "리포트",
      appBarLeading: const BackArrowLeading(),
      bottomNavigationBar: const RootTab(),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '최근 감정 흐름',
                    style: FontSizes.getHeadline1Style().copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF191919),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const AspectRatio(
                    aspectRatio: 1.70,
                    child: ReportChart(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Divider(
              thickness: 8,
              color: theme.appColors.divider,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "2023.10",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18.0,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                SvgPicture.asset('assets/svg/icon/search.svg'),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: renderReports(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

SliverList renderReports() {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, builder) {
        return const ReportCard(
          keywords: ["키워드1", "키워드2"],
          summary:
              "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩...",
          date: '2023.10.31',
        );
      },
      childCount: 4,
    ),
  );
}
