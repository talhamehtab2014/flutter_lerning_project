import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

import '../../../utils/routes.dart';

class SignUpController extends GetxController {
  var selectedIndex = false.obs;
  @override
  void onClose() {
    super.onClose();
  }

  void signUp() {
    Get.toNamed(Routes().getOtpPage());
  }
}
