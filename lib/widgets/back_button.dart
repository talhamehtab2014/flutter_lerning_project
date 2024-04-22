import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_assets.dart';
import '../utils/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        alignment: Alignment.center,
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: ThemeColors.backButtonBackgroung,
          border: Border.all(color: ThemeColors.txtFieldBorderColor),
          image: const DecorationImage(
            image: AssetImage(AppAssets.icBackButton),
          ),
        ),
      ),
    );
  }
}
