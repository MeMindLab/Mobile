import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
import 'dart:io';

class ImageDownloadService {
  Future downloadAndSaveImage(String imageUrl) async {
    await Permission.photos.request();

    try {
      var response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      final Uint8List imageData = Uint8List.fromList(response.data);
      String extractedPart = imageUrl.split('/drawing/').last;

      final result = await ImageGallerySaver.saveImage(imageData,
          quality: 80, name: extractedPart);
    } catch (e) {
      return null;
    }
  }
}
