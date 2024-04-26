import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_assets.dart';
import '../utils/app_text_style.dart';
import '../utils/colors.dart';

class WishModalButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;
  const WishModalButton(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        width: double.maxFinite,
        height: 50.h,
        decoration: BoxDecoration(
          color: ThemeColors.socialSignInButton,
          borderRadius: BorderRadius.all(
            Radius.circular(
              8.r,
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
            Container(
              padding: EdgeInsets.zero,
              width: 20.w,
              height: 20.h,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Text(
                'i',
                textAlign: TextAlign.center,
                style: AppTextStyle.userIntrest,
              ),
            )
          ],
        ),
      ),
    );
  }
}
