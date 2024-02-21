import 'dart:io';

import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class AudioRecord {
  late AudioRecorder _audioRecorder;

  AudioRecord() {
    _audioRecorder = AudioRecorder();
  }

  void recordStart() async {
    Directory dir = await getApplicationDocumentsDirectory();
    // print(dir);
    if (await _audioRecorder.hasPermission()) {
      await _audioRecorder.start(
          const RecordConfig(
            sampleRate: 16000,
            encoder: AudioEncoder.wav,
          ),
          path: '${dir.path}/myFile.wav');
    }
  }

  Future<String?> recordStop() async {
    final path = await _audioRecorder.stop();
    if (path != null) {
      return path;
    } else {
      return null;
    }
  }
}
