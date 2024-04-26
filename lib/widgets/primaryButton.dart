import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_text_style.dart';
import '../utils/colors.dart';
import '../utils/routes.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  double? width;
  double? height;
  PrimaryButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.height = 0,
      this.width = 0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width == 0 ? 305.w : width,
        height: height == 0 ? 50.h : height,
        decoration: BoxDecoration(
          color: ThemeColors.btnSignInSignUp,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(text, style: AppTextStyle.buttonText),
      ),
    );
  }
}
