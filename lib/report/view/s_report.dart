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

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "리포트",
      appBarActions: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
          child: Text('10',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
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
                        color: Color(0xff2C3642),
                      ),
                      width: 354,
                      height: 302.11,
                      child: Column(),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2C3642),
                      ),
                      width: 354,
                      height: 289.42,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                            child: Align(
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
                                  image: DecorationImage(
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
                                    colorFilter: ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2C3642),
                      ),
                      width: 354,
                      height: 190.82,
                      child: Column(
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
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2C3642),
                      ),
                      width: 354,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
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
                                padding: EdgeInsets.only(right: 20),
                                child: SvgPicture.asset(
                                    'assets/svg/icon/book.svg',
                                    colorFilter: ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn)),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: Column(
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
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2C3642),
                      ),
                      width: 354,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
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
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                                          image: DecorationImage(
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
