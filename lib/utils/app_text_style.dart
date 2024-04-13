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
  static TextStyle otpResendText = TextStyle(
    //decoration: TextDecoration.underline,
    //decorationColor: ThemeColors.resendUnderLineColor,
    color: ThemeColors.resendTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static const subtitle1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const subtitle2 = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const subtitle3 = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  static const body1 = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
}
