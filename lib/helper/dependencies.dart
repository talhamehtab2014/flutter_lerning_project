import 'package:flutter_iwish_practice/modules/otp/controllers/otp_controller.dart';
import 'package:flutter_iwish_practice/modules/sign_up/controller/signUp_controller.dart';
import 'package:flutter_iwish_practice/widgets/phn_text_field.dart';
import 'package:get/instance_manager.dart';

Future<void> init() async {
  //repositories

  //controllers
  Get.lazyPut(() => OtpController());
  Get.lazyPut(() => SignUpController());
  Get.lazyPut(() => PhnTextFieldController());
}
