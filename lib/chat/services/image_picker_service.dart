import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker imagePicker;

  ImagePickerService({required this.imagePicker});

  Future getImage(ImageSource imageSource) async {
    try {
      final XFile? pickedFile =
          await imagePicker.pickImage(source: imageSource);
      if (pickedFile?.path != null) {
        return File(pickedFile!.path);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
