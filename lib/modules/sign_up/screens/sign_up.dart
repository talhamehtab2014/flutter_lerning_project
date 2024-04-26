import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/modules/sign_up/controller/signUp_controller.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_iwish_practice/widgets/continue_with.dart';
import 'package:flutter_iwish_practice/widgets/home_top_card.dart';
import 'package:flutter_iwish_practice/widgets/phn_text_field.dart';
import 'package:flutter_iwish_practice/widgets/primaryButton.dart';
import 'package:flutter_iwish_practice/widgets/social_login_button.dart';
import 'package:flutter_iwish_practice/widgets/wish_icon_sigin_signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../../utils/routes.dart';

class SignUp extends StatelessWidget {
  static const id = "/signUp";
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    final phnTextFieldController = Get.find<PhnTextFieldController>();
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
                    WishIconSignInSignUp(),
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
                          PhoneTextField(),
                          SizedBox(
                            height: 35.h,
                          ),
                          PrimaryButton(
                              onTap: () {
                                if (phnTextFieldController
                                        .controller.text.length ==
                                    13) {
                                  phnTextFieldController.savePhoneNumber();
                                  phnTextFieldController.controller
                                      .clear(); // Call savePhoneNumber here
                                  signUpController.signUp();
                                } else {
                                  phnTextFieldController.showError.value = true;
                                }
                              },
                              text: 'Sign up'),
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
                                onTap: () {
                                  Get.toNamed(Routes().getLoginPage());
                                },
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
              Positioned(
                right: 24.w,
                top: 60.h,
                child: FlutterSwitch(
                  showOnOff: true,
                  padding: 0,
                  valueFontSize: 11.sp,
                  activeIcon: Container(
                    padding: EdgeInsets.zero,
                    width: 32.w,
                    height: 22.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.r),
                        ),
                        color: ThemeColors.toggleSwitchActiveButtonColor),
                  ),
                  inactiveIcon: Container(
                    padding: EdgeInsets.zero,
                    width: 32.w,
                    height: 22.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        color: ThemeColors.toggleSwitchInActiveButtonColor),
                  ),
                  inactiveText: "AR  \u200B",
                  activeText: "   EN",
                  width: 75.w,
                  height: 28.h,
                  activeSwitchBorder: Border.all(
                      color: ThemeColors.toggleSwitchBorderColor,
                      width: 0.8.sp),
                  inactiveSwitchBorder: Border.all(
                      color: ThemeColors.toggleSwitchinActiveBorderColor,
                      width: 0.8.sp),
                  activeTextColor: ThemeColors.mainTitle,
                  activeTextFontWeight: FontWeight.w500,
                  inactiveTextFontWeight: FontWeight.w500,
                  toggleSize: 36.h,
                  value: signUpController.selectedIndex.value,
                  toggleColor: Colors.transparent,
                  activeColor: ThemeColors.toggleSwitchBgColor,
                  inactiveColor: ThemeColors.toggleSwitchBgColor,
                  onToggle: (val) {
                    //print(val.toString());
                    signUpController.selectedIndex.value = val;
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
