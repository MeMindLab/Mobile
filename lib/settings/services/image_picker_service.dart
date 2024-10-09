import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker imagePicker;

  ImagePickerService({required this.imagePicker});

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await imagePicker.pickImage(source: imageSource);

    try {
      if (pickedFile?.path != null) {
        return File(pickedFile!.path);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
