import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class CreateWishController extends GetxController {
  RxString imagePath1 = ''.obs;
  RxString imagePath2 = ''.obs;
  RxString imagePath3 = ''.obs;
  RxString purchaseCountry = ''.obs;
  RxString category = ''.obs;
  RxInt quantity = 1.obs;
  List imagepath = [];
  TextEditingController productNameController = TextEditingController();
  TextEditingController productUrlController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  Future getImage(RxString imagePath) async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
      imagepath.add(imagePath.value);
      print(imagePath.value);
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      quantity.value = checkQuantity(quantity.value + 1);
    } else {
      quantity.value = checkQuantity(quantity.value - 1);
    }
  }

  int checkQuantity(int quantity) {
    if ((quantity) < 0) {
      quantity = 0;
      return quantity;
    } else {
      return quantity;
    }
  }
}
