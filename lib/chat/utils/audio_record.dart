import 'dart:io';

import 'package:flutter/material.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class AudioRecord {
  late AudioRecorder _audioRecorder;

  AudioRecord() {
    _audioRecorder = AudioRecorder();
  }

  void recordStart(BuildContext context, Function function) async {
    Directory dir = await getApplicationDocumentsDirectory();

    if (await _audioRecorder.hasPermission()) {
      function();
      await _audioRecorder.start(
          const RecordConfig(
            sampleRate: 16000,
            encoder: AudioEncoder.wav,
          ),
          path: '${dir.path}/myFile.wav');
    } else {
      await openAppSettings().then((value) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MainScreen();
          }));
        }
      });
    }
  }

  Future<String?> recordStop() async {
    final path = await _audioRecorder.stop();
    await _audioRecorder.pause();
    await _audioRecorder.dispose();

    print(path);
    if (path != null) {
      return path;
    } else {
      return null;
    }
  }
}
