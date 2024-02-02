import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_date_picker.dart';
import 'package:me_mind/report/view/f_date_picker_dialog.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/component/root_tab.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/component/report_chart.dart';
import 'package:me_mind/report/utils/reports.dart';
import 'package:me_mind/report/view/s_report_search.dart';
import 'package:intl/intl.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _Report();
}

class _Report extends State<Report> {
  String? date;

  @override
  void initState() {
    super.initState();

    setState(() {
      date = DateFormat("yyyy.MM").format(DateTime.now());
    });
    setBottomIdx(1);
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    //api 요청 http://54.206.203.208/report/2023-12-31

    var weekelyScores = [
      {"date": "2023-12-31", "score": "33"},
      {"date": "2023-12-30", "score": "0"},
      {"date": "2023-12-29", "score": "50"},
      {"date": "2023-12-28", "score": "78"},
      {"date": "2023-12-27", "score": "90"},
      {"date": "2023-12-26", "score": "95"},
      {"date": "2023-12-25", "score": "0"}
    ];

    //Fix: 백엔드 정렬 요청
    weekelyScores.sort((a, b) {
      DateTime dateA = DateTime.parse(a['date']!);
      DateTime dateB = DateTime.parse(b['date']!);
      return dateA.compareTo(dateB);
    });

    List<ReportData> reports = [
      ReportData(
        tags: ["키워드1", "키워드2"],
        ai_summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        tags: ["키워드1", "키워드2"],
        ai_summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        tags: ["키워드1", "키워드2"],
        ai_summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        tags: ["키워드1", "키워드2"],
        ai_summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
    ];

    return DefaultLayout(
      title: "리포트",
      appBarLeading: const BackArrowLeading(),
      bottomNavigationBar: const RootTab(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '최근 감정 흐름',
                        style: FontSizes.getHeadline1Style().copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.appColors.text,
                        ),
                      ),
                      const SizedBox(height: 36),
                      AspectRatio(
                        aspectRatio: 1.70,
                        child: ReportChart(
                          weekly: weekelyScores,
                        ),
                      ),
                    ],
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
                          Text(
                            date!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18.0,
                              color: Colors.black,
                            ),
                            onTap: () {
                              Dialogs(
                                      context: context,
                                      content: CustomDatePicker(
                                        selectedDate: DateTime.now(),
                                      ),
                                      contentPadding: EdgeInsets.zero)
                                  .callDateDialog();
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/svg/icon/search.svg'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ReportSearch()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: renderReports(reports),
          ),
        ],
      ),
    );
  }
}
