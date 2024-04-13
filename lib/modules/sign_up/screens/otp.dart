import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_iwish_practice/widgets/home_top_card.dart';
import 'package:flutter_iwish_practice/widgets/primarysignInUpButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/routes.dart';

class OtpPage extends StatefulWidget {
  static const id = "/otpPage";
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  List<TextEditingController> controllers =
      List.generate(5, (_) => TextEditingController());
  late Timer _timer;
  int _start = 90;
  bool _timerFinished = false;
  var pinCode = '';
  bool pinCodeError = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_start == 0) {
        timer.cancel();
        setState(() {
          _timerFinished = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _verifyOtp() {
    if (pinCode.length < 5) {
      setState(() {
        pinCodeError = true;
      });
    } else {
      setState(() {
        pinCodeError = false;
      });
    }
  }

  String get timerText {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr = (seconds < 10) ? '0$seconds' : '$seconds';
    return '$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                const HomeTopCard(),
                Positioned(
                  left: 25.w,
                  top: 50.h,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: ThemeColors.backButtonBackgroung,
                        border: Border.all(
                            color: ThemeColors.backButtonBorderColor),
                        image: const DecorationImage(
                          image: AssetImage(AppAssets.icBackButton),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                children: [
                  Text(
                    'OTP',
                    style: AppTextStyle.header1,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Enter the 5-digits OTP sent to your registered mobile number',
                    style: AppTextStyle.header3,
                  ),
                  SizedBox(
                    height: 29.h,
                  ),
                  RawKeyboardListener(
                    focusNode: FocusNode(),
                    onKey: (RawKeyEvent event) {
                      if (event is KeyDownEvent &&
                          event.logicalKey == LogicalKeyboardKey.backspace) {
                        // Handle backspace key
                        for (int i = controllers.length - 1; i >= 0; i--) {
                          if (controllers[i].text.isNotEmpty) {
                            // Remove the digit in the current text field
                            controllers[i].text = '';
                            break;
                          } else if (i > 0) {
                            // Move focus to the previous text field
                            FocusScope.of(context).previousFocus();
                          }
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: pinCodeError
                                    ? ThemeColors.errorFontColor
                                    : ThemeColors.txtFieldBorderColor),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          width: 50,
                          child: TextField(
                            showCursor: false,
                            maxLength: 1,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            controller: controllers[index],
                            keyboardType: TextInputType.number,
                            style: AppTextStyle.otpTextStyle,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              if (value.length == 1) {
                                // Move focus to the next text field
                                FocusScope.of(context).nextFocus();
                                if (index == 4) {
                                  // Close the keyboard when the last digit is entered
                                  pinCode = controllers
                                      .map((controller) => controller.text)
                                      .join();
                                  print(pinCode);
                                  FocusScope.of(context).unfocus();
                                }
                              } else if (value.isEmpty) {
                                // Move focus to the previous text field if the digit is deleted
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            decoration: const InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  pinCodeError
                      ? Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text('Invalid OTP code entered',
                                style: AppTextStyle.errorFontStyle),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 50.h,
                        ),
                  Text('Code expires in :$timerText ',
                      style: AppTextStyle.header3),
                  SizedBox(
                    height: 36.h,
                  ),
                  _timerFinished
                      ? GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                'Resend',
                                style: AppTextStyle.otpResendText,
                              ),
                              Divider(
                                indent: 125.w,
                                endIndent: 125.w,
                                thickness: 1.5.h,
                                color: ThemeColors.resendUnderLineColor,
                              )
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Text(
                              'Resend',
                              style: AppTextStyle.otpResendText
                                  .copyWith(color: Colors.grey),
                            ),
                            Divider(
                              indent: 125.w,
                              endIndent: 125.w,
                              thickness: 1.5.h,
                              color: ThemeColors.resendUnderLineColor,
                            )
                          ],
                        ),
                  SizedBox(
                    height: 56.h,
                  ),
                  PrimarySignInSignUp(onTap: _verifyOtp, text: 'Verify OTP')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
