import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0.0,
      title: Row(
        children: [
          Text('Hello, Khalid', style: AppTextStyle.header1),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            AppAssets.icChatRoundedDot,
            height: 19.h,
            width: 19.w,
          ),
        ),
        SizedBox(
          width: 7.w,
        ),
        Stack(
          children: [
            const Icon(
              opticalSize: 19,
              fill: 1,
              Icons.notifications_none_outlined,
              color: ThemeColors.otpTextColor,
              size: 20,
            ),
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                padding: EdgeInsets.zero,
                width: 12.w,
                height: 12.h,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Icon(
                  Icons.circle,
                  size: 5,
                  color: ThemeColors.errorFontColor,
                ),
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            // Get.toNamed(RoutesHelper.getProfilePage());
          },
          child: Container(
            height: 41.h,
            width: 41.w,
            margin: EdgeInsets.symmetric(horizontal: 23.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r))),
            child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15.r,
                  ),
                ),
                child: Image.asset(AppAssets.profileAvatar)),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.h);
}
