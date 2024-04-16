import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_assets.dart';
import '../utils/app_text_style.dart';
import '../utils/colors.dart';

class WishModalButton extends StatelessWidget {
  final String iconPath;
  final String title;
  const WishModalButton(
      {super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      width: double.maxFinite,
      height: 50.h,
      decoration: BoxDecoration(
        color: ThemeColors.socialSignInButton,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.r,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(
              iconPath,
            ),
          ),
          Text(
            title,
            style: AppTextStyle.buttonText,
          ),
          const Icon(
            Icons.info_sharp,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
