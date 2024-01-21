import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/component/report_circular_chart.dart';

import 'package:me_mind/report/type/emotion.dart';
import 'package:me_mind/report/w_capsule.dart';
import 'package:me_mind/report/w_emotion_card.dart';

class ReportDetail extends StatefulWidget {
  const ReportDetail({super.key});

  @override
  State<ReportDetail> createState() => _ReportDetailState();
}

class _ReportDetailState extends State<ReportDetail> {
  bool diaryFolded = false;

  @override
  void initState() {
    super.initState();

    setBottomIdx(1);
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    Color keywordColor = Theme.of(context).cardColor;

    return DefaultLayout(
      title: "10월 31일",
      appBarLeading: const BackArrowLeading(),
      backgroundColor: theme.appColors.reportBgColor,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 26, 0, 26),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(19),
                  bottomRight: Radius.circular(19),
                ),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    width: 150,
                    height: 150,
                    child: CustomCircularChart(
                      value: 80,
                      text: "80점",
                    ),
                  ),
                  const SizedBox(
                    height: 9.3,
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: EmotionCard(
                            emotionPercentage: 36.8,
                            emotionType: index % 2 == 0
                                ? EmotionType.excitement
                                : EmotionType.happiness,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '일기 요약',
                      style: FontSizes.getHighLightContentStyle(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      spacing: 5,
                      runSpacing: 10,
                      children: [
                        Capsule(
                          keyword: "계획대로",
                          color: keywordColor,
                        ),
                        Capsule(
                          keyword: "프로젝트 종료",
                          color: keywordColor,
                        ),
                        Capsule(
                          keyword: "콘텐츠",
                          color: keywordColor,
                        ),
                        Capsule(
                          keyword: "격려",
                          color: keywordColor,
                        ),
                        Capsule(
                          keyword: "집수리",
                          color: keywordColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "8월 1일, 화요일. 집수리 확인과 배란다 확장 작업, 그리고 무더위 속에서의 일상과 해커톤 프로젝트 준비 등을 어쩌구저쩌구,",
                      style: FontSizes.getCapsuleStyle(),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              width: double.infinity,
              height: 289.42,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ai 그림일기',
                      style: FontSizes.getHighLightContentStyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 199,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/image/report/ai_sample.png"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: SvgPicture.asset(
                              'assets/svg/icon/upload.svg',
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '일기 전체보기',
                            style: FontSizes.getHighLightContentStyle(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              diaryFolded = !diaryFolded;
                            });
                          },
                          child: Row(
                            children: [
                              diaryFolded == false
                                  ? SvgPicture.asset(
                                      'assets/svg/icon/book.svg',
                                    )
                                  : SvgPicture.asset(
                                      'assets/svg/icon/foldedBook.svg'),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  diaryFolded == false ? "접기" : "펼치기",
                                  style: FontSizes.getCapsuleHighlightStyle()
                                      .copyWith(
                                    color: theme.appColors.iconBook,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  diaryFolded == false
                      ? Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: const Column(
                            children: [
                              Text(
                                "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?",
                              ),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              Text(
                                  "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '일기에 첨부한 사진',
                        style: FontSizes.getHighLightContentStyle(),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        GridView.count(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          children: List.generate(4, (index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://buffer.com/library/content/images/2023/10/free-images-for-commercial-use--20-.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
