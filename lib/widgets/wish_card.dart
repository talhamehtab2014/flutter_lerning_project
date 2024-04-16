import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_assets.dart';
import '../utils/app_text_style.dart';
import '../utils/colors.dart';
import 'make_wish_model.dart';

class WishCard extends StatelessWidget {
  const WishCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) {
            return const MakeWishModal();
          },
        );
        return;
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 17.w,
          top: 14.h,
        ),
        width: 156.w,
        height: 92.h,
        decoration: BoxDecoration(
          color: ThemeColors.wishCardBgColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppAssets.icWishStar),
            Text(
              'Make a Wish',
              style: AppTextStyle.cardMainTitle,
            ),
            Text(
              'Get Offshore Product',
              style: AppTextStyle.cardSubTitle,
            ),
          ],
        ),
      ),
    );
  }
}
