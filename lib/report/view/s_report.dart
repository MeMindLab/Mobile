import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_date_picker.dart';
import 'package:me_mind/common/constant/app_colors.dart';
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

    List<ReportData> reports = [
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
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
                          color: const Color(0xFF191919),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.82,
                          maxHeight: 165,
                        ),
                        child: const AspectRatio(
                          aspectRatio: 1.70,
                          child: ReportChart(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Divider(
                    thickness: 8,
                    color: theme.appColors.divider,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Dialogs(
                                  context: context,
                                  content: CustomDatePicker(
                                    selectedDate: DateTime.now(),
                                  ),
                                  contentPadding: EdgeInsets.zero)
                              .callDateDialog();
                        },
                        child: Row(
                          children: [
                            Text(
                              date!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        visualDensity: VisualDensity.compact,
                        icon: SvgPicture.asset('assets/svg/icon/search.svg'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ReportSearch()));
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
            sliver: renderReports(reports: reports, color: AppColors.blue3),
          ),
        ],
      ),
    );
  }
}
