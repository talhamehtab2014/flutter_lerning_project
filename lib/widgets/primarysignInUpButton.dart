import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_text_style.dart';
import '../utils/colors.dart';
import '../utils/routes.dart';

class PrimarySignInSignUp extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const PrimarySignInSignUp(
      {super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 305.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: ThemeColors.btnSignInSignUp,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(text, style: AppTextStyle.buttonText),
      ),
    );
  }
}
