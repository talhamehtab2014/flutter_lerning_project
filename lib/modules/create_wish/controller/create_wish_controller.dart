import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';

class CreateWishController extends GetxController {
  List<XFile> imageList = [];
  final ImagePicker _picker = ImagePicker();
  Future getImages() async {
    List<XFile>? images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      imageList.addAll(images);
      update();
    }
  }
}
