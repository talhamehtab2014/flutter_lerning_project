import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_iwish_practice/utils/routes.dart';
import 'package:flutter_iwish_practice/widgets/back_button.dart';
import 'package:flutter_iwish_practice/widgets/home_top_card.dart';
import 'package:flutter_iwish_practice/widgets/primaryButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../utils/app_assets.dart';
import '../controllers/otp_controller.dart';

class OtpPage extends StatelessWidget {
  final otpController = Get.put(OtpController());
  static const id = "/otpPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return Stack(
            children: [
              const HomeTopCard(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 170.h,
                    ),
                    Image.asset(AppAssets.icWishHome),
                    SizedBox(
                      height: 47.h,
                    ),
                    Text(
                      'OTP',
                      style: AppTextStyle.header1,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Enter the 5-digits OTP sent to your registered mobile number',
                        style: AppTextStyle.header3,
                      ),
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: Column(
                        children: [
                          KeyboardListener(
                            focusNode: FocusNode(),
                            onKeyEvent: (KeyEvent event) {
                              if (event is KeyDownEvent &&
                                  event.logicalKey ==
                                      LogicalKeyboardKey.backspace) {
                                // Handle backspace key
                                for (int i =
                                        otpController.controllers.length - 1;
                                    i >= 0;
                                    i--) {
                                  if (otpController
                                      .controllers[i].text.isNotEmpty) {
                                    // Remove the digit in the current text field
                                    otpController.controllers[i].text = '';
                                    otpController.setPinCode();
                                    break;
                                  } else if (i > 0) {
                                    // Move focus to the previous text field
                                    FocusScope.of(context).previousFocus();
                                  }
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                5,
                                (index) => Container(
                                  padding: EdgeInsets.only(top: 15.h),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: otpController.pinCodeError.value
                                            ? ThemeColors.errorFontColor
                                            : ThemeColors.txtFieldBorderColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.r),
                                    ),
                                  ),
                                  width: 53.w,
                                  height: 76.h,
                                  child: TextField(
                                    showCursor: false,
                                    maxLength: 1,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    controller:
                                        otpController.controllers[index],
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    style: AppTextStyle.otpTextStyle,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        // Move focus to the next text field
                                        FocusScope.of(context).nextFocus();
                                        if (index == 4) {
                                          // Close the keyboard when the last digit is entered
                                          otpController.setPinCode();
                                          FocusScope.of(context).unfocus();
                                        }
                                      } else if (value.isEmpty)
                                        // Move focus to the previous text field if the digit is deleted
                                        FocusScope.of(context).previousFocus();
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
                          otpController.pinCodeError.value
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text('Invalid OTP code entered',
                                        style: AppTextStyle.errorFontStyle),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: 50.h,
                                ),
                          Text(
                              'Code expires in :${otpController.timerText.value} ',
                              style: AppTextStyle.header3),
                          SizedBox(
                            height: 36.h,
                          ),
                          otpController.timerFinished.value
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
                          PrimaryButton(
                              onTap: otpController.verifyOtp,
                              text: 'Verify OTP')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 25.w,
                top: 50.h,
                child: CustomBackButton(),
              ),
            ],
          );
        },
      ),
    );
  }
}
