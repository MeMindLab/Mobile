import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/chat/view/s_diary.dart';
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
        color: Colors.black,
        height: 98.5,
        elevation: 0.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        idx == 0
                            ? SvgPicture.asset('assets/svg/icon/bar.svg',
                                colorFilter: ColorFilter.mode(
                                    Color(0xff959CD6), BlendMode.srcIn))
                            : SvgPicture.asset('assets/svg/icon/bar.svg',
                                colorFilter: ColorFilter.mode(
                                    Colors.black, BlendMode.srcIn)),
                      ],
                    ),
                    IconButton(
                        tooltip: '홈',
                        icon: idx == 0
                            ? SvgPicture.asset('assets/svg/icon/home.svg',
                                colorFilter: ColorFilter.mode(
                                    Color(0xff959CD6), BlendMode.srcIn),
                                width: 24,
                                height: 24)
                            : SvgPicture.asset('assets/svg/icon/home.svg',
                                width: 24, height: 24),
                        onPressed: () async {
                          await setBottomIdx(0);
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: ((BuildContext context,
                                        Animation<double> animation1,
                                        Animation<double> animation2) =>
                                    MainScreen()),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ));
                        }),
                    InkWell(
                      onTap: () async {
                        await setBottomIdx(0);
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: ((BuildContext context,
                                      Animation<double> animation1,
                                      Animation<double> animation2) =>
                                  MainScreen()),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ));
                      },
                      child: idx == 0
                          ? Text('홈',
                              style: TextStyle(
                                  color: Color(0xff959CD6),
                                  fontWeight: FontWeight.bold))
                          : Text('홈', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        idx == 1
                            ? SvgPicture.asset('assets/svg/icon/bar.svg',
                                colorFilter: ColorFilter.mode(
                                    Color(0xff959CD6), BlendMode.srcIn))
                            : SvgPicture.asset('assets/svg/icon/bar.svg',
                                colorFilter: ColorFilter.mode(
                                    Colors.black, BlendMode.srcIn)),
                      ],
                    ),
                    IconButton(
                        tooltip: '리포트',
                        icon: idx == 1
                            ? SvgPicture.asset('assets/svg/icon/report.svg',
                                colorFilter: ColorFilter.mode(
                                    Color(0xff959CD6), BlendMode.srcIn),
                                width: 24,
                                height: 24)
                            : SvgPicture.asset('assets/svg/icon/report.svg',
                                width: 24, height: 24),
                        onPressed: () async {
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
                        }),
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
                      child: idx == 1
                          ? Text('리포트',
                              style: TextStyle(
                                  color: Color(0xff959CD6),
                                  fontWeight: FontWeight.bold))
                          : Text('리포트', style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        idx == 2
                            ? SvgPicture.asset('assets/svg/icon/bar.svg',
                                colorFilter: ColorFilter.mode(
                                    Color(0xff959CD6), BlendMode.srcIn))
                            : SvgPicture.asset('assets/svg/icon/bar.svg',
                                colorFilter: ColorFilter.mode(
                                    Colors.black, BlendMode.srcIn)),
                      ],
                    ),
                    IconButton(
                        tooltip: '그림일기',
                        icon: idx == 2
                            ? SvgPicture.asset('assets/svg/icon/picture3.svg',
                                colorFilter: ColorFilter.mode(
                                    Color(0xff959CD6), BlendMode.srcIn),
                                width: 24,
                                height: 24)
                            : SvgPicture.asset('assets/svg/icon/picture3.svg',
                                width: 24, height: 24),
                        onPressed: () async {
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
                        }),
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
                      child: idx == 2
                          ? Text('그림일기',
                              style: TextStyle(
                                  color: Color(0xff959CD6),
                                  fontWeight: FontWeight.bold))
                          : Text('그림일기', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        idx == 3
                            ? SvgPicture.asset('assets/svg/icon/bar.svg',
                                colorFilter: ColorFilter.mode(
                                    Color(0xff959CD6), BlendMode.srcIn))
                            : SvgPicture.asset('assets/svg/icon/bar.svg',
                                colorFilter: ColorFilter.mode(
                                    Colors.black, BlendMode.srcIn)),
                      ],
                    ),
                    IconButton(
                        tooltip: '설정',
                        icon: idx == 3
                            ? SvgPicture.asset('assets/svg/icon/setting.svg',
                                colorFilter: ColorFilter.mode(
                                    Color(0xff959CD6), BlendMode.srcIn),
                                width: 24,
                                height: 24)
                            : SvgPicture.asset('assets/svg/icon/setting.svg',
                                width: 24, height: 24),
                        onPressed: () async {
                          await setBottomIdx(3);
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: ((BuildContext context,
                                        Animation<double> animation1,
                                        Animation<double> animation2) =>
                                    const Setting()),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ));
                        }),
                    InkWell(
                      onTap: () async {
                        await setBottomIdx(3);
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: ((BuildContext context,
                                      Animation<double> animation1,
                                      Animation<double> animation2) =>
                                  const Setting()),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ));
                      },
                      child: idx == 3
                          ? Text('설정',
                              style: TextStyle(
                                  color: Color(0xff959CD6),
                                  fontWeight: FontWeight.bold))
                          : Text('설정', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ],
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
