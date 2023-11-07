import 'package:flutter/material.dart';
import 'package:me_mind/app.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/screen/main/s_report.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  Widget bottom(int idx, BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      height: 98.5,
      elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: '홈',
                icon: idx == 0 ? Image.asset('assets/image/bottomNav/home.png', width: 24, height: 24) : Image.asset('assets/image/bottomNav/home.png', width: 24, height: 24),
                onPressed: () async {
                  await setBottomIdx(0);
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: ((BuildContext context,
                            Animation<double> animation1,
                            Animation<double> animation2) =>
                        const MyApp()),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      )
                  );
                }
              ),
              idx == 0 ? Text('홈', style: TextStyle(color: Colors.white)) : Text('홈', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: 'ai 리포트',
                icon: idx == 1 ? Image.asset('assets/image/bottomNav/report.png', width: 24, height: 24) : Image.asset('assets/image/bottomNav/report.png', width: 24, height: 24),
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
                      )
                  );
                }
              ),
              idx == 1 ? Text('ai 리포트', style: TextStyle(color: Colors.white)) : Text('ai 리포트', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: 'ai 그림일기',
                icon: idx == 2 ? Image.asset('assets/image/bottomNav/diary.png', width: 24, height: 24) : Image.asset('assets/image/bottomNav/diary.png', width: 24, height: 24),
                onPressed: () async {
                  await setBottomIdx(2);
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: ((BuildContext context,
                            Animation<double> animation1,
                            Animation<double> animation2) =>
                        const MyApp()),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      )
                  );
                }
              ),
              idx == 2 ? Text('ai 그림일기', style: TextStyle(color: Colors.white)) : Text('ai 일기그림', style: TextStyle(color: Colors.white)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: '설정',
                icon: idx == 3 ? Image.asset('assets/image/bottomNav/setting.png', width: 24, height: 24) : Image.asset('assets/image/bottomNav/setting.png', width: 24, height: 24),
                onPressed: () async {
                  await setBottomIdx(3);
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: ((BuildContext context,
                            Animation<double> animation1,
                            Animation<double> animation2) =>
                        const MyApp()),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      )
                  );
                }
              ),
              idx == 3 ? Text('설정', style: TextStyle(color: Colors.white)) : Text('설정', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
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
      }
    );
  }
}