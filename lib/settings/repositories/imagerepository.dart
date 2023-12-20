import 'package:image_picker/image_picker.dart';

class ImagePickerRepository {
  final ImagePicker imagePicker;

  ImagePickerRepository({required this.imagePicker});

  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await imagePicker.pickImage(source: imageSource);

    try {
      if (pickedFile != null) {
        return pickedFile;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
