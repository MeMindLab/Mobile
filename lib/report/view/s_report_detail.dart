import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/chat/utils/show_snackbar.dart';
import 'package:me_mind/common/component/dots_indicator.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/component/report_circular_chart.dart';
import 'package:me_mind/report/model/report_detail/report_detail_model.dart';
import 'package:me_mind/report/provider/report_detail_provider.dart';
import 'package:me_mind/report/services/image_download_service.dart';
import 'package:me_mind/report/type/emotion.dart';
import 'package:me_mind/report/w_capsule.dart';
import 'package:me_mind/report/w_emotion_card.dart';

class ReportDetail extends ConsumerStatefulWidget {
  final String conversationId;
  final String reportId;
  final String createdAt;
  const ReportDetail(
      {super.key,
      required this.conversationId,
      required this.reportId,
      required this.createdAt});

  @override
  ConsumerState<ReportDetail> createState() => _ReportDetailState();
}

class _ReportDetailState extends ConsumerState<ReportDetail> {
  bool diaryFolded = false;
  bool isLoaded = true;
  int imagesCnt = 1;
  late DateTime dateTime;
  @override
  void initState() {
    super.initState();
    dateTime = DateTime.parse(widget.createdAt);
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    Color keywordColor = Theme.of(context).cardColor;

    final detail = ref.watch(reportDetailProvider(ReportDetailParameter(
        reportId: widget.reportId, conversationId: widget.conversationId)));
    if (detail is ReportDetailLoading) {
      return DefaultLayout(
          title: "${dateTime.month}월 ${dateTime.day}일",
          appBarLeading: const BackArrowLeading(),
          backgroundColor: AppColors.blue1,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.blueMain,
            ),
          ));
    }
    if (detail is ReportDetailFailed) {
      return DefaultLayout(
          title: "${dateTime.month}월 ${dateTime.day}일",
          appBarLeading: const BackArrowLeading(),
          backgroundColor: AppColors.blue1,
          child: const Center(
            child: Text("리포트를 불러오지 못했습니다."),
          ));
    } else {
      final result = detail as ReportDetailModel;
      Map<String, dynamic> newEmotions = result.emotions!.toJson();
      List sortedEmotions = newEmotions.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      return DefaultLayout(
          title: "${dateTime.month}월 ${dateTime.day}일",
          appBarLeading: const BackArrowLeading(),
          backgroundColor: AppColors.blue1,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 26, 0, 26),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(19),
                      bottomRight: Radius.circular(19),
                    ),
                    color: theme.appColors.seedColor,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: const Alignment(-0.07, 0),
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: CustomCircularChart(
                                value: result.emotions!.totalScore!,
                                text:
                                    "${result.emotions!.totalScore!.toInt()}점",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 9.3,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: sortedEmotions.map((entry) {
                            EmotionType? emotionType;

                            switch (entry.key) {
                              case 'comfortable_percentage':
                                emotionType = EmotionType.comfortable;
                                break;
                              case 'happy_percentage':
                                emotionType = EmotionType.happiness;
                                break;
                              case 'sad_percentage':
                                emotionType = EmotionType.sadness;
                                break;
                              case 'joyful_percentage':
                                emotionType = EmotionType.excitement;
                                break;
                              case 'annoyed_percentage':
                                emotionType = EmotionType.pain;
                                break;
                              case 'lethargic_percentage':
                                emotionType = EmotionType.noFun;
                                break;
                              default:
                                emotionType = null;
                            }

                            if (emotionType == null) {
                              return const SizedBox.shrink();
                            }

                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 7, top: 5, bottom: 5),
                              child: EmotionCard(
                                emotionPercentage: entry.value,
                                emotionType: emotionType,
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  decoration: BoxDecoration(
                    color: theme.appColors.seedColor,
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
                          children: List.generate(
                              result.reportSummary!.tags!.length,
                              (index) => Capsule(
                                    keyword: result.reportSummary!.tags![index],
                                    color: keywordColor,
                                  )),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          result.reportSummary!.summary!,
                          style: FontSizes.getCapsuleStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  decoration: BoxDecoration(
                    color: theme.appColors.seedColor,
                  ),
                  width: double.infinity,
                  height: 274,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ai 그림일기',
                              style: FontSizes.getHighLightContentStyle(),
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 7),
                                const SizedBox(width: 5),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 199,
                                decoration: result.drawingDiary != null
                                    ? BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              result.drawingDiary!.imageUrl!,
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(8),
                                      )
                                    : null,
                                child: detail.drawingDiary == null
                                    ? Stack(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: AppColors.blackgray
                                                    .withOpacity(0.87)),
                                          ),
                                          const SizedBox(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: Center(
                                              child: CustomDotsIndicator(),
                                            ),
                                          )
                                        ],
                                      )
                                    : null,
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
                  decoration: BoxDecoration(
                    color: theme.appColors.seedColor,
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
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.gray7,
                                            BlendMode.srcIn,
                                          ),
                                        )
                                      : SvgPicture.asset(
                                          'assets/svg/icon/foldedBook.svg',
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.gray7,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      diaryFolded == false ? "접기" : "펼치기",
                                      style:
                                          FontSizes.getCapsuleHighlightStyle()
                                              .copyWith(
                                        color: AppColors.gray7,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    result.chatHistory!.length, (index) {
                                  if (result.chatHistory![index].isImage ==
                                      true) return Text("사진 $imagesCnt");
                                  setState(() {
                                    imagesCnt += 1;
                                  });
                                  if (result.chatHistory![index].role == "ai") {
                                    return Text(
                                        "ai : ${result.chatHistory![index].content}");
                                  } else {
                                    return Text(
                                        "나 : ${result.chatHistory![index].content}");
                                  }
                                }),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  decoration: BoxDecoration(
                    color: theme.appColors.seedColor,
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
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              children: List.generate(
                                  result.images!.take(4).length, (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(result.images![index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    }
  }
}
