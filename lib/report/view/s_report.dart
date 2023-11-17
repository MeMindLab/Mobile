import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/component/root_tab.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  void initState() {
    super.initState();

    setBottomIdx(1);
  }

  List<Color> gradientColors = [
    Colors.blue,
    Colors.lightBlue,
  ];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.black,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
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
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff2C3642),
                      ),
                      width: double.infinity,
                      height: 362.11,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/svg/report/resPoint.svg'),
                                    const Positioned(
                                        left: 15,
                                        top: 22,
                                        child: Text('80점',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16))),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('7.31 (월)',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18)),
                                      Text('#213123123 #213123123',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                      Text('#213123123 #213123123',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Divider(thickness: 2),
                            ),
                            AspectRatio(
                              aspectRatio: 1.70,
                              child: LineChart(
                                mainData(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff2C3642),
                      ),
                      width: 354,
                      height: 302.11,
                      child: const Column(),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff2C3642),
                      ),
                      width: 354,
                      height: 289.42,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Ai 그림일기',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 306,
                                height: 199,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/image/report/picture1.png"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: SvgPicture.asset(
                                    'assets/svg/icon/upload.svg',
                                    colorFilter: const ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff2C3642),
                      ),
                      width: 354,
                      height: 190.82,
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('일기 요약',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff2C3642),
                      ),
                      width: 354,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('오늘일기 전체보기',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: SvgPicture.asset(
                                    'assets/svg/icon/book.svg',
                                    colorFilter: const ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn)),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: const Column(
                              children: [
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
                                Text(
                                    "ai : 안녕하세요. 쏠봇 입니다. 7월31일 일기를 시작합니다. 오늘 하루는 어떠셨어요?"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff2C3642),
                      ),
                      width: 354,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('일기에 첨부한 사진',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: Column(
                              children: [
                                GridView.count(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    shrinkWrap: true,
                                    children: List.generate(4, (index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.4, color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://buffer.com/library/content/images/2023/10/free-images-for-commercial-use--20-.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }).toList()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
