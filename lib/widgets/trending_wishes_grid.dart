import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_iwish_practice/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingWishesGrid extends StatelessWidget {
  const TrendingWishesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Wishes',
                style: AppTextStyle.subtitle1,
              ),
              Row(
                children: [
                  Text(
                    'View all',
                    style: AppTextStyle.subtitle2,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 13.sp,
                    color: ThemeColors.subTitle,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        GridView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(index);
          },
        ),
      ],
    );
  }

  Widget _buildItem(int index) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: ThemeColors.socialSignInButton,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppAssets.imgTrendingWish,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Debenhams Purse',
            style: AppTextStyle.wishTitleStyle,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 8.h),
              alignment: Alignment.center,
              height: 38.h,
              decoration: BoxDecoration(
                color: ThemeColors.wishCardButtonColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text('Wish', style: AppTextStyle.buttonText),
            ),
          )
        ],
      ),
    );
  }
}
