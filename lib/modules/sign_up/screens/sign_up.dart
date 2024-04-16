import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_iwish_practice/widgets/continue_with.dart';
import 'package:flutter_iwish_practice/widgets/home_top_card.dart';
import 'package:flutter_iwish_practice/widgets/phn_text_field.dart';
import 'package:flutter_iwish_practice/widgets/primarysignInUpButton.dart';
import 'package:flutter_iwish_practice/widgets/social_login_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../utils/routes.dart';

void _signUp() {
  Get.toNamed(Routes().getOtpPage());
}

class SignUp extends StatelessWidget {
  static const id = "/signUp";
  const SignUp({super.key});

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
                  right: 24.w,
                  top: 60.h,
                  child: ToggleSwitch(
                    borderWidth: 0.8,
                    borderColor: const [ThemeColors.toggleSwitchBorderColor],
                    minWidth: 37.w,
                    minHeight: 30.h,
                    centerText: true,
                    cornerRadius: 20.0,
                    dividerColor: Colors.transparent,
                    activeBgColors: const [
                      [ThemeColors.toggleSwitchInActiveButtonColor],
                      [ThemeColors.toggleSwitchActiveButtonColor]
                    ],
                    activeFgColor: Colors.transparent,
                    inactiveBgColor: ThemeColors.toggleSwitchBgColor,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    labels: const ['EN', 'AR'],
                    radiusStyle: true,
                    onToggle: (index) {
                      //print('switched to: $index');
                    },
                  ),
                ),
              ],
            ),
            Text('Create Your Account', style: AppTextStyle.header1),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                children: [
                  Text(
                      textAlign: TextAlign.center,
                      'Enter you registered mobile number and\n verify OTP to login',
                      style: AppTextStyle.header2),
                  SizedBox(
                    height: 40.h,
                  ),
                  const PhoneTextField(),
                  SizedBox(
                    height: 35.h,
                  ),
                  const PrimarySignInSignUp(onTap: _signUp, text: 'Sign up'),
                  SizedBox(
                    height: 30.h,
                  ),
                  const ContinueWith(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialLoginButton(
                        icon: AppAssets.icGoogleSignUp,
                      ),
                      SocialLoginButton(
                        icon: AppAssets.icAppleSignUp,
                      ),
                      SocialLoginButton(
                        icon: AppAssets.icFacebookSignUp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('A Member? '),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Login now',
                          style: AppTextStyle.loginNowStyle,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
