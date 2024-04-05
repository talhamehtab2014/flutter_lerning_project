import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_iwish_practice/widgets/home_top_card.dart';
import 'package:flutter_iwish_practice/widgets/phn_text_field.dart';
import 'package:flutter_iwish_practice/widgets/social_login_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const HomeTopCard(),
                  Positioned(
                    left: 240.w,
                    top: 60.h,
                    child: ToggleSwitch(
                      borderWidth: 0.8,
                      borderColor: const [ThemeColors.toggleSwitchBorderColor],
                      minWidth: 37.w,
                      minHeight: 28.h,
                      cornerRadius: 20.0,
                      dividerColor: Colors.transparent,
                      activeBgColors: const [
                        [ThemeColors.toggleSwitchInActiveButtonColor],
                        [ThemeColors.toggleSwitchActiveButtonColor]
                      ],
                      activeFgColor: Colors.transparent,
                      inactiveBgColor: ThemeColors.toggleSwitchActiveBgColor,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: ['En', 'Ar'],
                      radiusStyle: true,
                      onToggle: (index) {
                        //print('switched to: $index');
                      },
                    ),
                  ),
                ],
              ),
              Text(
                'Create Your Account',
                style: TextStyle(
                  color: ThemeColors.mainTitle,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
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
                      style: TextStyle(
                        color: ThemeColors.subTitle,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    PhoneTextField(),
                    SizedBox(
                      height: 35.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 305.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: ThemeColors.btnSignInSignUp,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          thickness: 1,
                          endIndent: 16.w,
                          color:
                              ThemeColors.dividerOrSIgnInWith.withOpacity(0.3),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          'Or Continue with',
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w400),
                        ),
                        Divider(
                          thickness: 1,
                          indent: 16.w,
                          color:
                              ThemeColors.dividerOrSIgnInWith.withOpacity(0.3),
                        ),
                      ],
                    ),
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
                          child: const Text(
                            'Login now',
                            style: TextStyle(
                                color: Colors.cyan,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.cyan),
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
      ),
    );
  }
}
