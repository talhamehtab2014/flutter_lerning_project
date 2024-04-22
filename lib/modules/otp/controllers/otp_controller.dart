import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../utils/routes.dart';

class OtpController extends GetxController {
  late List<TextEditingController> controllers;
  late Timer _timer;
  late int _start;
  late RxBool _timerFinished;
  late RxString _timerText; // RxString for timerText
  get timerFinished => _timerFinished;
  late String pinCode;
  late RxBool pinCodeError;

  @override
  void onInit() {
    super.onInit();
    controllers = List.generate(5, (_) => TextEditingController());
    _start = 90;
    _timerFinished = false.obs;
    _timerText = ''.obs; // Initialize _timerText
    pinCode = '';
    pinCodeError = false.obs;
    _startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();

    super.onClose();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_start == 0) {
        timer.cancel();
        _timerFinished.value = true;
      } else {
        _start--;
        // Update timerText whenever _start changes
        _timerText.value = _formatTimerText();
      }
    });
  }

  // Getter for timerText
  RxString get timerText => _timerText;

  // Format the timer text as per your requirement
  String _formatTimerText() {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr = (seconds < 10) ? '0$seconds' : '$seconds';
    return '$minutesStr:$secondsStr';
  }

  void verifyOtp() {
    if (pinCode.length < 5) {
      pinCodeError.value = true;
    } else {
      pinCodeError.value = false;
      Get.toNamed(Routes().getLoginPage());
    }
  }

  void setPinCode() {
    pinCode = controllers.map((controller) => controller.text).join();
    print(pinCode);
  }
}
