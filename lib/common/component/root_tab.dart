import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/diary/view/s_diary.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:me_mind/report/view/s_report.dart';
import 'package:me_mind/settings/view/s_setting.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  Widget bottom(int idx, BuildContext context) {
    return BottomAppBar(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        color: Colors.transparent,
        height: 98.5,
        elevation: 0.0,
        // 바텀 앱바 흰색 테두리
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 바텀 앱바
              // 클릭 색상 Color.fromRGBO(255, 238, 151, 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      await setBottomIdx(0);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: ((BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) =>
                                const MainScreen()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color:
                            idx == 0 ? Color.fromRGBO(255, 238, 151, 1) : null,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          idx == 0
                              ? SvgPicture.asset('assets/svg/icon/home.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                                  width: 24,
                                  height: 24)
                              : SvgPicture.asset('assets/svg/icon/home.svg',
                                  width: 24, height: 24),
                          SizedBox(
                            height: 5,
                          ),
                          idx == 0
                              ? const Text('홈',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                              : const Text('홈',
                                  style: TextStyle(
                                      color: Color.fromRGBO(153, 153, 153, 1))),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await setBottomIdx(1);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: ((BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) =>
                                const Report()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color:
                            idx == 1 ? Color.fromRGBO(255, 238, 151, 1) : null,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          idx == 1
                              ? SvgPicture.asset('assets/svg/icon/home.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                                  width: 24,
                                  height: 24)
                              : SvgPicture.asset('assets/svg/icon/home.svg',
                                  width: 24, height: 24),
                          SizedBox(
                            height: 5,
                          ),
                          idx == 1
                              ? const Text('리포트',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                              : const Text('리포트',
                                  style: TextStyle(
                                      color: Color.fromRGBO(153, 153, 153, 1))),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await setBottomIdx(2);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: ((BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) =>
                                const Diary()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color:
                            idx == 2 ? Color.fromRGBO(255, 238, 151, 1) : null,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          idx == 2
                              ? SvgPicture.asset('assets/svg/icon/picture3.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                                  width: 24,
                                  height: 24)
                              : SvgPicture.asset('assets/svg/icon/picture3.svg',
                                  width: 24, height: 24),
                          SizedBox(
                            height: 5,
                          ),
                          idx == 2
                              ? const Text('그림일기',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                              : const Text('그림일기',
                                  style: TextStyle(
                                      color: Color.fromRGBO(153, 153, 153, 1))),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await setBottomIdx(3);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: ((BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) =>
                                const Settings()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color:
                            idx == 3 ? Color.fromRGBO(255, 238, 151, 1) : null,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          idx == 3
                              ? SvgPicture.asset('assets/svg/icon/setting.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                                  width: 24,
                                  height: 24)
                              : SvgPicture.asset('assets/svg/icon/setting.svg',
                                  width: 24, height: 24),
                          SizedBox(
                            height: 5,
                          ),
                          idx == 3
                              ? const Text('설정',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                              : const Text('설정',
                                  style: TextStyle(
                                      color: Color.fromRGBO(153, 153, 153, 1))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: getBottomIdx(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return bottom(snapshot.data, context);
          }
          return bottom(-1, context);
        });
  }
}
