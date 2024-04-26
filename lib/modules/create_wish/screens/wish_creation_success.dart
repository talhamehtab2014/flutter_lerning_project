import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/routes.dart';
import 'package:flutter_iwish_practice/widgets/primaryButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_text_style.dart';
import '../../../utils/colors.dart';

class WishCreationSuccess extends StatelessWidget {
  static const id = "/wishCreationSuccess";
  const WishCreationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(
              height: 56.5,
            ),
            Container(
              padding: EdgeInsets.only(top: 15.h, left: 15.w),
              width: 327.w,
              height: 66.h,
              decoration: BoxDecoration(
                color: ThemeColors.socialSignInButton,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '29 Verified Travellers are checking your',
                    style: AppTextStyle.wishSummaryDetaillabel,
                  ),
                  Text(
                    'wish at their listing now!',
                    style: AppTextStyle.cardMainTitle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 126.h,
            ),
            Image.asset(AppAssets.imgWishCompletionSuccessCard),
            SizedBox(
              height: 56.h,
            ),
            Text(
              'Thank You',
              style: AppTextStyle.thankyouStyle,
            ),
            Text(
              'Your wish has been placed successfully and you will get offers from verified travelers that are coming to your city',
              style: AppTextStyle.completionMessageStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 89.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Text(
                    'Check Delivery Offers',
                    style: AppTextStyle.CheckDeliveryOffers,
                  ),
                  Divider(
                    indent: 85.w,
                    endIndent: 85.w,
                    color: ThemeColors.checkDeliveryUnderlineColor,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 28.5.h,
            ),
            PrimaryButton(
              onTap: () {
                Get.toNamed(Routes().getBottomnavingation());
              },
              text: 'Back to Home',
              width: 327.w,
            )
          ],
        ),
      ),
    );
  }
}
