import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/routes.dart';
import 'package:flutter_iwish_practice/widgets/continue_with.dart';
import 'package:flutter_iwish_practice/widgets/home_top_card.dart';
import 'package:flutter_iwish_practice/widgets/phn_text_field.dart';
import 'package:flutter_iwish_practice/widgets/primarysignInUpButton.dart';
import 'package:flutter_iwish_practice/widgets/social_login_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/colors.dart';

void _login() {
  Get.toNamed(Routes().getUserInterestPage());
}

class Login extends StatelessWidget {
  static const id = "/login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  'Welcome Back!',
                  style: AppTextStyle.header1,
                ),
                SizedBox(
                  height: 13.h,
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
                      PhoneTextField(),
                      SizedBox(
                        height: 34.h,
                      ),
                      PrimarySignInSignUp(onTap: _login, text: 'Login'),
                      SizedBox(
                        height: 30.h,
                      ),
                      ContinueWith(),
                      SizedBox(
                        height: 24.h,
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
                          const Text('Not A Member? '),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes().getSignUp());
                            },
                            child: Text(
                              'Join now',
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
        ],
      ),
    );
  }
}
