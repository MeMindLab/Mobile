import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
import 'dart:io';

class ImageDownloadService {
  Future downloadAndSaveImage(String imageUrl) async {
    // var status = await Permission.photos.request();
    await Permission.photos.request();
    // print(status);
    // if (status.isDenied) {
    //   openAppSettings();
    // }
    // if (!status.isGranted) {
    //   return;
    // }
    print(imageUrl);
    try {
      var response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      final Uint8List imageData = Uint8List.fromList(response.data);
      String extractedPart = imageUrl.split('/drawing/').last;

      final result = await ImageGallerySaver.saveImage(imageData,
          quality: 80, name: extractedPart);
      print('이미지가 갤러리에 저장되었습니다: $result');
    } catch (e) {
      print("실패");
      return null;
    }
  }
}