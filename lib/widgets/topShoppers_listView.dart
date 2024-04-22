import 'package:flutter/material.dart';
import 'package:flutter_iwish_practice/utils/app_assets.dart';
import 'package:flutter_iwish_practice/utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class TopShoppersListView extends StatelessWidget {
  const TopShoppersListView({super.key});

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
                'Top Shoppers',
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
        SizedBox(
          height: 92.h,
          child: Padding(
            padding: EdgeInsets.only(left: 23.w),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: 11.w,
                      ),
                      height: 67.h,
                      width: 67.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12.r,
                          ),
                        ),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppAssets.imgTopSeller),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Amanda',
                      style: AppTextStyle.subtitle3,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
