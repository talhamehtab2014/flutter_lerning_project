import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/app_assets.dart';
import '../utils/app_text_style.dart';
import '../utils/colors.dart';

class ImaggeUploadWidget extends StatelessWidget {
  ImaggeUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: const [5, 5],
      strokeCap: StrokeCap.round,
      radius: Radius.circular(8.r),
      color: ThemeColors.backButtonBorderColor,
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            SizedBox(
              height: 18.h,
            ),
            Image.asset(
              AppAssets.icFileUpload,
              width: 23.w,
              height: 23.h,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Upload',
              style: AppTextStyle.bottomNavSelectedLabelStyle,
            ),
            Text(
              "jpg or png",
              style: AppTextStyle.normalText,
            )
          ],
        ),
      ),
    );
  }
}
