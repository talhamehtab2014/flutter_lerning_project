import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_iwish_practice/widgets/wish_modal_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../utils/app_assets.dart';

class MakeWishModal extends StatelessWidget {
  const MakeWishModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(color: Color(0xFFCDCDCD).withOpacity(0.85)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: ThemeColors.backButtonBackgroung,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            padding: EdgeInsets.all(23.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'New Wish!',
                  style: AppTextStyle.wishModalStyle,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Select one of the options to start',
                  style: AppTextStyle.buttonText,
                ),
                SizedBox(
                  height: 19.h,
                ),
                WishModalButton(
                    iconPath: AppAssets.icWishStar, title: 'Create a wish'),
                SizedBox(
                  height: 15.h,
                ),
                WishModalButton(
                    iconPath: AppAssets.icTrendingflame,
                    title: 'Trending Wishes'),
                SizedBox(
                  height: 55.h,
                )
              ],
            ),
          ),
          Positioned(
            right: 23.w,
            top: 49.h,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 41.w,
                height: 41.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ThemeColors.backButtonBackgroung,
                  border: Border.all(color: ThemeColors.backButtonBorderColor),
                  // image: const DecorationImage(
                  //   image: AssetImage(AppAssets.icBackButton),
                  // ),
                ),
                child: Icon(
                  Icons.close,
                  color: ThemeColors.mainTitle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
