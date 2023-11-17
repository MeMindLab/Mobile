import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/component/root_tab.dart';
import 'package:me_mind/report/component/report_card.dart';
import 'package:me_mind/report/component/report_chart.dart';

class ReportDetailScreen extends StatefulWidget {
  const ReportDetailScreen({super.key});

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  @override
  void initState() {
    super.initState();

    setBottomIdx(1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "리포트",
      appBarActions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/icon/vitamin.svg'),
              const Text('10',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
      bottomNavigationBar: const RootTab(),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff2C3642),
            ),
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '주간 그래프',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: ReportChart(),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 20,
            thickness: 1,
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "2023.10",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SvgPicture.asset('assets/svg/icon/search.svg'),
            ],
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                renderReports(),
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
          keywords: ["키워드1", "키워드2", "키워드3"],
          summary:
              "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩...",
          date: '2023.10.31',
        );
      },
      childCount: 4,
    ),
  );
}
