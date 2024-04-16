import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_assets.dart';
import '../utils/app_text_style.dart';
import '../utils/colors.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 17.w,
        top: 14.h,
      ),
      width: 156.w,
      height: 92.h,
      decoration: BoxDecoration(
        color: ThemeColors.tripCardBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.icFlightTrip),
          Text(
            'Travelling?',
            style: AppTextStyle.cardMainTitle,
          ),
          Text(
            'Add Trip and Earn',
            style: AppTextStyle.cardSubTitle,
          ),
        ],
      ),
    );
  }
}
