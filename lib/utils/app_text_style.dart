import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTextStyle {
  static TextStyle header1 = TextStyle(
    color: ThemeColors.mainTitle,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle header2 = TextStyle(
    color: ThemeColors.subTitle,
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle errorFontStyle = TextStyle(
    color: ThemeColors.errorFontColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle header3 = TextStyle(
    color: ThemeColors.subTitle,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle otpTextStyle = TextStyle(
    fontSize: 18.sp,
    color: ThemeColors.otpTextColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cardMainTitle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ThemeColors.cardMainTitleColor,
  );
  static TextStyle cardSubTitle = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: ThemeColors.mainTitle,
  );
  static TextStyle otpResendText = TextStyle(
    //decoration: TextDecoration.underline,
    //decorationColor: ThemeColors.resendUnderLineColor,
    color: ThemeColors.resendTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle loginNowStyle = const TextStyle(
    color: ThemeColors.loginNowTextColor,
    decoration: TextDecoration.underline,
    decorationColor: ThemeColors.loginNowTextColor,
  );
  static TextStyle subtitle1 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: ThemeColors.cardMainTitleColor,
  );
  static TextStyle subtitle2 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w300,
    color: ThemeColors.cardMainTitleColor,
  );
  static TextStyle wishTitleStyle = TextStyle(
    color: ThemeColors.toggleSwitchInActiveButtonColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subtitle3 =
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400);
  static TextStyle bottomNavUnselectedLabelStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: ThemeColors.bottomNavUnSelectedLabelColor);
  static TextStyle bottomNavSelectedLabelStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: ThemeColors.mainTitle);
  static TextStyle wishModalStyle = TextStyle(
    fontSize: 18.sp,
    color: ThemeColors.mainTitle,
    fontWeight: FontWeight.w600,
  );
}
