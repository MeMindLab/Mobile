import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/chat/utils/audio_record.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class Trash extends StatefulWidget {
  const Trash({super.key});

  @override
  State<Trash> createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  late AudioRecord audioRecord;
  String recordPath = "";
  bool isRecord = false;

  void getRecordPath() async {
    String? path = await audioRecord.recordStop();
    if (path != null) {
      setState(() {
        recordPath = path;
      });
    }
    print(path);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioRecord = AudioRecord();
    audioRecord.recordStart(context, () {
      setState(() {
        isRecord = true;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    getRecordPath();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return DefaultLayout(
      title: "감정 쓰레기통",
      foregroundColor: Colors.white,
      appBarBgColor: lightTheme.primaryColorDark,
      appBarLeading: Icon(Icons.keyboard_backspace),
      backgroundColor: lightTheme.primaryColorDark,
      child: Stack(
        children: [
          if (isRecord)
            Align(
              alignment: Alignment(0, -0.24),
              child: Image.asset(
                'assets/image/chat/micBg2.gif',
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
              ),
            ),
          Align(
            alignment: Alignment(0, -0.15),
            child: SvgPicture.asset('assets/svg/icon/mic.svg', width: 40),
          )
        ],
      ),
    );
  }
}
